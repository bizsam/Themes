import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/motion.dart';

class CoreShellScreen extends StatelessWidget {
  const CoreShellScreen({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  final Widget child;
  final int currentIndex;

  void _onTap(BuildContext context, int index) {
    if (index == 0) {
      context.go('/home');
      return;
    }
    if (index == 1) {
      context.go('/search');
      return;
    }
    if (index == 2) {
      context.go('/notifications');
      return;
    }
    context.go('/profile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: AppMotion.medium,
        child: child,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) => _onTap(context, index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.notifications_none), label: 'Alerts'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}
