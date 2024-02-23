import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants.dart';

class CardIcon extends StatelessWidget {
  const CardIcon({super.key, this.icon});

  final IconData? icon;

  @override
  Widget build(BuildContext context) => icon == null
      ? SvgPicture.asset(
          Constants.bankLogo,
          package: Constants.packageName,
          width: 36,
          height: 36,
        )
      : Icon(key: key, icon);
}
