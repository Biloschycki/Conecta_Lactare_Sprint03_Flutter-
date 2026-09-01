import 'package:flutter/material.dart';

import '../../../data/mock/mock_data.dart';
import '../../../theme/app_theme.dart';
import '../../components/common.dart';

class GestorConteudoScreen extends StatelessWidget {
  const GestorConteudoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Conteúdo educativo (CMS)',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 22,
              color: AppColors.brandDark,
            ),
          ),
          const Text(
            'Gestão de artigos exibidos às doadoras.',
            style: TextStyle(fontSize: 12, color: AppColors.brand),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: MockData.conteudos.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, i) {
                final c = MockData.conteudos[i];
                return ClCard(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              c.titulo,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.brandDark,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '${c.tempoLeituraMin} min de leitura',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.brand,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ClBadge(c.categoria),
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
