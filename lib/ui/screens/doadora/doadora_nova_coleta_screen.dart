import 'package:flutter/material.dart';

import '../../../data/mock/mock_data.dart';
import '../../../data/model/models.dart';
import '../../../theme/app_theme.dart';
import '../../components/common.dart';

class DoadoraNovaColetaScreen extends StatefulWidget {
  final VoidCallback aoConfirmar;
  final VoidCallback aoVoltar;

  const DoadoraNovaColetaScreen({
    super.key,
    required this.aoConfirmar,
    required this.aoVoltar,
  });

  @override
  State<DoadoraNovaColetaScreen> createState() =>
      _DoadoraNovaColetaScreenState();
}

class _DoadoraNovaColetaScreenState extends State<DoadoraNovaColetaScreen> {
  BancoLeite? bancoSelecionado;
  ModalidadeColeta? modalidade;

  @override
  Widget build(BuildContext context) {
    final doadora = MockData.doadoraAtual;
    final bancos = MockData.bancos;

    return Scaffold(
      appBar: ClTopBar(
          titulo: 'Sinalizar leite excedente', aoVoltar: widget.aoVoltar),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Escolha um banco de leite próximo. A coleta será agendada para o seu dia '
              'fixo de doação.',
              style: TextStyle(fontSize: 13, color: AppColors.brand),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: bancos.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, i) {
                  final banco = bancos[i];
                  final selecionado = banco.id == bancoSelecionado?.id;
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: selecionado
                            ? AppColors.brand
                            : AppColors.brandLight,
                        width: selecionado ? 2 : 1,
                      ),
                    ),
                    child: ClCard(
                      onTap: () => setState(() {
                        bancoSelecionado = banco;
                        modalidade = null;
                      }),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(banco.nome,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.brandDark,
                                        fontSize: 14)),
                                Text(
                                    '${banco.endereco}, ${banco.numero} — ${banco.cidade}/${banco.estado}',
                                    style: const TextStyle(
                                        fontSize: 12, color: AppColors.brand)),
                                Text(banco.horarioFuncionamento,
                                    style: const TextStyle(
                                        fontSize: 12, color: AppColors.brand)),
                              ],
                            ),
                          ),
                          ClBadge('${banco.distanciaKm} km'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            if (bancoSelecionado != null) ...[
              const SizedBox(height: 12),
              const Text('Modalidade',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.brandDark)),
              const SizedBox(height: 8),
              Row(
                children: bancoSelecionado!.modalidades.map((m) {
                  final sel = m == modalidade;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => setState(() => modalidade = m),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: sel
                                    ? AppColors.brand
                                    : AppColors.brandLight),
                          ),
                          child: Text(
                            m.label,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color:
                                  sel ? AppColors.brand : AppColors.brandDark,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
            const SizedBox(height: 16),
            ClPrimaryButton(
              texto: 'Confirmar sinalização',
              habilitado: bancoSelecionado != null && modalidade != null,
              onPressed: () {
                final novoId = MockData.coletas
                        .map((c) => c.id)
                        .reduce((a, b) => a > b ? a : b) +
                    1;
                MockData.coletas.add(
                  Coleta(
                    id: novoId,
                    doadoraId: doadora.id,
                    banco: bancoSelecionado!,
                    dataAgendada: '2026-08-26T09:00:00',
                    modalidade: modalidade!,
                    status: StatusColeta.agendada,
                  ),
                );
                widget.aoConfirmar();
              },
            ),
          ],
        ),
      ),
    );
  }
}
