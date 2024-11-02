import 'package:fitness/app/core/constants/app_text_style.dart';
import 'package:fitness/app/core/widgets/horizontal_padding.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return HorizontalPadding(
      child: Text(
        title,
        style: text18Style(),
      ),
    );
  }
}
