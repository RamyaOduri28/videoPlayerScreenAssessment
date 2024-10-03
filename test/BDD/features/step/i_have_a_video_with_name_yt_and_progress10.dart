import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/widgets/video_tile_widget.dart';

/// Usage: I have a video with name "YT" and progress 1.0
Future<void> iHaveAVideoWithNameYtAndProgress10(WidgetTester tester) async {
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

  expect(find.byType(LinearProgressIndicator), findsOneWidget);

  final progressFinder = find.byType(LinearProgressIndicator);
  final progressWidget = tester.widget<LinearProgressIndicator>(progressFinder);
  expect(progressWidget.value, 1.0);
}
