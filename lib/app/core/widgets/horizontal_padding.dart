import 'package:flutter/cupertino.dart';

class HorizontalPadding extends StatelessWidget {
  const HorizontalPadding({
    super.key,
    required this.child,
    this.padding,
  });

  final Widget child;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: padding ?? 20,
      ),
      child: child,
    );
  }
}
