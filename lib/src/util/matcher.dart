import 'package:flutter/material.dart';

import '../widgets/card_network_icon.dart';

/// A utility class for matching credit card numbers and resolving card network icons.
class Matcher {
  Matcher._();

  /// Checks if the input string matches a valid credit card number pattern.
  /// The matchCard() function works by first creating a regular expression that matches valid credit card numbers.
  /// The regular expression matches strings that start with 1, 2, or 3, followed by 15 digits, or start with 4, 5, or 6, followed by 16 digits.
  ///
  /// The matchCard() function then uses the regular expression to check if the input string matches the regular expression.
  /// If the input string matches the regular expression, then the function returns true.
  /// If the input string does not match the regular expression, then the function returns false. <br><br>
  /// Returns true if the input string matches the pattern, otherwise false.
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

  /// Resolves the card network icon based on the first character of the input string.
  ///
  /// Returns a widget representing the card network icon.
  ///
  /// - If the first character is '1', '2', or '3', returns the American Express icon.
  /// - If the first character is '35', returns the JCB icon.
  /// - If the first character is '4', returns the Visa icon.
  /// - If the first character is '5', returns the Mastercard icon.
  /// - If the first character is '6', returns the Discover icon.
  /// - Otherwise, returns the Verve icon.
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

  /// Checks if the input string matches the pattern '\d' (single digit). <br>
  ///
  /// Returns true if the input string matches the pattern, otherwise false. <br>
  ///
  /// This method is a utility for checking if all characters in the input string are digits. <br>
  static allMatch(String input) => RegExp(r'^\d$').hasMatch(input);
}
