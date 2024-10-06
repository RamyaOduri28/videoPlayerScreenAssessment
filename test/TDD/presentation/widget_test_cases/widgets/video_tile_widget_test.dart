import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/widgets/video_tile_widget.dart';

void main() {
  Widget buildTestableWidget(Widget child) {
    return MaterialApp(
      home: Scaffold(
        body: Material(
          child: child,
        ),
      ),
    );
  }

  testWidgets('VideoTileWidget displays correct video name', (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestableWidget(
        VideoTileWidget(
          videoName: 'Test Video',
          progressValue: 0.5,
          press: () {},
        ),
      ),
    );

    final videoNameFinder = find.text('Test Video');
    expect(videoNameFinder, findsOneWidget);
  });

  testWidgets('VideoTileWidget displays progress indicator with correct value', (WidgetTester tester) async {
    const testProgressValue = 0.75;
    await tester.pumpWidget(
      buildTestableWidget(
        VideoTileWidget(
          videoName: 'Test Video',
          progressValue: testProgressValue,
          press: () {},
        ),
      ),
    );

    final progressIndicator = tester.widget<LinearProgressIndicator>(
        find.byKey(const ValueKey('progressIndicatorKey'))
    );
    expect(progressIndicator.value, testProgressValue);
  });

  testWidgets('VideoTileWidget displays play icon when progress is less than 1', (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestableWidget(
        VideoTileWidget(
          videoName: 'Test Video',
          progressValue: 0.5,
          press: () {},
          index: 0,
        ),
      ),
    );

    expect(find.byKey(Key('playIconKey_0')), findsOneWidget);
    expect(find.byKey(const ValueKey('replayIconKey')), findsNothing);
  });

  testWidgets('VideoTileWidget displays replay icon when progress is 1 or greater', (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestableWidget(
        VideoTileWidget(
          videoName: 'Test Video',
          progressValue: 1.0,
          press: () {},
        ),
      ),
    );

    expect(find.byKey(const ValueKey('replayIconKey')), findsOneWidget);
    expect(find.byKey(const ValueKey('playIconKey')), findsNothing);
  });

  testWidgets('VideoTileWidget calls press callback when tapped', (WidgetTester tester) async {
    bool pressed = false;
    await tester.pumpWidget(
      buildTestableWidget(
        VideoTileWidget(
          videoName: 'Test Video',
          progressValue: 0.5,
          press: () {
            pressed = true;
          },
        ),
      ),
    );

    await tester.tap(find.byType(InkWell));
    await tester.pump(); // Trigger a frame
    expect(pressed, true);
  });

  testWidgets('VideoTileWidget has correct layout and styling', (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestableWidget(
        VideoTileWidget(
          videoName: 'Test Video',
          progressValue: 0.5,
          press: () {},
        ),
      ),
    );

    final containerFinder = find.byKey(const ValueKey('videoTile'));
    final container = tester.widget<Container>(containerFinder);

    expect(container.margin, const EdgeInsets.only(top: 16, bottom: 0, left: 16, right: 16));
    expect(container.padding, const EdgeInsets.all(16));

    final decoration = container.decoration as BoxDecoration;
    expect(decoration.color, Colors.white);
    expect(decoration.borderRadius, BorderRadius.circular(10));
    expect(decoration.boxShadow!.length, 1);
  });
}