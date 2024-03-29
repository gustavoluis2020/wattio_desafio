import 'package:flutter/material.dart';
import 'package:wattio_desafio/app/constants/app_colors.dart';

class CardHome extends StatelessWidget {
  const CardHome({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      surfaceTintColor: AppColors.white,
      child: child,
    );
  }
}
