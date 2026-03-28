import 'package:go_router/go_router.dart';
import 'package:smartpayut_mobile/features/auth/login_page.dart';
import 'package:smartpayut_mobile/features/home/home_page.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ],
);