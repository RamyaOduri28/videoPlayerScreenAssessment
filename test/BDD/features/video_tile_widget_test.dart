// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/i_have_a_video_with_name_s3_and_progress05.dart';
import './step/i_look_at_the_video_tile.dart';
import './step/i_should_see_the_video_name_s3.dart';
import './step/i_should_see_a_progress_bar_with50_completion.dart';
import './step/i_should_see_a_button.dart';
import './step/i_have_a_video_with_name_yt_and_progress10.dart';
import './step/i_should_see_the_video_name_yt.dart';
import './step/i_should_see_a_progress_bar_with100_completion.dart';
import './step/i_have_a_video_with_name_flutter_widgets_and_progress03.dart';
import './step/i_tap_the_play_button.dart';
import './step/the_video_should_start_playing.dart';

void main() {
  group('''Video Tile Widget''', () {
    testWidgets('''Displaying video information''', (tester) async {
      await iHaveAVideoWithNameS3AndProgress05(tester);
      await iLookAtTheVideoTile(tester);
      await iShouldSeeTheVideoNameS3(tester);
      await iShouldSeeAProgressBarWith50Completion(tester);
      await iShouldSeeAButton(tester, Icons.play_circle_fill);
    });
    testWidgets('''Completed video display''', (tester) async {
      await iHaveAVideoWithNameYtAndProgress10(tester);
      await iLookAtTheVideoTile(tester);
      await iShouldSeeTheVideoNameYt(tester);
      await iShouldSeeAProgressBarWith100Completion(tester);
      await iShouldSeeAButton(tester, Icons.replay);
    });
    testWidgets('''Tapping the play button''', (tester) async {
      await iHaveAVideoWithNameFlutterWidgetsAndProgress03(tester);
      await iTapThePlayButton(tester);
      await theVideoShouldStartPlaying(tester);
    });
  });
}
