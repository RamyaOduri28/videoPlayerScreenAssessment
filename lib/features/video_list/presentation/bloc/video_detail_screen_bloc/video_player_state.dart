part of 'video_player_bloc.dart';

@immutable
sealed class VideoPlayerState {}

final class VideoPlayerInitial extends VideoPlayerState {}

class VideoPlayerLoading extends VideoPlayerState {}

class VideoPlayerReady extends VideoPlayerState {}

class VideoPlayerPlaying extends VideoPlayerState {}

class VideoPlayerPaused extends VideoPlayerState {
}

class SeekForward extends VideoPlayerState {
}

class SeekBackward extends VideoPlayerState {
}

class VideoPlayerCompleted extends VideoPlayerState {
}

class VideoPlayerErrorState extends VideoPlayerState {
}

class ToggleFullScreenState extends VideoPlayerState {

}


