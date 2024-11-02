import 'package:fitness/app/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
  });

  final String text;
  final VoidCallback onTap;
  final double height = 60.0;
  final Color? backgroundColor,textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColor.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Text(
          text,
          style: text18Style(
            color: textColor ?? AppColor.white,
          ),
        ),
      ),
    );
  }
}
