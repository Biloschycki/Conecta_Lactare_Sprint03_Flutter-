import 'package:flutter/material.dart';

import '../../../data/mock/mock_data.dart';
import '../../../state/app_state.dart';
import '../../../theme/app_theme.dart';
import '../../components/common.dart';

class QuizScreen extends StatefulWidget {
  final VoidCallback aoConcluir;
  final VoidCallback aoVoltar;

  const QuizScreen({super.key, required this.aoConcluir, required this.aoVoltar});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final perguntas = MockData.perguntasQuiz;
  int indice = 0;
  final Map<int, bool> respostas = {};

  void responder(bool valor) {
    respostas[perguntas[indice].id] = valor;
    if (indice + 1 < perguntas.length) {
      setState(() => indice++);
    } else {
      AppState.instance.definirRespostasQuiz(Map.of(respostas));
      widget.aoConcluir();
    }
  }

  @override
  Widget build(BuildContext context) {
    final pergunta = perguntas[indice];
    return Scaffold(
      appBar: ClTopBar(titulo: 'Quiz de elegibilidade', aoVoltar: widget.aoVoltar),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pergunta ${indice + 1} de ${perguntas.length}',
              style: const TextStyle(
                color: AppColors.brand,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: LinearProgressIndicator(
                value: (indice + 1) / perguntas.length,
                minHeight: 8,
                color: AppColors.brand,
                backgroundColor: AppColors.brandLight,
              ),
            ),
            const SizedBox(height: 28),
            Text(
              pergunta.texto,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 22,
                color: AppColors.brandDark,
              ),
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                Expanded(
                  child: ClPrimaryButton(texto: 'Sim', onPressed: () => responder(true)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ClOutlineButton(texto: 'Não', onPressed: () => responder(false)),
                ),
              ],
            ),
            if (indice > 0) ...[
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => setState(() => indice--),
                child: const Text('Voltar'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}