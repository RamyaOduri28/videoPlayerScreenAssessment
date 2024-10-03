import '../../../../core/resources/data_state.dart';
import '../entities/video_list.dart';

abstract class VideoListRepository{
  Future<DataState<List<LibraryVideoEntity>>> getVideoList(
  );
}