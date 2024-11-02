import 'package:fitness/app/core/constants/app_text_style.dart';
import 'package:fitness/app/core/widgets/horizontal_padding.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
    required this.title,
    this.color,
    this.padding,
  });

  final String title;
  final Color? color;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return HorizontalPadding(
      padding: padding,
      child: Text(
        title,
        style: text18Style(
          color: color ?? AppColor.secondaryColor,
        ),
      ),
    );
  }
}
