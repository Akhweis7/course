import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanban/app.dart';

void main() {
  testWidgets('Login screen renders core widgets', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const KanbanApp());

    expect(find.text('Welcome Back!'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
  });
}
