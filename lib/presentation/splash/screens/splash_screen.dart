import 'package:flutter/material.dart';
import 'package:xsis/presentation/_core/app_color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: CircularProgressIndicator(
          color: AppColor.cinematicRed,
        ),
      ),
    );
  }
}
