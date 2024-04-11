import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_train/views/screens/items_screen.dart';

void main() {
  testWidgets('find an item in a deep list', (widgetTester) async {
    await widgetTester.pumpWidget(
      ItemsScreen(
        items: List<String>.generate(10000, (i) => 'Item $i'),
      ),
    );

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const ValueKey('item_50_text'));

    await widgetTester.scrollUntilVisible(
      itemFinder,
      500.0,
      scrollable: listFinder,
    );

    expect(itemFinder, findsOneWidget);
  });
}
