import 'package:flutter/material.dart';
import 'package:payment_card/src/card_type.dart';
import 'package:payment_card/src/constants/constants.dart';
import 'package:payment_card/src/widgets/card_icon.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    Key? key,
    this.cardIssuerIcon = const CardIcon(),
    required this.backgroundColor,
    required this.backgroundImage,
    required this.currency,
    required this.cardNumber,
    required this.expiration,
    required this.validity,
    required this.holder,
    required this.cardType,
  }) : super(key: key);

  final CardIcon? cardIssuerIcon;
  final Color? backgroundColor;
  final String? backgroundImage;
  final String? currency;
  final String? cardNumber;
  final String? expiration;
  final String? validity;
  final String? holder;
  final CardType? cardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 280, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(image: ExactAssetImage(Constants.worldMap)),
          boxShadow: const [
            BoxShadow(blurRadius: 3, offset: Offset(1, 1)) /*, BoxShadow(blurRadius: 1, offset: Offset(-1, -1))*/
          ],
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(children: [
          Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 35, left: 35, bottom: 5),
                child: Text(currency!, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              ),

              /// Bank Logo
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 35),
                child: cardIssuerIcon,
              ),
            ]),

            /// Chip
            const Row(children: [
              Padding(
                padding: EdgeInsets.only(left: 35),
                child: Image(image: ExactAssetImage(Constants.cardChip, package: Constants.packageName), width: 45, height: 45),
                //child: Icon(CupertinoIcons.creditcard, color: Colors.yellow, size: 40),
              )
            ]),
            const SizedBox(height: 5),

            /// Number
            Text(
              cardNumber!,
              style: const TextStyle(
                shadows: [BoxShadow(blurRadius: 0.1, offset: Offset(1, 1))],
                fontSize: 28,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 3),

            /// Validity Date
            Column(children: [
              Text("MONTH/YEAR", style: TextStyle(fontSize: 11)),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("VALID \n THRU"),
                SizedBox(width: 10),
                Text("06/24", style: TextStyle(fontSize: 20)),
              ])
            ]),
          ]),
          Positioned(
            bottom: 10,
            right: 10,
            child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Image(
                image: ExactAssetImage(cardType!.getTypeIcon(), package: Constants.packageName),
                width: 90,
                height: 30,
                fit: BoxFit.cover,
              ),
              //Text("VISA", style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.blue)),
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(
                  cardType.toString(),
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
            ]),
          ),

          /// Holder's name
          Positioned(
            bottom: 15,
            left: 35,
            child: Text(
              "JAMES SMITH",
              style: TextStyle(shadows: [BoxShadow(blurRadius: 0.1, offset: Offset(0, 0))], fontSize: 18),
            ),
          ),

          /// Arrow
          Positioned(
            bottom: 45,
            child: Icon(Icons.arrow_left, size: 36),
          ),
        ]),
      ),
    );
  }
}
