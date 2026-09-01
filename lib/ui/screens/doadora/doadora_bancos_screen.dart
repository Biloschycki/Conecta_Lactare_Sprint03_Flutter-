import 'package:conecta_lactare/data/model/mock/mock_data.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../../components/common.dart';

class DoadoraBancosScreen extends StatelessWidget {
  const DoadoraBancosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bancos = [...MockData.bancos]
      ..sort((a, b) => a.distanciaKm.compareTo(b.distanciaKm));

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Bancos de leite próximos',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                  color: AppColors.brandDark)),
          const Text('Encontre onde doar perto de você.',
              style: TextStyle(fontSize: 12, color: AppColors.brand)),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: bancos.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, i) {
                final b = bancos[i];
                return ClCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(b.nome,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.brandDark,
                                    fontSize: 14)),
                          ),
                          ClBadge('${b.distanciaKm} km'),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                          '${b.endereco}, ${b.numero} — ${b.bairro}, ${b.cidade}/${b.estado}',
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.brand)),
                      Text(b.horarioFuncionamento,
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.brand)),
                      Text(b.telefone,
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.brand)),
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
