import 'package:flutter/material.dart';

import '../../../data/mock/mock_data.dart';
import '../../../data/model/models.dart';
import '../../../theme/app_theme.dart';
import '../../components/common.dart';

class GestorVisaoGeralScreen extends StatelessWidget {
  const GestorVisaoGeralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final doadoras = MockData.todasDoadoras();
    final aprovadas = doadoras
        .where((d) => d.statusAvaliacao == StatusAvaliacao.aprovada)
        .length;
    final pendentes = doadoras
        .where((d) => d.statusAvaliacao == StatusAvaliacao.pendente)
        .length;
    final litros = MockData.totalLitrosPlataforma();
    final coletasConcluidas = MockData.coletas
        .where((c) => c.status == StatusColeta.concluida)
        .length;
    final conversao = (aprovadas / doadoras.length * 100).toInt();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Visão geral',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 22,
              color: AppColors.brandDark,
            ),
          ),
          const Text(
            'Indicadores da plataforma (dados mockados).',
            style: TextStyle(fontSize: 12, color: AppColors.brand),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ClCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${litros.toStringAsFixed(1)} L',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                          color: AppColors.brand,
                        ),
                      ),
                      const Text(
                        'total coletado',
                        style: TextStyle(fontSize: 11, color: AppColors.brand),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ClCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$coletasConcluidas',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                          color: AppColors.brandDark,
                        ),
                      ),
                      const Text(
                        'coletas concluídas',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppColors.brandDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ClCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$conversao%',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                          color: AppColors.brandDark,
                        ),
                      ),
                      const Text(
                        'taxa de conversão',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppColors.brandDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ClCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$pendentes',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                          color: AppColors.brandDark,
                        ),
                      ),
                      const Text(
                        'aguardando avaliação',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppColors.brandDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Doadoras por status',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.brandDark,
            ),
          ),
          const SizedBox(height: 10),
          ...StatusAvaliacao.values.map((status) {
            final qtd = doadoras
                .where((d) => d.statusAvaliacao == status)
                .length;
            final frac = doadoras.isNotEmpty ? qtd / doadoras.length : 0.0;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${status.label} — $qtd',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.brandDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: frac,
                      minHeight: 8,
                      color: AppColors.brand,
                      backgroundColor: AppColors.brandLight,
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
