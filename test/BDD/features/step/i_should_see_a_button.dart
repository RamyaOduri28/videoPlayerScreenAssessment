import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I should see a {Icons.play_circle_fill} button
Future<void> iShouldSeeAButton(WidgetTester tester, dynamic param1) async {
  expect(find.byIcon(Icons.play_circle_fill), findsOneWidget);
}
