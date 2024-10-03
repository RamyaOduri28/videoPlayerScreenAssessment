import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/widgets/survey_overlay.dart';

void main() {

  Widget createWidgetUnderTest(bool surveyCompleted) {
    return  MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            VideoCompletionSurvey(
              onSurveyComplete: () {
                surveyCompleted = true; // Handle completion
              },
            ),
          ],
        ),
      ),
    );
  }
  testWidgets('Displays survey question and buttons', (WidgetTester tester) async {
    // Arrange
    bool surveyCompleted = false;

    // Act
    await tester.pumpWidget(
        createWidgetUnderTest(surveyCompleted),
    );

    // Assert
    expect(find.text('How was the video?'), findsOneWidget);
    expect(find.text('Great'), findsOneWidget);
    expect(find.text('Good'), findsOneWidget);
    expect(find.text('Okay'), findsOneWidget);
  });

  testWidgets('Calls onSurveyComplete when any button is pressed', (WidgetTester tester) async {
    // Arrange
    bool surveyCompleted = false;

    await tester.pumpWidget(
      createWidgetUnderTest(surveyCompleted = true),
    );

    // Act
    await tester.tap(find.text('Great'));
    await tester.pump();

    // Assert
    expect(surveyCompleted, true);
  });

  testWidgets('Survey buttons are tappable', (WidgetTester tester) async {
    // Arrange
    bool surveyCompleted = false;

    await tester.pumpWidget(
      createWidgetUnderTest(surveyCompleted),
    );

    // Act
    await tester.tap(find.text('Great'));
    await tester.tap(find.text('Good'));
    await tester.tap(find.text('Okay'));
    await tester.pump();

    // Assert
    expect(find.text('Great'), findsOneWidget);
    expect(find.text('Good'), findsOneWidget);
    expect(find.text('Okay'), findsOneWidget);
  });
}
