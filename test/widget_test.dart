import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:copilot_todo_demo/main.dart';

void main() {
  testWidgets('App should display TODO App title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the app title is displayed
    expect(find.text('TODO App'), findsOneWidget);
  });
}
