import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:payment_card/src/card_type.dart';
import 'package:payment_card/src/constants/constants.dart';
import 'package:payment_card/src/extensions.dart';
import 'package:payment_card/src/widgets/card_currency_text.dart';
import 'package:payment_card/src/widgets/card_icon.dart';
import 'package:payment_card/src/widgets/card_image.dart';

class PaymentCard extends StatelessWidget {
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
  }) : super(key: key);

  final CardIcon? cardIssuerIcon;
  final Color? backgroundColor;
  final String? backgroundImage;
  final Text? currency;
  final String? cardNumber;
  final String? validity;
  final String? holder;
  final CardType? cardType;
  final TextStyle? cardTypeTextStyle;
  final CardNumberStyles? cardNumberStyles;
  final EdgeInsetsGeometry? margin;

  CardNumberStyles? get cardNumberStyle => cardNumberStyles ?? CardNumberStyles.lightStyle1;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      log(c.maxWidth.toString());
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
            const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                padding: EdgeInsets.only(left: 35),
                child: Image(
                  image: ExactAssetImage(Constants.cardChip, package: Constants.packageName),
                  width: 45,
                  height: 45,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Image(
                  image: ExactAssetImage(Constants.rfid, package: Constants.packageName),
                  width: 45,
                  height: 40,
                  isAntiAlias: true,
                  filterQuality: FilterQuality.none,
                ),
              )
            ]),
            const SizedBox(height: 5),

            /// Number
            Text(
              cardNumber!,
              style: cardNumberStyle!.buildTextStyle(),
            ),

            const SizedBox(height: 3),

            /// Validity Date
            Column(children: [
              const Text("MONTH/YEAR", style: TextStyle(fontSize: 11)),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("VALID\nTHRU", textAlign: TextAlign.center),
                const SizedBox(width: 10),
                Text(validity!, style: const TextStyle(fontSize: 20)),
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
              holder!,
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
            bottom: cardType?.index == 1 ? -10 : 0,
            right: 10,
            child: Image(
              image: ExactAssetImage(cardType!.getTypeIcon, package: Constants.packageName),
              width: 75,
              height: 75,
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            bottom: 3,
            right: 10,
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
