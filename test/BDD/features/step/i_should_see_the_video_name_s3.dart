import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/widgets/video_tile_widget.dart';

/// Usage: I should see the video name "S3"
Future<void> iShouldSeeTheVideoNameS3(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: VideoTileWidget(
          videoName: 'S3',
          progressValue: 1.0,
          press: () {  },
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
  expect(find.text('S3'), findsOneWidget);
}
