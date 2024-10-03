import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/widgets/video_tile_widget.dart';

/// Usage: I look at the video tile
Future<void> iLookAtTheVideoTile(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: VideoTileWidget(
          videoName: 'S3',
          progressValue: 0.5,
          press: () {  },
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
  expect(find.byType(VideoTileWidget), findsOneWidget);
}
