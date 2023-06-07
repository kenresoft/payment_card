import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment_card/src/util/matcher.dart';
import 'package:payment_card/src/widgets/card_network.dart';

import '../../payment_card.dart';
import '../constants/constants.dart';

extension CardTypeIcon on CardType {
  /// The `getTypeIcon()` function can be used to get icons for other types of cards, such as debit cards, gift cards, and prepaid cards.<br>
  ///
  ///The `getTypeIcon()` function works by first checking if the input string should be validated strictly. <br>
  ///If the input string should be validated strictly, then the function uses the `resolvePrefix()` function to get a
  ///widget that displays the icon for the credit card network associated with the first character of the input string. <br>
  ///If the input string should not be validated strictly, then the function uses a switch statement to get a widget that
  ///displays the icon for the credit card network associated with the input string. <br>
  ///
  ///The `getTypeIcon()` function then returns the widget.

  Widget getTypeIcon(String number, bool isStrict) {
    if (isStrict) {
      return Matcher.resolvePrefix(number, (a, b) => this != CardType.verve ? a : b);
    } else {
      return switch (this) {
        CardType.visa => CardNetwork.visa,
        CardType.mastercard => CardNetwork.mastercard,
        CardType.verve => CardNetwork.verve,
        CardType.americanExpress => CardNetwork.americanExpress,
        CardType.discover => CardNetwork.discover,
        CardType.jcb => CardNetwork.jcb,
        _ => CardNetwork.visa,
      };
    }
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
