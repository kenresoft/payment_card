import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment_card/src/util/matcher.dart';

import '../../payment_card.dart';
import '../constants/constants.dart';
import '../widgets/card_network_icon.dart';

/// Extension methods for the CardNetwork enum.
extension CardTypeIcon on CardNetwork {
  /// The `getTypeIcon()` function can be used to get icons for other types of cards, such as debit cards, gift cards, and prepaid cards.<br>
  /// Returns an icon widget representing the card network.
  ///
  ///The `getTypeIcon()` function works by first checking if the input string should be validated strictly. <br>
  ///If the input string should be validated strictly, then the function uses the `resolvePrefix()` function to get a
  ///widget that displays the icon for the credit card network associated with the first character of the input string. <br>
  ///If the input string should not be validated strictly, then the function uses a switch statement to get a widget that
  ///displays the icon for the credit card network associated with the input string. <br><br>
  ///
  /// The [number] parameter represents the card number.
  /// The [isStrict] parameter specifies whether to validate the card number strictly.<br>
  ///
  /// If [isStrict] is true, it resolves the prefix of the card number to determine the card network.
  /// Otherwise, it directly returns the icon based on the card network.
  ///
  ///The `getTypeIcon()` function then returns the widget.
  Widget getTypeIcon(String number, bool isStrict) {
    if (isStrict) {
      return Matcher.resolvePrefix(number, (a, b) => this != CardNetwork.verve ? a : b);
    } else {
      return switch (this) {
        CardNetwork.visa => CardNetworkIcon.visa,
        CardNetwork.mastercard => CardNetworkIcon.mastercard,
        CardNetwork.verve => CardNetworkIcon.verve,
        CardNetwork.americanExpress => CardNetworkIcon.americanExpress,
        CardNetwork.discover => CardNetworkIcon.discover,
        CardNetwork.jcb => CardNetworkIcon.jcb,
        _ => CardNetworkIcon.visa,
      };
    }
  }
}

/// Extension methods for the String class.
extension StringExt on String {
  /// Converts the first character of the string to uppercase.
  String get toFirstUpperCase {
    final first = substring(0, 1).toUpperCase();
    final last = substring(1);
    return first + last;
  }
}

/// Extension methods for the TextStyle class.
extension TextStyleExt on TextStyle {
  /// Applies the package name to the TextStyle.
  TextStyle get applyPackage {
    return copyWith(package: Constants.packageName);
  }
}

/// Extension methods for the CardNumberStyles enum.
extension CardVariantExt on CardNumberStyles {
  /// Builds a TextStyle based on the card number style.
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
