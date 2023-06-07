import 'package:flutter/material.dart';
import 'package:payment_card/payment_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment Card',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const PaymentCardExample(title: 'Payment Card Example'),
    );
  }
}

class PaymentCardExample extends StatefulWidget {
  const PaymentCardExample({super.key, required this.title});

  final String title;

  @override
  State<PaymentCardExample> createState() => _PaymentCardExampleState();
}

class _PaymentCardExampleState extends State<PaymentCardExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              buildPaymentCard(color: Colors.cyan, cardType: CardNetwork.americanExpress, '4345678909123456'),
              const SizedBox(height: 10),
              buildPaymentCard(color: Colors.orange, cardType: CardNetwork.discover, '5234567890123456'),
              const SizedBox(height: 10),
              buildPaymentCard(color: Colors.purpleAccent, cardType: CardNetwork.jcb, '6234567890123456'),
              const SizedBox(height: 10),
              buildPaymentCard(color: Colors.redAccent, cardType: CardNetwork.mastercard, '3534567890123456'),
              const SizedBox(height: 10),
              buildPaymentCard(color: Colors.teal, cardType: CardNetwork.visa, '72345678901234567890'),
              const SizedBox(height: 10),
              buildPaymentCard(color: Colors.pink, cardType: CardNetwork.verve, '4234567890123456'),
              const SizedBox(height: 10),
              buildPaymentCard(bg: 'packages/payment_card/assets/images/bg/1.png', cardType: CardNetwork.visa, '55234567890123456'),
              const SizedBox(height: 10),
              buildPaymentCard(bg: 'packages/payment_card/assets/images/bg/2.png', cardType: CardNetwork.mastercard, '6234567890123456'),
              const SizedBox(height: 10),
              buildPaymentCard(bg: 'packages/payment_card/assets/images/bg/3.png', cardType: CardNetwork.visa, '1234567890123456'),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  PaymentCard buildPaymentCard(String cardNumber, {CardNetwork? cardType, Color? color, String? bg}) {
    return PaymentCard(
      cardIssuerIcon: const CardIcon(),
      backgroundColor: color,
      backgroundImage: bg,
      currency: const Text('Naira', style: TextStyle(color: Colors.black)),
      cardNumber: cardNumber,
      cardNumberStyles: CardNumberStyles.lightStyle1,
      validity: '06/24',
      holder: 'JAMES SMITH',
      cardTypeTextStyle: const TextStyle(fontSize: 18, color: Colors.black),
    );
  }
}
