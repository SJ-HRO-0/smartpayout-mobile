import 'package:smartpayut_mobile/features/wallet/data/models/transaction_item.dart';
import 'package:smartpayut_mobile/features/wallet/data/repositories/wallet_repository.dart';
import 'package:smartpayut_mobile/shared/models/app_user.dart';

class MockWalletRepository implements WalletRepository {
  const MockWalletRepository();

  @override
  Future<double> getAvailableBalance(AppUser user) async {
    if (_shouldUseSeedData(user)) {
      return 12.40;
    }

    return 0.00;
  }

  @override
  Future<List<TransactionItem>> getTransactions(AppUser user) async {
    if (_shouldUseSeedData(user)) {
      return [
        TransactionItem(
          id: 'tx-001',
          title: 'Bus 001',
          subtitle: '12 de Octubre',
          amount: 0.35,
          date: DateTime(2026, 4, 10, 7, 45),
          method: 'QR',
          status: 'Completado',
        ),
        TransactionItem(
          id: 'tx-002',
          title: 'Bus 832',
          subtitle: 'Eloy Alfaro',
          amount: 0.35,
          date: DateTime(2026, 4, 9, 18, 10),
          method: 'NFC',
          status: 'Completado',
        ),
        TransactionItem(
          id: 'tx-003',
          title: 'Bus 145',
          subtitle: 'Corredor Central',
          amount: 0.35,
          date: DateTime(2026, 4, 8, 12, 20),
          method: 'QR',
          status: 'Completado',
        ),
        TransactionItem(
          id: 'tx-004',
          title: 'Bus 204',
          subtitle: 'La Marín',
          amount: 0.35,
          date: DateTime(2026, 4, 7, 8, 05),
          method: 'NFC',
          status: 'Completado',
        ),
        TransactionItem(
          id: 'tx-005',
          title: 'Bus 517',
          subtitle: 'Quitumbe',
          amount: 0.35,
          date: DateTime(2026, 4, 6, 17, 40),
          method: 'QR',
          status: 'Completado',
        ),
      ];
    }

    return [];
  }

  bool _shouldUseSeedData(AppUser user) {
    final email = user.email.trim().toLowerCase();

    return email == 'demo@smartpayout.com' ||
        email == 'admin@smartpayout.com' ||
        email == 'operator@smartpayout.com' ||
        email.contains('demo');
  }
}