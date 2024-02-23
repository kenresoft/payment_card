import 'package:flutter/material.dart';
import 'package:payment_card/src/util/extensions.dart';

Widget buildCurrencyText(Text? currency) {
  TextStyle textStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 15,
  );
  if (currency!.style != null) {
    textStyle = currency.style!.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
  }
  return Builder(builder: (context) {
    return SizedBox(
      width: 130,
      height: 20,
      child: Text(currency.data!, style: textStyle.applyPackage),
    );
  });
}
