import 'package:flutter/material.dart';
import 'package:onboarding_flutter_app/core/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);

    animation.addListener(() {
      if (mounted) setState(() {});
    });
    animationController.forward();

    Future.delayed(const Duration(seconds: 2))
        .then((value) => Navigator.popAndPushNamed(context, AppRoutes.onboard));

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/time-to-travel.png',
              height: animation.value * 200,
            ),
          ],
        ),
      ),
    );
  }
}
