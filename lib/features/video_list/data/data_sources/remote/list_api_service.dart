import '../../models/library_list.dart';

abstract class ListApiService {
  Future<List<LibraryVideoModel>> getVideoList();
}

