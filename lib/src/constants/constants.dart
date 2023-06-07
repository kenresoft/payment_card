import 'package:payment_card/src/card_type.dart';
import 'package:payment_card/src/util/extensions.dart';

class Constants {
  Constants._();

  static const String packageName = 'payment_card';
  static const String root = '/';

  //Images route
  static const String imageDir = "assets/images";
  static const String iconDir = "assets/icons";

  // Icons routes
  static const String jpgDir = "$iconDir/jpg";
  static const String pngDir = "$iconDir/png";
  static const String svgDir = "$iconDir/svg";

  //Images
  static const String worldMap = "$imageDir/world_map.png";
  static const String map = "$imageDir/image_maps.jpg";

  // PNGs
  static const String one = "$imageDir/bg/1.png";
  static const String two = "$imageDir/bg/2.png";
  static const String three = "$imageDir/bg/3.png";

  static const String cardChip = "$pngDir/card_chip.png";

  static const String visa = "$pngDir/visa_new.png";
  static const String americanExpress = "$pngDir/american_express.png";

/*
  static const String visaNew = "$iconDir/visa_new.png";
  static const String mastercardNew = "$iconDir/mastercard_new.png";
  static const String verve = "$iconDir/verve.png";
  static const String americanExpress = "$iconDir/american_express.png";
  static const String discover = "$iconDir/discover.png";
  static const String jcb = "$iconDir/jcb.png";
  static const String cardCopper = "$iconDir/card_copper.png";
  static const String rfid = "$iconDir/rfid.png";
  */

  // SVGs
  static const String rfid = "$svgDir/rfid.svg";

  //static const String visa = "$svgDir/visa.svg";
  static const String mastercard = "$svgDir/mastercard.svg";
  static const String verve = "$svgDir/verve.svg";
  //static const String americanExpress = "$svgDir/american_express.svg";
  static const String discover = "$svgDir/discover.svg";
  static const String jcb = "$svgDir/jcb.svg";

  //Fonts
  static const String inconsolata = "Inconsolata";

  //
  static String card(CardNetwork cardType) => cardType.name.toFirstUpperCase;
}
