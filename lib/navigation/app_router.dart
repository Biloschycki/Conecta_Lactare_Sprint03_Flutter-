import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../state/app_state.dart';
import '../ui/screens/cadastro/cadastro_screen.dart';
import '../ui/screens/doadora/doadora_bancos_screen.dart';
import '../ui/screens/doadora/doadora_coletas_screen.dart';
import '../ui/screens/doadora/doadora_conteudo_screen.dart';
import '../ui/screens/doadora/doadora_inicio_screen.dart';
import '../ui/screens/doadora/doadora_nova_coleta_screen.dart';
import '../ui/screens/doadora/doadora_perfil_screen.dart';
import '../ui/screens/gestor/gestor_auditoria_screen.dart';
import '../ui/screens/gestor/gestor_avaliacoes_screen.dart';
import '../ui/screens/gestor/gestor_coletas_screen.dart';
import '../ui/screens/gestor/gestor_conteudo_screen.dart';
import '../ui/screens/gestor/gestor_doadoras_screen.dart';
import '../ui/screens/gestor/gestor_visao_geral_screen.dart';
import '../ui/screens/landing/landing_screen.dart';
import '../ui/screens/login/login_screen.dart';
import '../ui/screens/quiz/quiz_screen.dart';
import '../ui/screens/quiz/resultado_screen.dart';
import 'doadora_shell.dart';
import 'gestor_shell.dart';
import 'routes.dart';


final GoRouter appRouter = GoRouter(
  initialLocation: Routes.landing,
  routes: [
    GoRoute(
      path: Routes.landing,
      builder: (context, state) => LandingScreen(
        aoClicarQuero: () => context.push(Routes.quiz),
        aoClicarJaSouDoadora: () => context.push(Routes.login),
        aoClicarSouGestor: () => context.push(Routes.login),
      ),
    ),
    GoRoute(
      path: Routes.quiz,
      builder: (context, state) => QuizScreen(
        aoConcluir: () {
          final respostas = AppState.instance.respostasQuiz;
          final elegivel = respostas.values.where((v) => v).length >= 3;
          if (elegivel) {
            context.push(Routes.resultadoElegivel);
          } else {
            context.push(Routes.resultadoInelegivel);
          }
        },
        aoVoltar: () => context.pop(),
      ),
    ),
    GoRoute(
      path: Routes.resultadoElegivel,
      builder: (context, state) => ResultadoElegivelScreen(
        aoContinuar: () => context.push(Routes.cadastro),
      ),
    ),
    GoRoute(
      path: Routes.resultadoInelegivel,
      builder: (context, state) => ResultadoInelegivelScreen(
        aoVoltarInicio: () => context.go(Routes.landing),
      ),
    ),
    GoRoute(
      path: Routes.cadastro,
      builder: (context, state) => CadastroScreen(
        aoConcluir: () => context.go(Routes.login),
        aoVoltar: () => context.pop(),
      ),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => LoginScreen(
        aoEntrarComoDoadora: () => context.go(Routes.doadoraInicio),
        aoEntrarComoGestor: () => context.go(Routes.gestorVisaoGeral),
      ),
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          DoadoraShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.doadoraInicio,
              builder: (context, state) => DoadoraInicioScreen(
                aoAbrirColetas: () => context.go(Routes.doadoraColetas),
                aoAbrirNovaColeta: () => context.push(
                  '${Routes.doadoraColetas}/${Routes.doadoraNovaColeta}',
                ),
                aoAbrirConteudo: () => context.go(Routes.doadoraConteudo),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.doadoraColetas,
              builder: (context, state) => DoadoraColetasScreen(
                aoNovaColeta: () => context.push(
                  '${Routes.doadoraColetas}/${Routes.doadoraNovaColeta}',
                ),
              ),
              routes: [
                GoRoute(
                  path: Routes.doadoraNovaColeta,
                  builder: (context, state) => DoadoraNovaColetaScreen(
                    aoConfirmar: () => context.go(Routes.doadoraColetas),
                    aoVoltar: () => context.pop(),
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.doadoraBancos,
              builder: (context, state) => const DoadoraBancosScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.doadoraConteudo,
              builder: (context, state) => DoadoraConteudoListScreen(
                
                aoAbrirDetalhe: (slug) =>
                    context.push('${Routes.doadoraConteudo}/$slug'),
              ),
              routes: [
                GoRoute(
                  path: Routes.doadoraConteudoDetalhe,
                  builder: (context, state) => DoadoraConteudoDetalheScreen(
                    slug: state.pathParameters['slug'] ?? '',
                    aoVoltar: () => context.pop(),
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.doadoraPerfil,
              builder: (context, state) => const DoadoraPerfilScreen(),
            ),
          ],
        ),
      ],
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          GestorShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.gestorVisaoGeral,
              builder: (context, state) => const GestorVisaoGeralScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.gestorAvaliacoes,
              builder: (context, state) => const GestorAvaliacoesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.gestorDoadoras,
              builder: (context, state) => const GestorDoadorasScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.gestorColetas,
              builder: (context, state) => const GestorColetasScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.gestorAuditoria,
              builder: (context, state) => const GestorAuditoriaScreen(),
            ),
          ],
        ),
      ],
    ),

    
    GoRoute(
      path: Routes.gestorConteudo,
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text('Conteúdo educativo (CMS)')),
        body: const GestorConteudoScreen(),
      ),
    ),
  ],
);
