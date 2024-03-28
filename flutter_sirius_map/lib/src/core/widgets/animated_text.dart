import 'package:flutter/material.dart';

class AnimatedTextWrapper extends StatelessWidget {
  const AnimatedTextWrapper({super.key, required this.text});
  final Text text;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: kThemeChangeDuration,
      child: text,
      layoutBuilder: (c, pr) => c ?? pr.first,
    );
  }
}
