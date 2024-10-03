import 'package:dio/dio.dart';
import 'package:flutter_video_player_screen/features/video_list/domain/repository/video_list_repository.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entities/video_list.dart';
import '../data_sources/remote/list_api_service.dart';

class VideoListRepositoryImpl implements VideoListRepository {
  final ListApiService apiService;
  VideoListRepositoryImpl(this.apiService);

  @override
  Future<DataState<List<LibraryVideoEntity>>> getVideoList()  async {
    try {
      final videoList = await apiService.getVideoList();
      print("videoList$videoList");
      return DataSuccess(videoList);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
