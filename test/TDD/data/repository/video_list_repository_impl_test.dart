import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_video_player_screen/core/resources/data_state.dart';
import 'package:flutter_video_player_screen/features/video_list/data/data_sources/remote/list_api_service.dart';
import 'package:flutter_video_player_screen/features/video_list/data/models/library_list.dart';
import 'package:flutter_video_player_screen/features/video_list/data/repository/video_list_repository_impl.dart';
import 'package:flutter_video_player_screen/features/video_list/domain/entities/video_list.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dio/dio.dart';

import 'video_list_repository_impl_test.mocks.dart';

// This will generate a MockListApiService class
@GenerateMocks([ListApiService])


void main() {
  late VideoListRepositoryImpl repository;
  late MockListApiService mockApiService;

  setUp(() {
    mockApiService = MockListApiService();
    repository = VideoListRepositoryImpl(mockApiService);
  });

  group('VideoListRepositoryImpl', () {
    final tVideoList = [
      const LibraryVideoModel(chapterId: '', chapterName: '', duration: 1, isDrm: true, isLiked: true, jwMediaId: '', name: '', source: '', spentTime: 1, subjectId: '', url: '', videoCount: 1, videoSource: '', assets: AssetsModel()),
      const LibraryVideoModel(chapterId: '', chapterName: '', duration: 1, isDrm: true, isLiked: true, jwMediaId: '', name: '', source: '', spentTime: 1, subjectId: '', url: '', videoCount: 1, videoSource: '', assets: AssetsModel()),

    ];

    test('should return DataSuccess with List<LibraryVideoEntity> when the call to apiService is successful', () async {
      // Arrange
      when(mockApiService.getVideoList()).thenAnswer((_) async => tVideoList);

      // Act
      final result = await repository.getVideoList();

      // Assert
      expect(result, isA<DataSuccess<List<LibraryVideoEntity>>>());
      expect((result as DataSuccess).data, equals(tVideoList));
      verify(mockApiService.getVideoList());
      verifyNoMoreInteractions(mockApiService);
    });

    test('should return DataFailed with DioException when the call to apiService is unsuccessful', () async {
      // Arrange
      final tException = DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Test error',
        type: DioExceptionType.connectionTimeout,
      );
      when(mockApiService.getVideoList()).thenThrow(tException);

      // Act
      final result = await repository.getVideoList();

      // Assert
      expect(result, isA<DataFailed<List<LibraryVideoEntity>>>());
      expect((result as DataFailed).error, equals(tException));
      verify(mockApiService.getVideoList());
      verifyNoMoreInteractions(mockApiService);
    });
  });
}