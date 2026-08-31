import 'package:flutter/material.dart';

import '../../../data/mock/mock_data.dart';
import '../../../data/model/models.dart';
import '../../../theme/app_theme.dart';
import '../../components/common.dart';

const cancelaveis = {
  StatusColeta.agendada,
  StatusColeta.emColeta,
  StatusColeta.problema,
};

class DoadoraColetasScreen extends StatefulWidget {
  final VoidCallback aoNovaColeta;

  const DoadoraColetasScreen({super.key, required this.aoNovaColeta});

  @override
  State<DoadoraColetasScreen> createState() => _DoadoraColetasScreenState();
}

class _DoadoraColetasScreenState extends State<DoadoraColetasScreen> {
  int? confirmandoId;

  @override
  Widget build(BuildContext context) {
    final doadora = MockData.doadoraAtual;
    final coletas =
        MockData.coletas.where((c) => c.doadoraId == doadora.id).toList()
          ..sort((a, b) => b.dataAgendada.compareTo(a.dataAgendada));
    final concluidas = coletas
        .where((c) => c.status == StatusColeta.concluida)
        .toList();
    final totalL =
        concluidas.fold<int>(0, (s, c) => s + (c.volumeMl ?? 0)) / 1000.0;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Minhas coletas',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 22,
              color: AppColors.brandDark,
            ),
          ),
          const Text(
            'Acompanhe suas doações.',
            style: TextStyle(fontSize: 12, color: AppColors.brand),
          ),
          const SizedBox(height: 12),
          ClPrimaryButton(
            texto: '+ Sinalizar coleta',
            onPressed: widget.aoNovaColeta,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ClCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${totalL.toStringAsFixed(1)} L',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: AppColors.brandDark,
                        ),
                      ),
                      const Text(
                        'total doado',
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
                        '${concluidas.length}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: AppColors.brandDark,
                        ),
                      ),
                      const Text(
                        'concluídas',
                        style: TextStyle(fontSize: 11, color: AppColors.brand),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: coletas.isEmpty
                ? const Text(
                    'Você ainda não tem coletas.',
                    style: TextStyle(color: AppColors.brand),
                  )
                : ListView.separated(
                    itemCount: coletas.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, i) {
                      final coleta = coletas[i];
                      return ClCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      coleta.banco.nome,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.brandDark,
                                      ),
                                    ),
                                    Text(
                                      '${coleta.banco.cidade}/${coleta.banco.estado}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: AppColors.brand,
                                      ),
                                    ),
                                  ],
                                ),
                                ClBadge(
                                  coleta.status.label,
                                  tone: coleta.status.toBadgeTone(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Data prevista: ${coleta.dataAgendada.replaceAll('T', ' ')}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.brandDark,
                              ),
                            ),
                            Text(
                              'Modalidade: ${coleta.modalidade.label}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.brandDark,
                              ),
                            ),
                            if (coleta.volumeMl != null)
                              Text(
                                'Volume: ${coleta.volumeMl} ml',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.brandDark,
                                ),
                              ),
                            if (cancelaveis.contains(coleta.status)) ...[
                              const SizedBox(height: 10),
                              if (confirmandoId == coleta.id)
                                Row(
                                  children: [
                                    Expanded(
                                      child: ClOutlineButton(
                                        texto: 'Confirmar cancelamento',
                                        onPressed: () {
                                          setState(() {
                                            coleta.status =
                                                StatusColeta.cancelada;
                                            confirmandoId = null;
                                          });
                                        },
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          setState(() => confirmandoId = null),
                                      child: const Text('Voltar'),
                                    ),
                                  ],
                                )
                              else
                                ClOutlineButton(
                                  texto: 'Cancelar coleta',
                                  onPressed: () =>
                                      setState(() => confirmandoId = coleta.id),
                                ),
                            ],
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
