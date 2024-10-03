// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/i_look_at_the_video_tile.dart';
import './step/i_should_see_the_video_name_s3.dart';
import './step/i_should_see_a_progress_bar_with50_completion.dart';
import './step/i_should_see_a_play_button.dart';

void main() {
  group('''Load VideoList Cards''', () {
    testWidgets(''' Load VideoList Cards''', (tester) async {
      await theAppIsRunning(tester);
      await iLookAtTheVideoTile(tester);
      await iShouldSeeTheVideoNameS3(tester);
      await iShouldSeeAProgressBarWith50Completion(tester);
      await iShouldSeeAPlayButton(tester, Icons.play_circle_fill);
    });
  });
}
