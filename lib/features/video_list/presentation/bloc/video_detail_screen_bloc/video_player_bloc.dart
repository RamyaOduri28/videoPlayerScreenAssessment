import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'video_player_event.dart';
part 'video_player_state.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  VideoPlayerBloc() : super(VideoPlayerInitial()) {
    on<InitializeVideoEvent>(initializeVideoEvent);
    on<PlayVideoClickedEvent>(playVideoClickedEvent);
    on<PauseVideoClickedEvent>(pauseVideoClickedEvent);
    on<SeekForwardClickedEvent>(seekForwardClickedEvent);
    on<SeekBackwardClickedEvent>(seekBackwardClickedEvent);
    on<VideoCompleteEvent>(videoCompleteEvent);
    on<VideoPlayerErrorEvent>(videoPlayerErrorEvent);
    on<ToggleFullscreenClickedEvent>(toggleFullscreenClickedEvent);
  }

  FutureOr<void> initializeVideoEvent(InitializeVideoEvent event, Emitter<VideoPlayerState> emit) {
    emit(VideoPlayerLoading());
  }

  FutureOr<void> playVideoClickedEvent(PlayVideoClickedEvent event, Emitter<VideoPlayerState> emit) {
    emit(VideoPlayerPlaying());
  }

  FutureOr<void> pauseVideoClickedEvent(PauseVideoClickedEvent event, Emitter<VideoPlayerState> emit) {
    emit(VideoPlayerPaused());
  }

  FutureOr<void> seekForwardClickedEvent(SeekForwardClickedEvent event, Emitter<VideoPlayerState> emit) {
    emit(SeekForward());
  }

  FutureOr<void> seekBackwardClickedEvent(SeekBackwardClickedEvent event, Emitter<VideoPlayerState> emit) {
    emit(SeekBackward());
  }

  FutureOr<void> videoCompleteEvent(VideoCompleteEvent event, Emitter<VideoPlayerState> emit) {
    emit(VideoPlayerCompleted());
  }

  FutureOr<void> videoPlayerErrorEvent(VideoPlayerErrorEvent event, Emitter<VideoPlayerState> emit) {
    emit(VideoPlayerErrorState());
  }

  FutureOr<void> toggleFullscreenClickedEvent(ToggleFullscreenClickedEvent event, Emitter<VideoPlayerState> emit) {
    emit(ToggleFullScreenState());
  }
}
