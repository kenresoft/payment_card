import 'package:flutter/material.dart';
import 'package:payment_card/src/constants/constants.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 280, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [BoxShadow(blurRadius: 3, offset: Offset(1, 1))/*, BoxShadow(blurRadius: 1, offset: Offset(-1, -1))*/],
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Stack(children: [
          Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(top: 35, left: 35, bottom: 5),
                child: Text("Naira", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              ),

              /// Bank Logo
              Padding(
                padding: EdgeInsets.only(top: 10, right: 35),
                child: FlutterLogo(size: 40),
              ),
            ]),

            /// Chip
            Row(children: [
              Padding(
                padding: EdgeInsets.only(left: 35),
                child: Image(image: ExactAssetImage(Constants.cardChip, package: Constants.packageName), width: 45, height: 45),
                //child: Icon(CupertinoIcons.creditcard, color: Colors.yellow, size: 40),
              )
            ]),
            SizedBox(height: 5),

            /// Number
            Text(
              "1234 5678 9012 3456",
              style: TextStyle(
                shadows: [BoxShadow(blurRadius: 0.1, offset: Offset(1, 1))],
                fontSize: 28,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 3),

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
                image: ExactAssetImage(Constants.visaIcon, package: Constants.packageName),
                width: 90,
                height: 30,
                fit: BoxFit.cover,
              ),
              //Text("VISA", style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.blue)),
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(
                  "Debit",
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
