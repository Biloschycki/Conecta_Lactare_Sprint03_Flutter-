import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../theme/app_theme.dart';
import '../../components/common.dart';

class CadastroScreen extends StatefulWidget {
  final VoidCallback aoConcluir;
  final VoidCallback aoVoltar;

  const CadastroScreen({super.key, required this.aoConcluir, required this.aoVoltar});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final nomeCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final cpfCtrl = TextEditingController();
  final telefoneCtrl = TextEditingController();
  final cepCtrl = TextEditingController();
  final enderecoCtrl = TextEditingController();
  final cidadeCtrl = TextEditingController();
  final estadoCtrl = TextEditingController();

  bool mostrarSucesso = false;

  @override
  void dispose() {
    nomeCtrl.dispose();
    emailCtrl.dispose();
    cpfCtrl.dispose();
    telefoneCtrl.dispose();
    cepCtrl.dispose();
    enderecoCtrl.dispose();
    cidadeCtrl.dispose();
    estadoCtrl.dispose();
    super.dispose();
  }

  void buscarCepMock(String cep) {
    // Simula a integração com ViaCEP feita no frontend web, mas 100% mockada aqui.
    if (cep.length >= 8) {
      setState(() {
        enderecoCtrl.text = 'Av. Paulista';
        cidadeCtrl.text = 'São Paulo';
        estadoCtrl.text = 'SP';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClTopBar(titulo: 'Criar minha conta', aoVoltar: widget.aoVoltar),
      body: mostrarSucesso ? _buildSucesso() : _buildFormulario(),
    );
  }

  Widget _buildSucesso() {
    return Padding(
      padding: const EdgeInsets.all(28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Cadastro enviado! 💙',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 22,
              color: AppColors.brandDark,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Seus dados foram registrados (mock). Nossa equipe de saúde avaliará seu '
            'cadastro antes da liberação das doações.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.brand, fontSize: 14),
          ),
          const SizedBox(height: 24),
          ClPrimaryButton(texto: 'Ir para o login', onPressed: widget.aoConcluir),
        ],
      ),
    );
  }

  Widget _buildFormulario() {
    return ListenableBuilder(
      listenable: Listenable.merge([nomeCtrl, emailCtrl]),
      builder: (context, _) {
        final habilitado = nomeCtrl.text.trim().isNotEmpty && emailCtrl.text.trim().isNotEmpty;
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Leva menos de 3 minutos. Seus dados ficam protegidos pela LGPD.',
                style: TextStyle(color: AppColors.brand, fontSize: 13),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nomeCtrl,
                decoration: const InputDecoration(labelText: 'Nome completo'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'E-mail'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: cpfCtrl,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(labelText: 'CPF'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: telefoneCtrl,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Celular'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: cepCtrl,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: buscarCepMock,
                decoration: const InputDecoration(
                  labelText: 'CEP',
                  helperText: 'Endereço preenchido automaticamente (mock ViaCEP)',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: enderecoCtrl,
                decoration: const InputDecoration(labelText: 'Endereço'),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: cidadeCtrl,
                      decoration: const InputDecoration(labelText: 'Cidade'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: estadoCtrl,
                      decoration: const InputDecoration(labelText: 'UF'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ClPrimaryButton(
                texto: 'Concluir cadastro',
                habilitado: habilitado,
                onPressed: () => setState(() => mostrarSucesso = true),
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }
}
