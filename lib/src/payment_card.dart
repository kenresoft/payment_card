import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment_card/src/card_type.dart';
import 'package:payment_card/src/constants/constants.dart';
import 'package:payment_card/src/util/extensions.dart';
import 'package:payment_card/src/util/helper.dart';
import 'package:payment_card/src/widgets/card_currency_text.dart';
import 'package:payment_card/src/widgets/card_icon.dart';
import 'package:payment_card/src/widgets/card_image.dart';

/// A Flutter widget that displays a payment card with customizable properties such as the
/// card number, card network, card holder name, and background image.
/// The `PaymentCard` widget displays a payment card with customizable properties such as the
/// card number, card network, card holder name, and background image. <br />
/// It takes several required and optional parameters
/// such as `cardIssuerIcon`, `backgroundColor`, `backgroundImage`, `currency`, `cardNumber`, `validity`, `holder`,
/// `cardNetwork`, `cardTypeTextStyle`, `cardNumberStyles`, and `margin`. <br /><br />
///
/// The __build__ method of the __`PaymentCard`__ class returns a __Container__ widget with a height of 216 and a width of 320.
/// The __Container__ widget has a __BoxDecoration__ that includes a background image, a box shadow, a color, and a border
/// radius. <br />
/// The Container widget also has a __Stack__ widget as its child, which contains the various elements of the
/// payment card such as the card number, card network, card holder name, and card issuer icon.
///
/// The __`PaymentCard`__ class uses the __LayoutBuilder__ widget to get the maximum width of the parent widget.

class PaymentCard extends StatelessWidget {
  /// The `PaymentCard` constructor.
  ///
  /// Creates a payment card widget.
  ///
  /// [cardIssuerIcon] is an optional widget representing the card issuer icon.
  /// [backgroundColor] is the background color of the card.
  /// [backgroundImage] is the background image of the card.
  /// [currency] is the currency text widget.
  /// [cardNumber] is the card number.
  /// [validity] is the validity date of the card.
  /// [holder] is the name of the card holder.
  /// [cardNetwork] is the type of card network.
  /// [cardTypeTextStyle] is the text style for displaying the card type.
  /// [cardNumberStyles] is the style for displaying the card number.
  /// [margin] is the margin around the card.
  /// [cardNumberDivision] is the division number for spacing the card number.
  /// [isStrict] specifies whether to enforce strict spacing for the card number.
  const PaymentCard({
    super.key,
    this.cardIssuerIcon = const CardIcon(),
    required this.backgroundColor,
    required this.backgroundImage,
    required this.currency,
    required this.cardNumber,
    required this.validity,
    required this.holder,
    this.cardNetwork = CardNetwork.other,
    this.cardTypeTextStyle,
    this.cardNumberStyles,
    this.margin,
    this.cardNumberDivision,
    this.isStrict = true,
  });

  // Parameter documentation

  /// The icon representing the card issuer.
  final CardIcon? cardIssuerIcon;

  /// The background color of the payment card.
  final Color? backgroundColor;

  /// The background image of the payment card.
  final String? backgroundImage;

  /// The currency text displayed on the payment card.
  final Text? currency;

  /// The card number.
  final String cardNumber;

  /// Whether to enforce strict spacing of digits in the card number.
  final bool isStrict;

  /// The number of digits to group together in the card number.
  final int? cardNumberDivision;

  /// The validity date of the card.
  final String validity;

  /// The name of the card holder.
  final String holder;

  /// The network of the card.
  final CardNetwork? cardNetwork;

  /// The text style for the card type.
  final TextStyle? cardTypeTextStyle;

  /// The styles for the card number.
  /// If cardNumberStyles is not provided, the default style is used.
  CardNumberStyles get cardNumberStyle => cardNumberStyles ?? CardNumberStyles.lightStyle1;

  /// The styles for the card number.
  final CardNumberStyles? cardNumberStyles;

  /// The margin space around the payment card.
  final EdgeInsetsGeometry? margin;

  // Possible bugs
  // If the cardNumber parameter is null, the widget will throw an error.
  // If the validity parameter is null, the widget will throw an error.
  // If the holder parameter is null, the widget will throw an error.
  // If the cardNetwork parameter is null, the widget will throw an error.
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
        width: 360,
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
                const SizedBox(width: 30),
                const Text(
                  "VALID\nTHRU",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13),
                ),
                const SizedBox(width: 13),
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
            bottom: 10,
            left: 25,
            child: Container(
              alignment: Alignment.center,
              width: 120,
              height: 55,
              child: Text(
                holder,
                style: const TextStyle(
                  fontFamily: 'Inconsolata',
                  fontWeight: FontWeight.w500,
                  shadows: [BoxShadow(blurRadius: 0.1, offset: Offset(0, 0))],
                  fontSize: 18,
                ).applyPackage,
                overflow: TextOverflow.fade,
              ),
            ),
          ),

          /// Card Network
          Positioned(
            bottom: 10 /*cardNetwork.index == 1 ? -10 : 0*/,
            right: 10,
            //height: 45,
            width: 80,
            child: /*Image(
              image: ExactAssetImage(cardNetwork.getTypeIcon, package: Constants.packageName),
              width: 75,
              height: 75,
              fit: BoxFit.cover,
            ),*/
                Container(color: kColor, child: cardNetwork?.getTypeIcon(cardNumber, isStrict)),
          ),

          Positioned(
            top: 70,
            left: 100,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Text(
                cardNetwork?.index == 1 ? '' : 'Debit',
                style: cardTypeTextStyle,
              ),
            ),
          ),
        ]),
      );
    });
  }
}
