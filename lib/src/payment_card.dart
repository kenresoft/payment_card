import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 280, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [BoxShadow(blurRadius: 7, offset: Offset(1, 1)), BoxShadow(blurRadius: 7, offset: Offset(-1, -1))],
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Stack(children: [
          Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(top: 35, left: 35, bottom: 5),
                child: Text("Pound", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
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
                child: Icon(CupertinoIcons.creditcard, color: Colors.yellow, size: 40),
              )
            ]),
            SizedBox(height: 10),

            /// Number
            Text(
              "1234 5678 9012 3456",
              style: TextStyle(shadows: [BoxShadow(blurRadius: 0.1, offset: Offset(1, 1))], fontSize: 28, color: Colors.white),
            ),

            SizedBox(height: 3),

            /// Validity Date
            Column(children: [
              Text("MONTH/YEAR", style: TextStyle(fontSize: 11)),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("VALID THRU"),
                SizedBox(width: 10),
                Text("06/24", style: TextStyle(fontSize: 20)),
              ])
            ]),
          ]),
          Positioned(
            bottom: 10,
            right: 15,
            child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text("VISA", style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.blue)),
              Text("Debit", style: TextStyle(fontSize: 18, color: Colors.blue)),
            ]),
          ),

          /// Holder's name
          Positioned(
            bottom: 25,
            left: 35,
            child: Text("JAMES SMITH", style: TextStyle(shadows: [BoxShadow(blurRadius: 0.1, offset: Offset(0, 1))], fontSize: 18)),
          ),

          /// Arrow
          Positioned(bottom: 45, child: Icon(Icons.arrow_left, size: 36)),
        ]),
      ),
    );
  }
}
