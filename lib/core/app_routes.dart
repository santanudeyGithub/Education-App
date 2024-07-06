import 'package:flutter/material.dart';
import 'package:onboarding_flutter_app/screens/onboarding_screen.dart/onboarding_screen.dart';
import 'package:onboarding_flutter_app/screens/splash/splash_screen.dart';
import 'package:onboarding_flutter_app/screens/welcome_screen.dart';

class AppRoutes {
//from this route class we will manage all navigation direction in our app

  static const String splash = "/";
  static const String onboard = "/onboard";
  static const String home = "/home";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SplashScreen());

      case AppRoutes.onboard:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const OnboardingScreen());

      case AppRoutes.home:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const WelcomeScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
