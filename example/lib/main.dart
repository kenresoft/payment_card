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
              buildPaymentCard(color: Colors.cyan, cardType: CardType.americanExpress, '2345678909'),
              const SizedBox(height: 10),
              buildPaymentCard(color: Colors.orange, cardType: CardType.discover, '5234567890'),
              const SizedBox(height: 10),
              buildPaymentCard(color: Colors.purpleAccent, cardType: CardType.jcb, '6234567890'),
              const SizedBox(height: 10),
              buildPaymentCard(color: Colors.redAccent, cardType: CardType.mastercard, '4234567890'),
              const SizedBox(height: 10),
              buildPaymentCard(color: Colors.teal, cardType: CardType.visa, '5234567890'),
              const SizedBox(height: 10),
              buildPaymentCard(color: Colors.pink, cardType: CardType.verve, '6234567890'),
              const SizedBox(height: 10),
              buildPaymentCard(bg: 'packages/payment_card/assets/images/bg/1.png', cardType: CardType.visa, '3534567890'),
              const SizedBox(height: 10),
              buildPaymentCard(bg: 'packages/payment_card/assets/images/bg/2.png', cardType: CardType.mastercard, '5234567890'),
              const SizedBox(height: 10),
              buildPaymentCard(bg: 'packages/payment_card/assets/images/bg/3.png', cardType: CardType.visa, '6234567890'),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  PaymentCard buildPaymentCard(String cardNumber, {CardType? cardType, Color? color, String? bg}) {
    return PaymentCard(
      cardIssuerIcon: const CardIcon(),
      backgroundColor: color,
      backgroundImage: bg,
      currency: const Text('Naira', style: TextStyle(color: Colors.black)),
      cardNumber: cardNumber,
      cardNumberDivision: 3,
      cardNumberStyles: CardNumberStyles.lightStyle1,
      validity: '06/24',
      holder: 'JAMES SMITH',
      cardType: cardType,
      isStrict: true,
      cardTypeTextStyle: const TextStyle(fontSize: 18, color: Colors.black),
    );
  }
}
