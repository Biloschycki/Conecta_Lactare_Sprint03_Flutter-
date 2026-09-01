import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Casca com navegação por abas (bottom navigation) da área do gestor.
/// Equivalente ao `GestorAreaScreen` em `navigation/GestorNav.kt`.
class GestorShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const GestorShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (i) => navigationShell.goBranch(
          i,
          initialLocation: i == navigationShell.currentIndex,
        ),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: 'Visão geral',
          ),
          NavigationDestination(
            icon: Icon(Icons.fact_check),
            label: 'Avaliações',
          ),
          NavigationDestination(icon: Icon(Icons.people), label: 'Doadoras'),
          NavigationDestination(icon: Icon(Icons.water_drop), label: 'Coletas'),
          NavigationDestination(icon: Icon(Icons.history), label: 'Auditoria'),
        ],
      ),
    );
  }
}
