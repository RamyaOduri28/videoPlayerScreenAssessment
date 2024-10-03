import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/widgets/video_player_controls.dart';
import 'package:video_player/video_player.dart';

void main() {
  late VideoPlayerController mockController;

  setUp(() {
    mockController = MockVideoPlayerController();
  });

  tearDown(() {
    mockController.dispose();
  });

  testWidgets('VideoPlayerControls renders correctly when playing', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VideoPlayerControls(
            controller: mockController,
            isPlaying: true,
            isFullscreen: false,
            onFullscreenToggle: () {},
            onPlay: () {},
            onPause: () {},
            onSeekForward: () {},
            onSeekBackward: () {},
          ),
        ),
      ),
    );

    expect(find.byType(VideoPlayerControls), findsOneWidget);
    expect(find.byIcon(Icons.pause), findsOneWidget);
    expect(find.byIcon(Icons.play_arrow), findsNothing);
    expect(find.byIcon(Icons.fullscreen), findsOneWidget);
    expect(find.byIcon(Icons.fullscreen_exit), findsNothing);
    expect(find.byType(VideoProgressIndicator), findsOneWidget);
  });

  testWidgets('VideoPlayerControls renders correctly when paused', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VideoPlayerControls(
            controller: mockController,
            isPlaying: false,
            isFullscreen: false,
            onFullscreenToggle: () {},
            onPlay: () {},
            onPause: () {},
            onSeekForward: () {},
            onSeekBackward: () {},
          ),
        ),
      ),
    );

    expect(find.byType(VideoPlayerControls), findsOneWidget);
    expect(find.byIcon(Icons.play_arrow), findsOneWidget);
    expect(find.byIcon(Icons.pause), findsNothing);
  });

  testWidgets('VideoPlayerControls renders correctly in fullscreen mode', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VideoPlayerControls(
            controller: mockController,
            isPlaying: true,
            isFullscreen: true,
            onFullscreenToggle: () {},
            onPlay: () {},
            onPause: () {},
            onSeekForward: () {},
            onSeekBackward: () {},
          ),
        ),
      ),
    );

    expect(find.byType(VideoPlayerControls), findsOneWidget);
    expect(find.byIcon(Icons.fullscreen_exit), findsOneWidget);
    expect(find.byIcon(Icons.fullscreen), findsNothing);
  });

  testWidgets('Play button triggers onPlay callback', (WidgetTester tester) async {
    bool playPressed = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VideoPlayerControls(
            controller: mockController,
            isPlaying: false,
            isFullscreen: false,
            onFullscreenToggle: () {},
            onPlay: () => playPressed = true,
            onPause: () {},
            onSeekForward: () {},
            onSeekBackward: () {},
          ),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.play_arrow));
    expect(playPressed, isTrue);
  });

  testWidgets('Pause button triggers onPause callback', (WidgetTester tester) async {
    bool pausePressed = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VideoPlayerControls(
            controller: mockController,
            isPlaying: true,
            isFullscreen: false,
            onFullscreenToggle: () {},
            onPlay: () {},
            onPause: () => pausePressed = true,
            onSeekForward: () {},
            onSeekBackward: () {},
          ),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.pause));
    expect(pausePressed, isTrue);
  });

  testWidgets('Fullscreen button triggers onFullscreenToggle callback', (WidgetTester tester) async {
    bool fullscreenToggled = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VideoPlayerControls(
            controller: mockController,
            isPlaying: true,
            isFullscreen: false,
            onFullscreenToggle: () => fullscreenToggled = true,
            onPlay: () {},
            onPause: () {},
            onSeekForward: () {},
            onSeekBackward: () {},
          ),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.fullscreen));
    expect(fullscreenToggled, isTrue);
  });

  testWidgets('Seek forward button triggers onSeekForward callback', (WidgetTester tester) async {
    bool seekForwardPressed = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VideoPlayerControls(
            controller: mockController,
            isPlaying: true,
            isFullscreen: false,
            onFullscreenToggle: () {},
            onPlay: () {},
            onPause: () {},
            onSeekForward: () => seekForwardPressed = true,
            onSeekBackward: () {},
          ),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.forward_10));
    expect(seekForwardPressed, isTrue);
  });

  testWidgets('Seek backward button triggers onSeekBackward callback', (WidgetTester tester) async {
    bool seekBackwardPressed = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VideoPlayerControls(
            controller: mockController,
            isPlaying: true,
            isFullscreen: false,
            onFullscreenToggle: () {},
            onPlay: () {},
            onPause: () {},
            onSeekForward: () {},
            onSeekBackward: () => seekBackwardPressed = true,
          ),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.replay_10));
    expect(seekBackwardPressed, isTrue);
  });
}

class MockVideoPlayerController extends VideoPlayerController {
  MockVideoPlayerController() : super.networkUrl(Uri.parse('https://example.com/video.mp4'));

  @override
  Future<void> initialize() async {}

  @override
  Future<void> dispose() async {
    super.dispose();
  }
}