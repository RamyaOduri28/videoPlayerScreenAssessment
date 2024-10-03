import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I should see the video name "YT"
Future<void> iShouldSeeTheVideoNameYt(WidgetTester tester) async {
  expect(find.byKey(Key('videoNameKey')), findsOneWidget);
  await tester.pumpAndSettle();
}
