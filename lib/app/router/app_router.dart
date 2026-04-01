import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smartpayut_mobile/app/router/route_names.dart';
import 'package:smartpayut_mobile/app/router/route_paths.dart';
import 'package:smartpayut_mobile/features/auth/presentation/controllers/auth_controller.dart';
import 'package:smartpayut_mobile/features/auth/presentation/pages/login_page.dart';
import 'package:smartpayut_mobile/features/history/presentation/pages/history_page.dart';
import 'package:smartpayut_mobile/features/home/presentation/pages/home_page.dart';
import 'package:smartpayut_mobile/features/payments/presentation/pages/payments_page.dart';
import 'package:smartpayut_mobile/features/profile/presentation/pages/profile_page.dart';
import 'package:smartpayut_mobile/shared/widgets/main_shell_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: RoutePaths.login,
    redirect: (context, state) {
      final isLoggedIn = authState != null;
      final isLoginRoute = state.matchedLocation == RoutePaths.login;

      if (!isLoggedIn && !isLoginRoute) {
        return RoutePaths.login;
      }

      if (isLoggedIn && isLoginRoute) {
        return RoutePaths.home;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: RoutePaths.login,
        name: RouteNames.login,
        builder: (context, state) => const LoginPage(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainShellPage(child: child),
        routes: [
          GoRoute(
            path: RoutePaths.home,
            name: RouteNames.home,
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: RoutePaths.payments,
            name: RouteNames.payments,
            builder: (context, state) => const PaymentsPage(),
          ),
          GoRoute(
            path: RoutePaths.history,
            name: RouteNames.history,
            builder: (context, state) => const HistoryPage(),
          ),
          GoRoute(
            path: RoutePaths.profile,
            name: RouteNames.profile,
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
    ],
  );
});