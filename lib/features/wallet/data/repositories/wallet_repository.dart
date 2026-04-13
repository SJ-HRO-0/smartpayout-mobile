import 'package:smartpayut_mobile/features/wallet/data/models/transaction_item.dart';
import 'package:smartpayut_mobile/shared/models/app_user.dart';

abstract class WalletRepository {
  Future<double> getAvailableBalance(AppUser user);
  Future<List<TransactionItem>> getTransactions(AppUser user);
}