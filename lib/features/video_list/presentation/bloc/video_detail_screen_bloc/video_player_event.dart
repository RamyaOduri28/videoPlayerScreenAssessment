part of 'video_player_bloc.dart';

@immutable
sealed class VideoPlayerEvent {}

class InitializeVideoEvent extends VideoPlayerEvent {}

class PlayVideoClickedEvent extends VideoPlayerEvent {}

class PauseVideoClickedEvent extends VideoPlayerEvent {}

class SeekForwardClickedEvent extends VideoPlayerEvent {}

class SeekBackwardClickedEvent extends VideoPlayerEvent {}

class VideoCompleteEvent extends VideoPlayerEvent {}

class VideoPlayerErrorEvent extends VideoPlayerEvent{}

class ToggleFullscreenClickedEvent extends VideoPlayerEvent {}
class ResetVideoStateEvent extends VideoPlayerEvent {}

