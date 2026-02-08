import 'package:go_router/go_router.dart';
import '../features/dashboards/screens/dashboard_hub_screen.dart';
import '../features/dashboards/screens/dashboard_shell_screen.dart';
import '../features/magazine/screens/content_screen.dart';
import '../features/magazine/screens/discovery_screen.dart';
import '../features/magazine/screens/immersion_screen.dart';
import '../features/magazine/screens/profile_screen.dart';
import '../features/magazine/screens/settings_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/immersion',
  routes: [
    GoRoute(
      path: '/immersion',
      builder: (context, state) => const ImmersionScreen(),
    ),
    GoRoute(
      path: '/discovery',
      builder: (context, state) => const DiscoveryScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/content',
      builder: (context, state) => const ContentScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/dashboards',
      builder: (context, state) => const DashboardHubScreen(),
    ),
    GoRoute(
      path: '/dashboard/:dashboardId',
      builder: (context, state) => DashboardShellScreen(
        dashboardId: state.pathParameters['dashboardId'] ?? 'analytics',
      ),
    ),
  ],
);
