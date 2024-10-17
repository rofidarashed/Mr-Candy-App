import 'package:flutter/material.dart';
import 'package:mr_candy/core/utils/app_colors.dart';
import 'package:mr_candy/core/utils/app_images.dart';
import 'package:mr_candy/features/onboarding/presentation/views/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        navigateToLogin();
      },
    );
  }

  navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return const OnboardingScreen();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.mainColorLinear1,
              AppColors.mainColorLinear2,
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            AppImages.splashImage,
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ),
      ),
    );
  }
}
