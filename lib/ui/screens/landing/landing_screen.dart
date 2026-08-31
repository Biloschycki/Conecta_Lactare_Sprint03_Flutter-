import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../../components/common.dart';

class LandingScreen extends StatelessWidget {
  final VoidCallback aoClicarQuero;
  final VoidCallback aoClicarJaSouDoadora;
  final VoidCallback aoClicarSouGestor;

  const LandingScreen({
    super.key,
    required this.aoClicarQuero,
    required this.aoClicarJaSouDoadora,
    required this.aoClicarSouGestor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero
            Container(
              width: double.infinity,
              color: AppColors.brandDark,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.favorite, color: AppColors.brandLight),
                      SizedBox(width: 8),
                      Text(
                        'Rede de doação de leite humano',
                        style: TextStyle(
                          color: AppColors.brandLight,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Cada gota importa.\nCada conexão salva vidas.',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Seu leite pode alimentar bebês prematuros que dependem dele para '
                    'sobreviver. Descubra em 2 minutos se você pode doar.',
                    style: TextStyle(
                      color: AppColors.brandLight,
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: aoClicarQuero,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.brand,
                    ),
                    child: const Text('Quero doar'),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: aoClicarJaSouDoadora,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                    ),
                    child: const Text('Já sou doadora'),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: aoClicarSouGestor,
                      style: TextButton.styleFrom(foregroundColor: Colors.white),
                      child: const Text(
                        'Sou gestor(a) de banco de leite',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Estatísticas
            Container(
              width: double.infinity,
              color: AppColors.brandLight,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _Estatistica(valor: '237', rotulo: 'bancos de leite'),
                  _Estatistica(valor: '1,6M', rotulo: 'nutrizes/ano'),
                  _Estatistica(valor: '245 mil', rotulo: 'litros em 2024'),
                ],
              ),
            ),

            // Como funciona
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Como funciona',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      color: AppColors.brandDark,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ..._passos.map(
                    (p) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            p.$1,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.brandDark,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            p.$2,
                            style: const TextStyle(
                              color: AppColors.slateMuted,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Por que doar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: ClCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '10',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 32,
                        color: AppColors.brand,
                      ),
                    ),
                    Text(
                      'bebês podem ser alimentados por dia com apenas 1 litro de leite doado',
                      style: TextStyle(color: AppColors.slateMuted, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

const _passos = [
  ('1. Responda o quiz', 'Descubra em 2 minutos se você pode doar.'),
  ('2. Crie sua conta', 'Cadastro rápido e protegido.'),
  ('3. Encontre um banco', 'Veja os bancos de leite mais próximos.'),
  ('4. Sinalize a coleta', 'Em casa ou no banco, do seu jeito.'),
  ('5. Doe e acompanhe', 'Veja o impacto de cada gota.'),
];

class _Estatistica extends StatelessWidget {
  final String valor;
  final String rotulo;

  const _Estatistica({required this.valor, required this.rotulo});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            valor,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20,
              color: AppColors.brandDark,
            ),
          ),
          Text(
            rotulo,
            style: const TextStyle(fontSize: 11, color: AppColors.slateMuted),
          ),
        ],
      ),
    );
  }
}