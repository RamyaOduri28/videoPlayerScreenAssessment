import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_video_player_screen/features/video_list/domain/usecases/get_video.dart';
import 'package:meta/meta.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/entities/video_list.dart';

part 'videolist_event.dart';
part 'videolist_state.dart';

class VideolistBloc extends Bloc<VideolistEvent, VideolistState> {
  final GetVideoUseCase _getVideoUseCase;
  VideolistBloc(this._getVideoUseCase) : super(VideolistInitial()) {
    on<VideoInitialEvent>(videoInitialEvent);
  }

  FutureOr<void> videoInitialEvent(VideoInitialEvent event, Emitter<VideolistState> emit) async {
    emit(RemoteVideosLoading());
    final dataState =
        await _getVideoUseCase.call();
    if (dataState is DataSuccess) {
      emit(VideosSuccessState(videos: dataState.data!));
    } else if (dataState is DataFailed) {
      emit(VideosError(error: dataState.error!));
    }
  }

}
