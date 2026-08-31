import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../../components/common.dart';

class ResultadoElegivelScreen extends StatelessWidget {
  final VoidCallback aoContinuar;

  const ResultadoElegivelScreen({super.key, required this.aoContinuar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: AppColors.success, size: 72),
            const SizedBox(height: 20),
            const Text(
              'Você pode ser uma doadora!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 24,
                color: AppColors.brandDark,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Com base nas suas respostas, você segue para o cadastro. Depois, nossa '
              'equipe de saúde faz uma avaliação antes da liberação das doações.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.brand, fontSize: 14),
            ),
            const SizedBox(height: 28),
            ClPrimaryButton(texto: 'Continuar para o cadastro', onPressed: aoContinuar),
          ],
        ),
      ),
    );
  }
}

class ResultadoInelegivelScreen extends StatelessWidget {
  final VoidCallback aoVoltarInicio;

  const ResultadoInelegivelScreen({super.key, required this.aoVoltarInicio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.info, color: AppColors.brand, size: 72),
            const SizedBox(height: 20),
            const Text(
              'Por enquanto você não pode doar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 24,
                color: AppColors.brandDark,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Isso pode mudar no futuro. Enquanto isso, você pode conhecer nosso '
              'conteúdo educativo sobre doação de leite humano.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.brand, fontSize: 14),
            ),
            const SizedBox(height: 28),
            ClPrimaryButton(texto: 'Voltar para o início', onPressed: aoVoltarInicio),
          ],
        ),
      ),
    );
  }
}