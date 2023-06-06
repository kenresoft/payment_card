import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment_card/src/card_type.dart';
import 'package:payment_card/src/constants/constants.dart';
import 'package:payment_card/src/util/extensions.dart';
import 'package:payment_card/src/util/helper.dart';
import 'package:payment_card/src/widgets/card_currency_text.dart';
import 'package:payment_card/src/widgets/card_icon.dart';
import 'package:payment_card/src/widgets/card_image.dart';

class PaymentCard extends StatelessWidget {
  /// The __`PaymentCard`__ class is a Flutter widget that displays a payment card with customizable properties such as the
  /// card number, card type, card holder name, and background image. It takes several required and optional parameters
  /// such as `cardIssuerIcon`, `backgroundColor`, `backgroundImage`, `currency`, `cardNumber`, `validity`, `holder`,
  /// `cardType`, `cardTypeTextStyle`, `cardNumberStyles`, and `margin`.
  ///
  /// The __build__ method of the __`PaymentCard`__ class returns a __Container__ widget with a height of 216 and a width of 320.
  /// The __Container__ widget has a __BoxDecoration__ that includes a background image, a box shadow, a color, and a border
  /// radius. The Container widget also has a __Stack__ widget as its child, which contains the various elements of the
  /// payment card such as the card number, card type, card holder name, and card issuer icon.
  ///
  /// The __`PaymentCard`__ class uses the __LayoutBuilder__ widget to get the maximum width of the parent widget
  // and logs it using the _log_ function from the dart:developer library.
  const PaymentCard({
    Key? key,
    this.cardIssuerIcon = const CardIcon(),
    required this.backgroundColor,
    required this.backgroundImage,
    required this.currency,
    required this.cardNumber,
    required this.validity,
    required this.holder,
    required this.cardType,
    this.cardTypeTextStyle,
    this.cardNumberStyles,
    this.margin,
    this.cardNumberDivision,
    this.isStrict = true,
  }) : super(key: key);

  final CardIcon? cardIssuerIcon;
  final Color? backgroundColor;
  final String? backgroundImage;
  final Text? currency;
  final String cardNumber;
  final bool isStrict;
  final int? cardNumberDivision;
  final String validity;
  final String holder;
  final CardType? cardType;
  final TextStyle? cardTypeTextStyle;
  final CardNumberStyles? cardNumberStyles;
  final EdgeInsetsGeometry? margin;

  /// If cardNumberStyles is not provided, use the default style
  CardNumberStyles get cardNumberStyle => cardNumberStyles ?? CardNumberStyles.lightStyle1;

  //TODO:
  // Possible bugs
  // If the cardNumber parameter is null, the widget will throw an error.
  // If the validity parameter is null, the widget will throw an error.
  // If the holder parameter is null, the widget will throw an error.
  // If the cardType parameter is null, the widget will throw an error.
  // If the cardTypeTextStyle parameter is null, the widget will use the default text style.
  // If the cardNumberStyles parameter is null, the widget will use the default card number styles.

  // Add input validation to ensure that the required parameters are not null.
  // Issue track here: [https://github.com/kenresoft/payment_card/issues/22]

  @override
  Widget build(BuildContext context) {
    Color? kColor;
    if (backgroundColor == Colors.deepOrange || backgroundColor == Colors.deepOrangeAccent) {
      kColor = Colors.black12;
    } else {
      kColor = null;
    }
    return LayoutBuilder(builder: (context, c) {
      //log(c.maxWidth.toString());
      return Container(
        margin: margin,
        height: 216,
        width: 320,
        decoration: BoxDecoration(
          image: DecorationImage(image: buildExactAssetImage(backgroundImage), fit: BoxFit.cover),
          boxShadow: const [
            BoxShadow(blurRadius: 3, offset: Offset(1, 1)) /*, BoxShadow(blurRadius: 1, offset: Offset(-1, -1))*/
          ],
          color: backgroundImage == null ? backgroundColor : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(children: [
          Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 35, left: 35, bottom: 5),
                child: buildCurrencyText(currency),
              ),

              /// Bank Logo
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 35),
                child: cardIssuerIcon,
              ),
            ]),

            /// Chip
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Padding(
                padding: EdgeInsets.only(left: 35),
                child: Image(
                  image: ExactAssetImage(Constants.cardChip, package: Constants.packageName),
                  width: 45,
                  height: 45,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: /*Image(
                  image: ExactAssetImage(Constants.rfid, package: Constants.packageName),
                  width: 45,
                  height: 40,
                  isAntiAlias: true,
                  filterQuality: FilterQuality.none,
                ),*/
                    SvgPicture.asset(
                  Constants.rfid,
                  package: Constants.packageName,
                  width: 32,
                  height: 32,
                ),
              )
            ]),
            const SizedBox(height: 5),

            /// Number
            Text(
              spacedDigits(cardNumber, cardNumberDivision, isStrict),
              style: cardNumberStyle.buildTextStyle(),
            ),

            const SizedBox(height: 3),

            /// Validity Date
            Column(children: [
              const Text("MONTH/YEAR", style: TextStyle(fontSize: 11)),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("VALID\nTHRU", textAlign: TextAlign.center),
                const SizedBox(width: 10),
                Text(validity, style: const TextStyle(fontSize: 20)),
              ])
            ]),
          ]),

          /// Arrow
          const Positioned(
            bottom: 45,
            left: 0,
            child: Icon(Icons.arrow_left, size: 36),
          ),

          /// Holder's name
          Positioned(
            bottom: 15,
            left: 35,
            child: Text(
              holder,
              style: const TextStyle(
                fontFamily: 'Inconsolata',
                fontWeight: FontWeight.w500,
                shadows: [BoxShadow(blurRadius: 0.1, offset: Offset(0, 0))],
                fontSize: 18,
              ).applyPackage,
            ),
          ),

          /// Card Type
          Positioned(
            bottom: 10 /*cardType.index == 1 ? -10 : 0*/,
            right: 10,
            //height: 45,
            width: 80,
            child: /*Image(
              image: ExactAssetImage(cardType.getTypeIcon, package: Constants.packageName),
              width: 75,
              height: 75,
              fit: BoxFit.cover,
            ),*/
                Container(color: kColor, child: cardType?.getTypeIcon(cardNumber, isStrict)),
          ),

          Positioned(
            top: 70,
            left: 100,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Text(
                cardType?.index == 1 ? '' : 'Debit',
                style: cardTypeTextStyle,
              ),
            ),
          ),
        ]),
      );
    });
  }
}
