import 'package:conecta_lactare/data/model/mock/mock_data.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../../components/common.dart';

const _dias = [
  'Domingo',
  'Segunda',
  'Terça',
  'Quarta',
  'Quinta',
  'Sexta',
  'Sábado'
];

class DoadoraPerfilScreen extends StatefulWidget {
  const DoadoraPerfilScreen({super.key});

  @override
  State<DoadoraPerfilScreen> createState() => _DoadoraPerfilScreenState();
}

class _DoadoraPerfilScreenState extends State<DoadoraPerfilScreen> {
  late final nomeCtrl = TextEditingController(text: MockData.doadoraAtual.nome);
  late final emailCtrl =
      TextEditingController(text: MockData.doadoraAtual.email);
  late final telefoneCtrl =
      TextEditingController(text: MockData.doadoraAtual.telefone);
  late int diaColeta = MockData.doadoraAtual.diaColetaSemana ?? 3;
  bool salvo = false;

  @override
  void dispose() {
    nomeCtrl.dispose();
    emailCtrl.dispose();
    telefoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final doadora = MockData.doadoraAtual;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Iniciais(doadora.nome),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(doadora.nome,
                        style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: AppColors.brandDark)),
                    Text('Doadora desde ${doadora.doadoraDesde}',
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.brand)),
                  ],
                ),
              ),
              ClBadge(doadora.statusAvaliacao.label,
                  tone: doadora.statusAvaliacao.toBadgeTone()),
            ],
          ),
          const SizedBox(height: 24),
          TextField(
              controller: nomeCtrl,
              decoration: const InputDecoration(labelText: 'Nome completo')),
          const SizedBox(height: 12),
          TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(labelText: 'E-mail')),
          const SizedBox(height: 12),
          TextField(
              controller: telefoneCtrl,
              decoration: const InputDecoration(labelText: 'Celular')),
          const SizedBox(height: 12),
          TextField(
            readOnly: true,
            controller: TextEditingController(
                text:
                    '${doadora.cidade}/${doadora.estado} · CEP ${doadora.cep}'),
            decoration: const InputDecoration(labelText: 'Endereço'),
          ),
          const SizedBox(height: 16),
          const Text('Dia de coleta',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.brandDark)),
          const SizedBox(height: 8),
          Row(
            children: List.generate(_dias.length, (i) {
              final sel = i == diaColeta;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: sel
                      ? ElevatedButton(
                          onPressed: () => setState(() => diaColeta = i),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 2),
                          ),
                          child: Text(_dias[i].substring(0, 3),
                              style: const TextStyle(fontSize: 10)),
                        )
                      : OutlinedButton(
                          onPressed: () => setState(() => diaColeta = i),
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 2),
                          ),
                          child: Text(_dias[i].substring(0, 3),
                              style: const TextStyle(fontSize: 10)),
                        ),
                ),
              );
            }),
          ),
          const SizedBox(height: 20),
          ClPrimaryButton(
            texto: 'Salvar alterações',
            onPressed: () {
              setState(() {
                doadora.diaColetaSemana = diaColeta;
                salvo = true;
              });
            },
          ),
          if (salvo) ...[
            const SizedBox(height: 10),
            const Text('Perfil atualizado com sucesso!',
                style: TextStyle(color: AppColors.success, fontSize: 13)),
          ],
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
