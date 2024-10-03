import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: the video should start playing
Future<void> theVideoShouldStartPlaying(WidgetTester tester) async {
  await tester.pumpAndSettle();
  final playButtonFinder = find.byKey(const ValueKey('playIconKey'));
  expect(playButtonFinder, findsNothing);

  final progressFinder = find.byKey(const ValueKey('progressIndicatorKey'));
  final progressWidget = tester.widget(progressFinder) as LinearProgressIndicator;

  expect(progressWidget.value, greaterThan(0.0));
}
