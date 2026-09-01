import 'package:flutter/material.dart';

import '../../../data/mock/mock_data.dart';
import '../../../theme/app_theme.dart';
import '../../components/common.dart';

class GestorColetasScreen extends StatelessWidget {
  const GestorColetasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final coletas = [...MockData.coletas]
      ..sort((a, b) => b.dataAgendada.compareTo(a.dataAgendada));
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Coletas da plataforma',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 22,
              color: AppColors.brandDark,
            ),
          ),
          const Text(
            'Todas as coletas sinalizadas pelas doadoras.',
            style: TextStyle(fontSize: 12, color: AppColors.brand),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: coletas.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, i) {
                final c = coletas[i];
                return ClCard(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              c.banco.nome,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.brandDark,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              c.dataAgendada.replaceAll('T', ' '),
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.brand,
                              ),
                            ),
                            Text(
                              c.modalidade.label,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.brand,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ClBadge(c.status.label, tone: c.status.toBadgeTone()),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
