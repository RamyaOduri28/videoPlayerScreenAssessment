import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I should see the video name "S3"
Future<void> iShouldSeeTheVideoNameS3(WidgetTester tester) async {
  expect(find.text('S3'), findsOneWidget);
}
