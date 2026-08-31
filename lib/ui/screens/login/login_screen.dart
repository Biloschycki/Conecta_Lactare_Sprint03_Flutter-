import 'package:flutter/material.dart';

import '../../../data/model/models.dart';
import '../../../state/app_state.dart';
import '../../../theme/app_theme.dart';
import '../../components/common.dart';

/// Tela de login mockada. Como não há autenticação real nesta sprint, qualquer
/// e-mail/senha é aceito e o usuário escolhe qual área quer demonstrar.
class LoginScreen extends StatefulWidget {
  final VoidCallback aoEntrarComoDoadora;
  final VoidCallback aoEntrarComoGestor;

  const LoginScreen({
    super.key,
    required this.aoEntrarComoDoadora,
    required this.aoEntrarComoGestor,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCtrl = TextEditingController(text: 'mariana.silva@email.com');
  final senhaCtrl = TextEditingController();

  @override
  void dispose() {
    emailCtrl.dispose();
    senhaCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bem-vinda de volta',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 26,
                color: AppColors.brandDark,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Entre para acompanhar suas doações.',
              style: TextStyle(color: AppColors.brand, fontSize: 14),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: senhaCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Senha'),
            ),
            const SizedBox(height: 24),
            ClPrimaryButton(
              texto: 'Entrar como doadora',
              onPressed: () {
                AppState.instance.definirPapel(PapelUsuario.doadora);
                widget.aoEntrarComoDoadora();
              },
            ),
            const SizedBox(height: 10),
            ClOutlineButton(
              texto: 'Entrar como gestor(a)',
              onPressed: () {
                AppState.instance.definirPapel(PapelUsuario.gestor);
                widget.aoEntrarComoGestor();
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Demonstração: qualquer e-mail/senha entra. Escolha o perfil para navegar '
              'pelo MVP.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: AppColors.brand),
            ),
          ],
        ),
      ),
    );
  }
}