import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattio_desafio/app/constants/app_colors.dart';
import 'package:wattio_desafio/app/ui/splash_page/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset(
          'assets/images/energyHand.png',
          width: 200,
        ),
      ),
    );
  }
}
