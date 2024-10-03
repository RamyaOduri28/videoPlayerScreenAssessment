import 'package:flutter_video_player_screen/core/resources/data_state.dart';
import 'package:flutter_video_player_screen/features/video_list/domain/repository/video_list_repository.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/video_list.dart';

class GetVideoUseCase {
  final VideoListRepository _videoListRepository;
  GetVideoUseCase(this._videoListRepository);
  Future<DataState<List<LibraryVideoEntity>>> call() {
    return _videoListRepository.getVideoList(
    );
  }
}