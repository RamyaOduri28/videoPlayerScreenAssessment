import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/bloc/video_detail_screen_bloc/video_player_bloc.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/pages/video_players/default_video_player.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/widgets/survey_overlay.dart';
import 'package:mockito/mockito.dart';
import 'package:video_player/video_player.dart';

class MockVideoPlayerController extends Mock implements VideoPlayerController {}
class MockVideoPlayerBloc extends Mock implements VideoPlayerBloc {}

void main() {
  late MockVideoPlayerController mockController;
  late MockVideoPlayerBloc mockBloc;

  setUp(() {
    mockController = MockVideoPlayerController();
    mockBloc = MockVideoPlayerBloc();

    when(mockController.initialize()).thenAnswer((_) => Future.value());
    when(mockController.value).thenReturn(const VideoPlayerValue(duration: Duration(seconds: 60)));
  });

  // testWidgets('DefaultVideoPlayer initializes correctly', (WidgetTester tester) async {
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: BlocProvider<VideoPlayerBloc>.value(
  //         value: mockBloc,
  //         child: const DefaultVideoPlayer(videoUrl: 'https://example.com/video.mp4', videoName: 'Test Video'),
  //       ),
  //     ),
  //   );
  //
  //   expect(find.byType(DefaultVideoPlayer), findsOneWidget);
  //   expect(find.text('Test Video'), findsOneWidget);
  // });
  //
  // testWidgets('DefaultVideoPlayer shows loading indicator when initializing', (WidgetTester tester) async {
  //   when(mockBloc.state).thenReturn(VideoPlayerErrorState());
  //
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: BlocProvider<VideoPlayerBloc>.value(
  //         value: mockBloc,
  //         child: DefaultVideoPlayer(videoUrl: 'https://example.com/video.mp4', videoName: 'Test Video'),
  //       ),
  //     ),
  //   );
  //
  //   expect(find.byType(CircularProgressIndicator), findsOneWidget);
  // });
  //
  // testWidgets('DefaultVideoPlayer toggles fullscreen', (WidgetTester tester) async {
  //   // when(mockBloc.state).thenReturn(VideoPlayerPlaying());
  //   when(mockBloc.stream).thenAnswer((_) => Stream.value(ToggleFullScreenState()));
  //
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: BlocProvider<VideoPlayerBloc>.value(
  //         value: mockBloc,
  //         child: DefaultVideoPlayer(videoUrl: 'https://example.com/video.mp4', videoName: 'Test Video'),
  //       ),
  //     ),
  //   );
  //
  //   await tester.pump();
  //
  //   expect(find.byType(AppBar), findsNothing);
  // });
  //
  // testWidgets('DefaultVideoPlayer shows video completion survey', (WidgetTester tester) async {
  //   when(mockBloc.state).thenReturn(VideoPlayerCompleted());
  //
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: BlocProvider<VideoPlayerBloc>.value(
  //         value: mockBloc,
  //         child: const DefaultVideoPlayer(videoUrl: 'https://example.com/video.mp4', videoName: 'Test Video'),
  //       ),
  //     ),
  //   );
  //   await tester.pump();
  //   expect(find.byType(VideoCompletionSurvey), findsOneWidget);
  // });
  //
  // testWidgets('DefaultVideoPlayer controls work correctly', (WidgetTester tester) async {
  //   when(mockBloc.state).thenReturn(VideoPlayerPlaying());
  //
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: BlocProvider<VideoPlayerBloc>.value(
  //         value: mockBloc,
  //         child: const DefaultVideoPlayer(videoUrl: 'https://example.com/video.mp4', videoName: 'Test Video'),
  //       ),
  //     ),
  //   );
  //
  //   // Test play button
  //   await tester.tap(find.byIcon(Icons.play_arrow));
  //   verify(mockBloc.add(PlayVideoClickedEvent())).called(1);
  //
  //   // Test pause button
  //   await tester.tap(find.byIcon(Icons.pause));
  //   verify(mockBloc.add(PauseVideoClickedEvent())).called(1);
  //
  //   // Test fullscreen toggle
  //   await tester.tap(find.byIcon(Icons.fullscreen));
  //   verify(mockBloc.add(ToggleFullscreenClickedEvent())).called(1);
  //
  //   // Test seek forward
  //   await tester.tap(find.byIcon(Icons.forward_10));
  //   verify(mockBloc.add(SeekForwardClickedEvent())).called(1);
  //
  //   // Test seek backward
  //   await tester.tap(find.byIcon(Icons.replay_10));
  //   verify(mockBloc.add(SeekBackwardClickedEvent())).called(1);
  // });
}