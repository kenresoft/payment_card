import 'package:flutter/material.dart';

import '../widgets/card_network_icon.dart';

class Matcher {
  Matcher._();

  /// The matchCard() function works by first creating a regular expression that matches valid credit card numbers.
  /// The regular expression matches strings that start with 1, 2, or 3, followed by 15 digits, or start with 4, 5, or 6, followed by 16 digits.
  ///
  /// The matchCard() function then uses the regular expression to check if the input string matches the regular expression.
  /// If the input string matches the regular expression, then the function returns true.
  /// If the input string does not match the regular expression, then the function returns false. <br><br>
  ///
  /// Here is a breakdown of the regular expression:
  /// * `^`: The caret symbol matches the beginning of the string.
  /// * `[0-9]`: The character class matches any digit.
  /// * `\d{15}`: The sequence of digits matches 15 digits.
  /// * `|`: The pipe symbol matches either the preceding expression or the following expression.
  /// * `[456]`: The character class matches the digits 4, 5, or 6.
  /// * `\d{16}`: The sequence of digits matches 16 digits.
  /// * ``: The dollar sign symbol matches the end of the string.
  static bool matchCard(String input) {
    //RegExp regex = RegExp(r'^[456]\d{15}|[456]\d{16}$');
    RegExp regex = RegExp(r'^[1-3]\d{14}|[456]\d{15}$');
    final match = regex.hasMatch(input);
    return match;
  }

  /// The *`resolvePrefix()`* function works by first getting the first character of the input string.
  /// The function then uses the first character to determine which widget to return.
  static Widget resolvePrefix(String input, Widget Function(Widget a, Widget b) widgets) {
    //Match? match = regex.matchAsPrefix(input);

    final first = input[0];
    final second = input[0] == '3' && input[1] == '5' ? 5 : -1;
    (String, int) char = (first, second);
    return switch (char) {
      ('1', -1) => CardNetworkIcon.americanExpress,
      ('2', -1) => CardNetworkIcon.americanExpress,
      ('3', -1) => CardNetworkIcon.americanExpress,
      ('3', 5) => CardNetworkIcon.jcb,
      ('4', -1) => CardNetworkIcon.visa,
      ('5', -1) => widgets(CardNetworkIcon.mastercard, CardNetworkIcon.verve),
      ('6', -1) => CardNetworkIcon.discover,
      _ => CardNetworkIcon.verve,
    };
  }

  static allMatch(String input) => RegExp(r'^\d$').hasMatch(input);
}
