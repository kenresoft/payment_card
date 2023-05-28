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
    return const Scaffold(
      body: PaymentCard(
        cardIssuerIcon: CardIcon(),
        backgroundColor: Colors.deepPurple,
        backgroundImage: '',
        currency: '',
        cardNumber: "1234 5678 9012 3456",
        expiration: '',
        validity: '',
        holder: '',
        cardType: '',
        cardTypeIcon: CardIcon(),
      ),
    );
  }
}
