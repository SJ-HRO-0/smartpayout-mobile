import 'package:flutter/material.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccionar método de pago'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Elige el método de pago que prefieras para realizar tu transacción.',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF475569),
            ),
          ),
          const SizedBox(height: 20),
          _PaymentOptionCard(
            icon: Icons.qr_code_2,
            title: 'Pagar con QR',
            subtitle: 'Base visual de Sprint 1',
            accentColor: const Color(0xFF2563EB),
          ),
          const SizedBox(height: 16),
          _PaymentOptionCard(
            icon: Icons.nfc,
            title: 'Pagar con NFC',
            subtitle: 'Base visual de Sprint 1',
            accentColor: const Color(0xFF9333EA),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFBFDBFE)),
            ),
            child: const Text(
              'Nota: Estas pantallas quedan preparadas como base para los flujos de pago que se completarán en sprints posteriores.',
              style: TextStyle(
                color: Color(0xFF1E3A8A),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color accentColor;

  const _PaymentOptionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}