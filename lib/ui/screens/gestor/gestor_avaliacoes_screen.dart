import 'package:conecta_lactare/data/model/mock/mock_data.dart';
import 'package:flutter/material.dart';

import '../../../data/model/models.dart';
import '../../../theme/app_theme.dart';
import '../../components/common.dart';

class GestorAvaliacoesScreen extends StatefulWidget {
  const GestorAvaliacoesScreen({super.key});

  @override
  State<GestorAvaliacoesScreen> createState() => _GestorAvaliacoesScreenState();
}

class _GestorAvaliacoesScreenState extends State<GestorAvaliacoesScreen> {
  late final fila = List<ItemAvaliacao>.of(MockData.filaAvaliacao);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Fila de avaliação',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 22,
              color: AppColors.brandDark,
            ),
          ),
          const Text(
            'Aprove ou reprove cadastros pendentes.',
            style: TextStyle(fontSize: 12, color: AppColors.brand),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: fila.isEmpty
                ? const Text(
                    'Nenhum cadastro pendente. 🎉',
                    style: TextStyle(color: AppColors.brand),
                  )
                : ListView.separated(
                    itemCount: fila.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, i) {
                      final item = fila[i];
                      return ClCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.doadora.nome,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.brandDark,
                              ),
                            ),
                            Text(
                              item.doadora.email,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.brand,
                              ),
                            ),
                            Text(
                              'Solicitado em ${item.dataSolicitacao}',
                              style: const TextStyle(
                                fontSize: 11,
                                color: AppColors.brand,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: ClPrimaryButton(
                                    texto: 'Aprovar',
                                    onPressed: () {
                                      setState(() {
                                        item.doadora.statusAvaliacao =
                                            StatusAvaliacao.aprovada;
                                        fila.remove(item);
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: ClOutlineButton(
                                    texto: 'Reprovar',
                                    onPressed: () {
                                      setState(() {
                                        item.doadora.statusAvaliacao =
                                            StatusAvaliacao.reprovada;
                                        fila.remove(item);
                                      });
                                    },
                                  ),
                                ),
                              ],
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
