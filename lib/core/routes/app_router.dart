import 'package:go_router/go_router.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/presentation/auth_screens/complete_profile_screen/complete_profile_screen.dart';
import 'package:multi_trendzz/presentation/auth_screens/login_screen/login_screen.dart';
import 'package:multi_trendzz/presentation/auth_screens/sign_up_screen/sign_up_screen.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/dashboard_screen/dashboard_screen.dart';
import 'package:multi_trendzz/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:multi_trendzz/presentation/splash_screen/splash_screen.dart';
import 'package:multi_trendzz/presentation/welcome_screen/welcome_screen.dart';
import 'package:multi_trendzz/root_screen.dart';

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

      GoRoute(
        path: AppRoutes.signUpScreen,
        builder: (context, state) => const SignUpScreen(),
      ),

      GoRoute(
        path: AppRoutes.completeProfileScreen,
        builder: (context, state) => const CompleteProfileScreen(),
      ),
      GoRoute(
        path: AppRoutes.rootScreen,
        builder: (context, state) => const RootScreen(),
      ),
      GoRoute(
        path: AppRoutes.dashboardScreen,
        builder: (context, state) => const DashboardScreen(),
      ),
    ],
  );
}