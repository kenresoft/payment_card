import 'package:flutter/material.dart';
import 'package:payment_card/payment_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Payment Card Examples'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildPaymentCardExample1(),
                const SizedBox(height: 16),
                buildPaymentCardExample2(),
                const SizedBox(height: 16),
                buildPaymentCardExample3(),
                const SizedBox(height: 16),
                buildPaymentCardExample4(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPaymentCardExample1() {
    return const PaymentCard(
      cardIssuerIcon: CardIcon(icon: Icons.credit_card),
      backgroundColor: Colors.blue,
      backgroundGradient: LinearGradient(
        colors: [Colors.purple, Colors.indigo],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      currency: Text('EUR'),
      cardNumber: '1234567890123456',
      validity: '10/24',
      holder: 'Jane Doe',
      cardNetwork: CardNetwork.visa,
      cardTypeTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      cardNumberStyles: CardNumberStyles.darkStyle4,
      backgroundImage: null,
    );
  }

  Widget buildPaymentCardExample2() {
    return const PaymentCard(
      cardIssuerIcon: CardIcon(icon: Icons.credit_card),
      currency: Text('GBP'),
      cardNumber: '1234567890123456',
      validity: '08/23',
      holder: 'John Smith',
      cardNetwork: CardNetwork.mastercard,
      cardTypeTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      cardNumberStyles: CardNumberStyles.lightStyle2,
      backgroundImage: null,
      backgroundColor: Colors.grey,
    );
  }

  Widget buildPaymentCardExample3() {
    return const PaymentCard(
      cardIssuerIcon: CardIcon(icon: Icons.credit_card),
      backgroundColor: Colors.green,
      backgroundImage: null,
      currency: Text('USD'),
      cardNumber: '1234567890123456',
      validity: '06/22',
      holder: 'Alice Johnson',
      cardNetwork: CardNetwork.americanExpress,
      cardTypeTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      cardNumberStyles: CardNumberStyles.lightStyle3,
    );
  }

  Widget buildPaymentCardExample4() {
    return const PaymentCard(
      cardIssuerIcon: CardIcon(icon: Icons.credit_card),
      backgroundColor: Colors.orange,
      currency: Text('USD'),
      cardNumber: '1234567890123456',
      validity: '09/25',
      holder: 'Robert Brown',
      cardNetwork: CardNetwork.discover,
      cardTypeTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      cardNumberStyles: CardNumberStyles.darkStyle5,
      backgroundImage: null,
    );
  }
}
