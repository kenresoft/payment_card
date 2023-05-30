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
