import 'package:flutter/material.dart';

import '../../../data/mock/mock_data.dart';
import '../../../theme/app_theme.dart';
import '../../components/common.dart';

class GestorDoadorasScreen extends StatelessWidget {
  const GestorDoadorasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final doadoras = MockData.todasDoadoras();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Doadoras',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 22,
              color: AppColors.brandDark,
            ),
          ),
          Text(
            '${doadoras.length} cadastradas na plataforma.',
            style: const TextStyle(fontSize: 12, color: AppColors.brand),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: doadoras.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, i) {
                final d = doadoras[i];
                return ClCard(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              d.nome,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.brandDark,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              d.email,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.brand,
                              ),
                            ),
                            Text(
                              '${d.cidade}/${d.estado}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.brand,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ClBadge(
                        d.statusAvaliacao.label,
                        tone: d.statusAvaliacao.toBadgeTone(),
                      ),
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
