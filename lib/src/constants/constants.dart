import 'package:payment_card/src/card_type.dart';
import 'package:payment_card/src/util/extensions.dart';

class Constants {
  Constants._();

  static const String packageName = 'payment_card';
  static const String root = '/';

  //Images route
  static const String imageDir = "assets/images";
  static const String iconDir = "assets/icons";

  //Images
  static const String worldMap = "$imageDir/world_map.png";
  static const String map = "$imageDir/image_maps.jpg";

  static const String one = "$imageDir/bg/1.png";
  static const String two = "$imageDir/bg/2.png";
  static const String three = "$imageDir/bg/3.png";

  //Icons
  static const String visa = "$iconDir/visa.png";
  static const String visaNew = "$iconDir/visa_new.png";
  static const String mastercardNew = "$iconDir/mastercard_new.png";
  static const String cardChip = "$iconDir/card_chip.png";
  static const String cardCopper = "$iconDir/card_copper.png";
  static const String rfid = "$iconDir/rfid.png";

  //Fonts
  static const String inconsolata = "Inconsolata";

  //
  static String card(CardType cardType) => cardType.name.toFirstUpperCase;
}
