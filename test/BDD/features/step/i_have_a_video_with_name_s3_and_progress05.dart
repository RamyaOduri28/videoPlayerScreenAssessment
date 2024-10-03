import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/widgets/video_tile_widget.dart';

/// Usage: I have a video with name "S3" and progress 0.5
Future<void> iHaveAVideoWithNameS3AndProgress05(WidgetTester tester) async {
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
  expect(find.text('S3'), findsOneWidget);

  expect(find.byType(LinearProgressIndicator), findsOneWidget);

  final progressFinder = find.byType(LinearProgressIndicator);
  final progressWidget = tester.widget<LinearProgressIndicator>(progressFinder);
  expect(progressWidget.value, 0.5);
}
