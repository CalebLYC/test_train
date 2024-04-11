import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_train/views/screens/todo_list_screen.dart';

void main() {
  testWidgets('add and remove a todo', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: TodoListScreen(),
      ),
    );

    await tester.enterText(find.byType(TextField), 'hu');
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(find.text('hu'), findsOneWidget);

    await tester.drag(
      find.byType(Dismissible),
      const Offset(500, 0),
    );
    await tester.pumpAndSettle();
    expect(find.text('hu'), findsNothing);
  });
}
