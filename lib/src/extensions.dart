import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../payment_card.dart';
import 'constants/constants.dart';

extension CardTypeIcon on CardType {
  String get getTypeIcon {
    return switch (this) {
      CardType.visa => Constants.visaNew,
      CardType.mastercard => Constants.mastercardNew,
      _ => Constants.visa,
    };
  }
}

extension StringExt on String {
  String get toFirstUpperCase {
    final first = substring(0, 1).toUpperCase();
    final last = substring(1);
    return first + last;
  }
}

extension TextStyleExt on TextStyle {
  TextStyle get applyPackage {
    return copyWith(package: Constants.packageName);
  }
}

extension CardVariantExt on CardNumberStyles {
  TextStyle buildTextStyle() {
    return switch (this) {
      CardNumberStyles.lightStyle1 => TextStyle(
          fontFamily: 'Inconsolata',
          fontWeight: FontWeight.w300,
          package: Constants.packageName,
          shadows: const [
            BoxShadow(
              blurRadius: 1,
              color: CupertinoColors.systemGrey3,
              offset: Offset(0, 0),
            )
          ],
          fontSize: 28,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..color = Colors.white,
        ),
      CardNumberStyles.lightStyle2 => const TextStyle(
          fontFamily: Constants.inconsolata,
          fontWeight: FontWeight.w500,
          shadows: [BoxShadow(blurRadius: 0.1, offset: Offset(0, 0))],
          fontSize: 28,
        ).applyPackage,
      CardNumberStyles.lightStyle3 => const TextStyle(
          fontFamily: Constants.inconsolata,
          fontWeight: FontWeight.w500,
          shadows: [BoxShadow(blurRadius: 0.1, offset: Offset(0, 0))],
          fontSize: 28,
        ),
      _ => const TextStyle(
          fontFamily: Constants.inconsolata,
          fontWeight: FontWeight.w500,
          shadows: [BoxShadow(blurRadius: 0.1, offset: Offset(0, 0))],
          fontSize: 28,
        ),
    };
  }
}
