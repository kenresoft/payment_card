import 'package:flutter/material.dart';

class CardIcon extends StatelessWidget {
  const CardIcon({Key? key, this.icon}) : super(key: key);

  final IconData? icon;

  @override
  Widget build(BuildContext context) => icon == null
      ? const FlutterLogo(
          size: 40,
        )
      : Icon(icon);
}
