import 'package:conecta_lactare/data/model/mock/mock_data.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../../components/common.dart';

class GestorAuditoriaScreen extends StatelessWidget {
  const GestorAuditoriaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Auditoria',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 22,
              color: AppColors.brandDark,
            ),
          ),
          const Text(
            'Histórico de ações realizadas na plataforma.',
            style: TextStyle(fontSize: 12, color: AppColors.brand),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: MockData.auditoria.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, i) {
                final log = MockData.auditoria[i];
                return ClCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${log.autor} — ${log.acao}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.brandDark,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        log.alvo,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.brand,
                        ),
                      ),
                      Text(
                        log.dataHora,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.brand,
                        ),
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
