import 'package:flutter/material.dart';

import '../../core/config/app_colors.dart';
import '../../core/config/app_text_style.dart';

class BuildGradientButton extends StatelessWidget {
  const BuildGradientButton(
      {super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          gradient: AppColors.appGradient,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.green.shade300,
              offset: const Offset(0, 6),
              blurRadius: 8,
            ),
          ],
        ),
        child: Center(
          child: Text(text, style: AppTextStyles.titleStyle()),
        ),
      ),
    );
  }
}
