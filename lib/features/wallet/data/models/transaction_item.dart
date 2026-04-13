class TransactionItem {
  final String id;
  final String title;
  final String subtitle;
  final double amount;
  final DateTime date;
  final String method;
  final String status;

  const TransactionItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.date,
    required this.method,
    required this.status,
  });
}