import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_train/views/screens/message_screen.dart';

void main() {
  testWidgets('MessageScreen has a title and message',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MessageScreen(title: 'T', message: 'M'),
      ),
    );

    final titleFinder = find.text('T');
    final messageFinder = find.text('M');
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}
