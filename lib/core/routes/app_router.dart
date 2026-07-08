import 'package:go_router/go_router.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/presentation/auth_screens/login_screen.dart';
import 'package:multi_trendzz/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:multi_trendzz/presentation/splash_screen/splash_screen.dart';
import 'package:multi_trendzz/presentation/welcome_screen/welcome_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splashScreen,
    routes: [

      GoRoute(
        path: AppRoutes.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: AppRoutes.welcomeScreen,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),

      GoRoute(
        path: AppRoutes.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),

    ],
  );
}