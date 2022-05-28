import 'package:flutter/material.dart';

import '../../theme.dart';

class ExpandableButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final ButtonStyle theme;

  const ExpandableButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.theme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        child: Text(text, style: SplashTheme.textTheme.labelMedium),
        style: theme,
      ),
    );
  }
}
