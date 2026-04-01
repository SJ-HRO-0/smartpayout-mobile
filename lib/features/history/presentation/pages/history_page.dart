import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Consulta tus transacciones registradas.',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF475569),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total transacciones',
                        style: TextStyle(color: Color(0xFF64748B)),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '5',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Enero 2026',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2563EB),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const _HistoryItem(
            title: 'Bus 001 · 12 de Octubre',
            amount: '\$0.35',
            date: '29/01/2026 · 14:35:22',
            method: 'QR',
            status: 'Aprobada',
          ),
          const SizedBox(height: 12),
          const _HistoryItem(
            title: 'Bus 832 · Eloy Alfaro',
            amount: '\$0.50',
            date: '29/01/2026 · 11:20:15',
            method: 'NFC',
            status: 'Aprobada',
          ),
          const SizedBox(height: 12),
          const _HistoryItem(
            title: 'Bus 145 · Corredor Central',
            amount: '\$1.00',
            date: '28/01/2026 · 18:45:30',
            method: 'QR',
            status: 'Rechazada',
          ),
        ],
      ),
    );
  }
}

class _HistoryItem extends StatelessWidget {
  final String title;
  final String amount;
  final String date;
  final String method;
  final String status;

  const _HistoryItem({
    required this.title,
    required this.amount,
    required this.date,
    required this.method,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final isApproved = status == 'Aprobada';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    method == 'QR' ? Icons.qr_code_2 : Icons.nfc,
                    color: method == 'QR'
                        ? const Color(0xFF2563EB)
                        : const Color(0xFF9333EA),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        date,
                        style: const TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Método: $method',
                        style: const TextStyle(
                          color: Color(0xFF475569),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      amount,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isApproved
                            ? const Color(0xFFDCFCE7)
                            : const Color(0xFFFEE2E2),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: isApproved
                              ? const Color(0xFF166534)
                              : const Color(0xFFB91C1C),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}