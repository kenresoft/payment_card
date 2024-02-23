import 'package:flutter/material.dart';
import 'package:payment_card/src/util/extensions.dart';

/// Builds a widget to display currency text.
///
/// [currency] is the Text widget containing the currency data to display.
/// It returns a Text widget styled with a default or custom TextStyle for the currency text.
Widget buildCurrencyText(Text? currency) {
  // Default text style for currency
  TextStyle textStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 15,
  );

  // If the currency text has a custom style, apply it to the text style
  if (currency!.style != null) {
    textStyle = currency.style!.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
  }

  return Builder(builder: (context) {
    // Build a SizedBox with fixed width and height to constrain the currency text
    return SizedBox(
      width: 130,
      height: 20,
      // Display the currency text with the calculated text style
      child: Text(currency.data!, style: textStyle.applyPackage),
    );
  });
}
