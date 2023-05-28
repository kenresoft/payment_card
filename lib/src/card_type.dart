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
      _ => Constants.visa
    };
  }
}
