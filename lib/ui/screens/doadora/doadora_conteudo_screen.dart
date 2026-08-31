import 'package:flutter/material.dart';

import '../../../data/mock/mock_data.dart';
import '../../../theme/app_theme.dart';
import '../../components/common.dart';

class DoadoraConteudoListScreen extends StatelessWidget {
  final void Function(String slug) aoAbrirDetalhe;

  const DoadoraConteudoListScreen({super.key, required this.aoAbrirDetalhe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Conteúdo educativo',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                  color: AppColors.brandDark)),
          const Text('Aprenda a doar com segurança.',
              style: TextStyle(fontSize: 12, color: AppColors.brand)),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: MockData.conteudos.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, i) {
                final c = MockData.conteudos[i];
                return ClCard(
                  onTap: () => aoAbrirDetalhe(c.slug),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClBadge(c.categoria),
                      const SizedBox(height: 6),
                      Text(c.titulo,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.brandDark,
                              fontSize: 15)),
                      const SizedBox(height: 4),
                      Text(c.resumo,
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.brand)),
                      const SizedBox(height: 4),
                      Text('${c.tempoLeituraMin} min de leitura',
                          style: const TextStyle(
                              fontSize: 11, color: AppColors.brand)),
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

class DoadoraConteudoDetalheScreen extends StatelessWidget {
  final String slug;
  final VoidCallback aoVoltar;

  const DoadoraConteudoDetalheScreen(
      {super.key, required this.slug, required this.aoVoltar});

  @override
  Widget build(BuildContext context) {
    final conteudo =
        MockData.conteudos.where((c) => c.slug == slug).firstOrNull;

    return Scaffold(
      appBar:
          ClTopBar(titulo: conteudo?.titulo ?? 'Conteúdo', aoVoltar: aoVoltar),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: conteudo == null
            ? const Text('Conteúdo não encontrado.',
                style: TextStyle(color: AppColors.brand))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClBadge(conteudo.categoria),
                  const SizedBox(height: 10),
                  Text(conteudo.titulo,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: AppColors.brandDark)),
                  const SizedBox(height: 4),
                  Text('${conteudo.tempoLeituraMin} min de leitura',
                      style: const TextStyle(
                          fontSize: 12, color: AppColors.brand)),
                  const SizedBox(height: 16),
                  Text(conteudo.corpo,
                      style: const TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          color: AppColors.brandDark)),
                ],
              ),
      ),
    );
  }
}
