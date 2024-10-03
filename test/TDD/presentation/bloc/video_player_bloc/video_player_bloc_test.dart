import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/bloc/video_detail_screen_bloc/video_player_bloc.dart';

void main() {
  late VideoPlayerBloc videoPlayerBloc;

  setUp(() {
    videoPlayerBloc = VideoPlayerBloc();
  });

  tearDown(() {
    videoPlayerBloc.close();
  });

  group('VideoPlayerBloc Tests', () {
    test('initial state is VideoPlayerInitial', () {
      expect(videoPlayerBloc.state, isA<VideoPlayerInitial>());
    });

    blocTest<VideoPlayerBloc, VideoPlayerState>(
      'emits [VideoPlayerLoading] when InitializeVideoEvent is added',
      build: () => VideoPlayerBloc(),
      act: (bloc) => bloc.add(InitializeVideoEvent()),
      expect: () => [isA<VideoPlayerLoading>()],
    );

    blocTest<VideoPlayerBloc, VideoPlayerState>(
      'emits [VideoPlayerPlaying] when PlayVideoClickedEvent is added',
      build: () => VideoPlayerBloc(),
      act: (bloc) => bloc.add(PlayVideoClickedEvent()),
      expect: () => [isA<VideoPlayerPlaying>()],
    );

    blocTest<VideoPlayerBloc, VideoPlayerState>(
      'emits [VideoPlayerPaused] when PauseVideoClickedEvent is added',
      build: () => VideoPlayerBloc(),
      act: (bloc) => bloc.add(PauseVideoClickedEvent()),
      expect: () => [isA<VideoPlayerPaused>()],
    );

    blocTest<VideoPlayerBloc, VideoPlayerState>(
      'emits [SeekForward] when SeekForwardClickedEvent is added',
      build: () => VideoPlayerBloc(),
      act: (bloc) => bloc.add(SeekForwardClickedEvent()),
      expect: () => [isA<SeekForward>()],
    );

    blocTest<VideoPlayerBloc, VideoPlayerState>(
      'emits [SeekBackward] when SeekBackwardClickedEvent is added',
      build: () => VideoPlayerBloc(),
      act: (bloc) => bloc.add(SeekBackwardClickedEvent()),
      expect: () => [isA<SeekBackward>()],
    );

    blocTest<VideoPlayerBloc, VideoPlayerState>(
      'emits [VideoPlayerCompleted] when VideoCompleteEvent is added',
      build: () => VideoPlayerBloc(),
      act: (bloc) => bloc.add(VideoCompleteEvent()),
      expect: () => [isA<VideoPlayerCompleted>()],
    );

    blocTest<VideoPlayerBloc, VideoPlayerState>(
      'emits [VideoPlayerErrorState] when VideoPlayerErrorEvent is added',
      build: () => VideoPlayerBloc(),
      act: (bloc) => bloc.add(VideoPlayerErrorEvent()),
      expect: () => [isA<VideoPlayerErrorState>()],
    );

    blocTest<VideoPlayerBloc, VideoPlayerState>(
      'emits [ToggleFullScreenState] when ToggleFullscreenClickedEvent is added',
      build: () => VideoPlayerBloc(),
      act: (bloc) => bloc.add(ToggleFullscreenClickedEvent()),
      expect: () => [isA<ToggleFullScreenState>()],
    );
  });
}