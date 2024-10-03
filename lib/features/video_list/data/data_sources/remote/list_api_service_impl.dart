import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../../core/constants/constants.dart';
import '../../models/library_list.dart';
import 'list_api_service.dart';

class ListApiServiceImpl implements ListApiService {
  final Dio dio;

  ListApiServiceImpl(this.dio);

  @override
  Future<List<LibraryVideoModel>> getVideoList() async {
    dio.options.baseUrl = ApiConstants.baseURL;
    dio.options.headers['Authorization'] = ApiConstants.authToken;
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['source'] = ApiConstants.source;
    dio.options.headers['platform'] = ApiConstants.platform;
    dio.options.headers['versionCode'] = ApiConstants.versionCode;

    try {
      final response = await dio.get('/learn/v1/library/get-video-list', queryParameters: {
        'subject_id': 'UjdjrBEd1Q',
        'chapter_id': 'A1BWsDx9QZ',
        'page_number': 1,
      });
      print("response$response");
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        return data.map((e) => LibraryVideoModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load video list');
      }
    } on DioException catch (e) {
      throw Exception('Dio error: ${e.message}');
    }
  }
}
