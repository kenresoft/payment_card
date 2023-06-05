import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../payment_card.dart';
import '../constants/constants.dart';

extension CardTypeIcon on CardType {
  Widget get getTypeIcon {
    return switch (this) {
      CardType.visa => const Image(
          image: ExactAssetImage(
            Constants.visa,
            package: Constants.packageName,
          ),
          height: 40,
          fit: BoxFit.fitWidth,
        ),
      CardType.mastercard => SvgPicture.asset(
          Constants.mastercard,
          package: Constants.packageName,
          height: 40,
          fit: BoxFit.contain,
        ),
      CardType.verve => SvgPicture.asset(
          Constants.verve,
          package: Constants.packageName,
          height: 40,
          fit: BoxFit.contain,
        ),
      CardType.americanExpress => SvgPicture.asset(
          Constants.americanExpress,
          package: Constants.packageName,
          height: 40,
          fit: BoxFit.fitWidth,
        ),
      CardType.discover => SvgPicture.asset(
          Constants.discover,
          package: Constants.packageName,
          height: 40,
          fit: BoxFit.fitWidth,
        ),
      CardType.jcb => SvgPicture.asset(
          Constants.jcb,
          package: Constants.packageName,
          height: 35,
          fit: BoxFit.contain,
        ),
      _ => SvgPicture.asset(
          Constants.visa,
          package: Constants.packageName,
          height: 40,
          fit: BoxFit.fitWidth,
        ),
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
