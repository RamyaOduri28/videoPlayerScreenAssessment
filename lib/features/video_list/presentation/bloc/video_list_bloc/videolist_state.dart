part of 'videolist_bloc.dart';

@immutable
sealed class VideolistState {}

abstract class VideoCardActionState extends VideolistState{}

final class VideolistInitial extends VideolistState {}

class RemoteVideosLoading extends VideolistState {}

class VideosSuccessState extends VideolistState {
  final List<LibraryVideoEntity>? videos;

 VideosSuccessState({this.videos});

  @override
  List<Object?> get props => [videos];
}

class VideosError extends VideolistState {
  VideosError({required DioException error});
}

