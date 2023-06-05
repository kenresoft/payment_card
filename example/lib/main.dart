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
              buildPaymentCard(color: Colors.cyan, CardType.americanExpress),
              const SizedBox(height: 10),
              buildPaymentCard(color: Colors.orange, CardType.discover),
              const SizedBox(height: 10),
              buildPaymentCard(color: Colors.purpleAccent, CardType.jcb),
              const SizedBox(height: 10),
              buildPaymentCard(color: Colors.redAccent, CardType.mastercard),
              const SizedBox(height: 10),
              buildPaymentCard(color: Colors.teal, CardType.visa),
              const SizedBox(height: 10),
              buildPaymentCard(color: Colors.pink, CardType.verve),
              const SizedBox(height: 10),
              buildPaymentCard(bg: 'packages/payment_card/assets/images/bg/1.png', CardType.visa),
              const SizedBox(height: 10),
              buildPaymentCard(bg: 'packages/payment_card/assets/images/bg/2.png', CardType.mastercard),
              const SizedBox(height: 10),
              buildPaymentCard(bg: 'packages/payment_card/assets/images/bg/3.png', CardType.visa),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  PaymentCard buildPaymentCard(CardType cardType, {Color? color, String? bg}) {
    return PaymentCard(
      cardIssuerIcon: const CardIcon(),
      backgroundColor: color,
      backgroundImage: bg,
      currency: const Text('Naira', style: TextStyle(color: Colors.black)),
      cardNumber: '1234567890123456',
      cardNumberStyles: CardNumberStyles.lightStyle1,
      validity: '06/24',
      holder: 'JAMES SMITH',
      cardType: cardType,
      cardTypeTextStyle: const TextStyle(fontSize: 18, color: Colors.black),
    );
  }
}
