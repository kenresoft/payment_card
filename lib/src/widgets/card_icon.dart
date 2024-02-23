import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants.dart';

/// A widget for displaying an icon representing a card issuer.
class CardIcon extends StatelessWidget {
  /// Creates a `CardIcon` widget.
  ///
  /// [icon] is the optional icon data to display. If not provided, it defaults to a bank logo.
  const CardIcon({super.key, this.icon});

  /// The icon data to display. If not provided, a default bank logo will be used.
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return icon == null
        ? SvgPicture.asset(
            Constants.bankLogo,
            package: Constants.packageName,
            width: 36,
            height: 36,
          )
        : Icon(key: key, icon);
  }
}
