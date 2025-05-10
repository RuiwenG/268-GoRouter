import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShellScreen extends StatelessWidget {
  final Widget child;
  const ShellScreen({super.key, required this.child});

  static const tabs = [
    NavigationDestination(icon: Icon(Icons.person), label: 'Author'),
    NavigationDestination(icon: Icon(Icons.title), label: 'Title'),
    NavigationDestination(icon: Icon(Icons.account_circle), label: 'Profile'),
  ];

  int _locationToIndex(String location) {
    if (location.startsWith('/byAuthor')) return 0;
    if (location.startsWith('/byTitle')) return 1;
    if (location.startsWith('/profile')) return 2;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _locationToIndex(location);

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        destinations: tabs,
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.go('/byAuthor');
              break;
            case 1:
              context.go('/byTitle');
              break;
            case 2:
              context.go('/profile');
              break;
          }
        },
      ),
    );
  }
}
