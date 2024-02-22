import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payment_card/payment_card.dart';
import 'package:payment_card/src/constants/constants.dart';

void main() {
  group('PaymentCard', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PaymentCard(
            backgroundColor: Colors.blue,
            backgroundImage: Constants.worldMap,
            currency: Text('USD'),
            cardNumber: '1234567890123456',
            validity: '12/24',
            holder: 'John Doe',
            cardNetwork: CardNetwork.visa,
          ),
        ),
      );

      expect(find.text('USD'), findsOneWidget);
      expect(find.text('1234567890123456'), findsOneWidget);
      expect(find.text('12/24'), findsOneWidget);
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.byType(Image), findsNWidgets(3));
      expect(find.byType(Text), findsNWidgets(5));
    });

    testWidgets('throws error if cardNumber is not provided', (WidgetTester tester) async {
      expect(() {
        return const PaymentCard(
          backgroundColor: Colors.blue,
          backgroundImage: Constants.worldMap,
          currency: Text('USD'),
          validity: '12/24',
          holder: 'John Doe',
          cardNetwork: CardNetwork.visa,
          cardNumber: '',
        );
      }, throwsAssertionError);
    });

    testWidgets('throws error if validity is not provided', (WidgetTester tester) async {
      expect(() {
        return const PaymentCard(
          backgroundColor: Colors.blue,
          backgroundImage: Constants.worldMap,
          currency: Text('USD'),
          cardNumber: '1234567890123456',
          holder: 'John Doe',
          cardNetwork: CardNetwork.visa,
          validity: '',
        );
      }, throwsAssertionError);
    });

    testWidgets('throws error if holder is not provided', (WidgetTester tester) async {
      expect(() {
        return const PaymentCard(
          backgroundColor: Colors.blue,
          backgroundImage: Constants.worldMap,
          currency: Text('USD'),
          cardNumber: '1234567890123456',
          validity: '12/24',
          cardNetwork: CardNetwork.visa,
          holder: '',
        );
      }, throwsAssertionError);
    });

    testWidgets('throws error if cardType is not provided', (WidgetTester tester) async {
      expect(() {
        return const PaymentCard(
          backgroundColor: Colors.blue,
          backgroundImage: Constants.worldMap,
          currency: Text('USD'),
          cardNumber: '1234567890123456',
          validity: '12/24',
          holder: 'John Doe',
          cardNetwork: null,
        );
      }, throwsAssertionError);
    });
  });
}
