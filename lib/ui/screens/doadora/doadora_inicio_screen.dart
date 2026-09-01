import 'package:conecta_lactare/data/model/mock/mock_data.dart';
import 'package:flutter/material.dart';

import '../../../data/model/models.dart';
import '../../../theme/app_theme.dart';
import '../../components/common.dart';

class DoadoraInicioScreen extends StatelessWidget {
  final VoidCallback aoAbrirColetas;
  final VoidCallback aoAbrirNovaColeta;
  final VoidCallback aoAbrirConteudo;

  const DoadoraInicioScreen({
    super.key,
    required this.aoAbrirColetas,
    required this.aoAbrirNovaColeta,
    required this.aoAbrirConteudo,
  });

  @override
  Widget build(BuildContext context) {
    final doadora = MockData.doadoraAtual;
    final coletas =
        MockData.coletas.where((c) => c.doadoraId == doadora.id).toList();
    final concluidas =
        coletas.where((c) => c.status == StatusColeta.concluida).toList();
    final totalL =
        concluidas.fold<int>(0, (s, c) => s + (c.volumeMl ?? 0)) / 1000.0;
    final agendadas =
        coletas.where((c) => c.status == StatusColeta.agendada).toList();
    agendadas.sort((a, b) => a.dataAgendada.compareTo(b.dataAgendada));
    final proxima = agendadas.isNotEmpty ? agendadas.first : null;
    final primeiroNome = doadora.nome.split(' ').first;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Olá, $primeiroNome 💙',
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                  color: AppColors.brandDark,
                ),
              ),
              ClBadge(doadora.statusAvaliacao.label,
                  tone: doadora.statusAvaliacao.toBadgeTone()),
            ],
          ),
          const SizedBox(height: 16),

          // Resumo de impacto
          Row(
            children: [
              Expanded(
                child: ClCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${totalL.toStringAsFixed(1)} L',
                          style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 22,
                              color: AppColors.brand)),
                      const Text('doados até agora',
                          style:
                              TextStyle(fontSize: 11, color: AppColors.brand)),
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
                      Text('${concluidas.length}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 22,
                              color: AppColors.brandDark)),
                      const Text('doações concluídas',
                          style: TextStyle(
                              fontSize: 11, color: AppColors.brandDark)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${concluidas.length * 10}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                        color: AppColors.brandDark)),
                const Text('bebês potencialmente alimentados',
                    style: TextStyle(fontSize: 12, color: AppColors.brandDark)),
              ],
            ),
          ),

          const SizedBox(height: 20),
          const Text('Próxima coleta',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: AppColors.brandDark)),
          const SizedBox(height: 8),
          if (proxima != null)
            ClCard(
              onTap: aoAbrirColetas,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(proxima.banco.nome,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.brandDark)),
                  Text(proxima.dataAgendada.replaceAll('T', ' '),
                      style: const TextStyle(
                          fontSize: 13, color: AppColors.brand)),
                ],
              ),
            )
          else
            ClCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Nenhuma coleta agendada',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.brandDark)),
                  const SizedBox(height: 4),
                  const Text('Sinalize quando tiver leite excedente.',
                      style: TextStyle(fontSize: 13, color: AppColors.brand)),
                  const SizedBox(height: 10),
                  ClPrimaryButton(
                      texto: 'Sinalizar coleta', onPressed: aoAbrirNovaColeta),
                ],
              ),
            ),

          const SizedBox(height: 20),
          const Text('Atalhos',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: AppColors.brandDark)),
          const SizedBox(height: 8),
          ClCard(
            onTap: aoAbrirNovaColeta,
            child: const Text('💧  Sinalizar coleta',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: AppColors.brandDark)),
          ),
          const SizedBox(height: 8),
          ClCard(
            onTap: aoAbrirConteudo,
            child: const Text('📚  Conteúdo educativo',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: AppColors.brandDark)),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
