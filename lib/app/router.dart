import 'package:go_router/go_router.dart';
import '../features/auth/screens/intro_carousel_screen.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/otp_reset_screen.dart';
import '../features/auth/screens/signup_screen.dart';
import '../features/auth/screens/splash_screen.dart';
import '../features/core/screens/core_shell_screen.dart';
import '../features/core/screens/home_screen.dart';
import '../features/core/screens/notifications_screen.dart';
import '../features/core/screens/search_screen.dart';
import '../features/identity/screens/edit_profile_screen.dart';
import '../features/identity/screens/profile_screen.dart';
import '../features/identity/screens/security_screen.dart';
import '../features/identity/screens/settings_screen.dart';
import '../features/states/screens/empty_state_screen.dart';
import '../features/states/screens/error_state_screen.dart';
import '../features/states/screens/loading_state_screen.dart';
import '../features/states/screens/offline_state_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const IntroCarouselScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: '/otp',
      builder: (context, state) => const OtpResetScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const CoreShellScreen(
        currentIndex: 0,
        child: HomeScreen(),
      ),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const CoreShellScreen(
        currentIndex: 1,
        child: SearchScreen(),
      ),
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const CoreShellScreen(
        currentIndex: 2,
        child: NotificationsScreen(),
      ),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const CoreShellScreen(
        currentIndex: 3,
        child: ProfileScreen(),
      ),
    ),
    GoRoute(
      path: '/edit-profile',
      builder: (context, state) => const EditProfileScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/security',
      builder: (context, state) => const SecurityScreen(),
    ),
    GoRoute(
      path: '/states/empty',
      builder: (context, state) => const EmptyStateScreen(),
    ),
    GoRoute(
      path: '/states/error',
      builder: (context, state) => const ErrorStateScreen(),
    ),
    GoRoute(
      path: '/states/loading',
      builder: (context, state) => const LoadingStateScreen(),
    ),
    GoRoute(
      path: '/states/offline',
      builder: (context, state) => const OfflineStateScreen(),
    ),
  ],
);
