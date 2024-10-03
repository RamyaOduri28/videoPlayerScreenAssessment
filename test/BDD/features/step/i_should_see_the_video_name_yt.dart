import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/widgets/video_tile_widget.dart';

/// Usage: I should see the video name "YT"
Future<void> iShouldSeeTheVideoNameYt(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: VideoTileWidget(
          videoName: 'YT',
          progressValue: 1.0,
          press: () {  },
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
  expect(find.text('YT'), findsOneWidget);
}
