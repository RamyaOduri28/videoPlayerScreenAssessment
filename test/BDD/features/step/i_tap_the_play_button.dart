import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I tap the play button
Future<void> iTapThePlayButton(WidgetTester tester) async {
  await tester.pumpAndSettle();
  final playButton = find.byKey(const Key('playIconKey'));
  expect(playButton, findsOneWidget);
  await tester.tap(playButton);
  await tester.pump();
}
