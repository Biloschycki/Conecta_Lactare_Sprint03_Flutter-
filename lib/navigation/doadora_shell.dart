import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class DoadoraShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const DoadoraShell({super.key, required this.navigationShell});

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
          NavigationDestination(icon: Icon(Icons.home), label: 'Início'),
          NavigationDestination(icon: Icon(Icons.water_drop), label: 'Coletas'),
          NavigationDestination(icon: Icon(Icons.place), label: 'Bancos'),
          NavigationDestination(icon: Icon(Icons.menu_book), label: 'Conteúdo'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
