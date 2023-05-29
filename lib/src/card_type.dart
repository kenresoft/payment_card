import 'constants/constants.dart';

enum CardType {
  visa,
  mastercard,
}

extension CardTypeIcon on CardType {
  String getTypeIcon() {
    return switch (this) {
      CardType.visa => Constants.visaNew,
      CardType.mastercard => Constants.mastercardNew,
      _ => Constants.visa,
    };
  }
}

extension StringExt on String {
  String toFirstUpperCase() {
    final first = substring(0, 1).toUpperCase();
    final last = substring(1);
    return first + last;
  }
}
