import 'dart:developer';

import 'package:flutter/material.dart';

import 'extensions.dart';

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
bool matchCard(String input) {
  //RegExp regex = RegExp(r'^[456]\d{15}|[456]\d{16}$');
  RegExp regex = RegExp(r'^[1-3]\d{15}|[456]\d{16}$');
  final match = regex.hasMatch(input);
  return match;
}

/// The *`resolvePrefix()`* function works by first getting the first character of the input string.
/// The function then uses the first character to determine which widget to return.
Widget resolvePrefix(String input, Widget Function(Widget a, Widget b) widgets) {
  //Match? match = regex.matchAsPrefix(input);
  log(input[0]);
  return switch (input[0]) {
    '1' => americanExpress,
    '2' => americanExpress,
    '3' => americanExpress,
    '4' => visa,
    '5' => widgets(mastercard, verve),
    '6' => discover,
    _ => visa,
  };
}
