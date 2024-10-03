import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_video_player_screen/core/resources/data_state.dart';
import 'package:flutter_video_player_screen/features/video_list/domain/entities/video_list.dart';
import 'package:flutter_video_player_screen/features/video_list/domain/repository/video_list_repository.dart';
import 'package:flutter_video_player_screen/features/video_list/domain/usecases/get_video.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'get_video_list_usecase_test.mocks.dart';

@GenerateMocks([VideoListRepository])


void main() {
  late GetVideoUseCase getVideoUseCase;
  late MockVideoListRepository mockVideoListRepository;

  setUp(() {
    mockVideoListRepository = MockVideoListRepository();
    getVideoUseCase = GetVideoUseCase(mockVideoListRepository);
  });

  final tVideoList = [
    const LibraryVideoEntity(chapterId: '', chapterName: '', duration: 1, isDrm: true, isLiked: true, jwMediaId: '', name: '', source: '', spentTime: 1, subjectId: '', url: '', videoCount: 1, videoSource: '', assets: AssetsModel()),
    const LibraryVideoEntity(chapterId: '', chapterName: '', duration: 1, isDrm: true, isLiked: true, jwMediaId: '', name: '', source: '', spentTime: 1, subjectId: '', url: '', videoCount: 1, videoSource: '', assets: AssetsModel()),
  ];

  test('should get video list from the repository', () async {
    // arrange
    when(mockVideoListRepository.getVideoList())
        .thenAnswer((_) async => DataSuccess(tVideoList));

    // act
    final result = await getVideoUseCase();

    // assert
    expect(result, isA<DataSuccess<List<LibraryVideoEntity>>>());
    expect((result as DataSuccess).data, tVideoList);
    verify(mockVideoListRepository.getVideoList());
    verifyNoMoreInteractions(mockVideoListRepository);
  });

  test('should return DataFailed when there is an error', () async {
    // arrange
    final tError = DioException(
      requestOptions: RequestOptions(path: ''),
      error: 'An error occurred',
      type: DioExceptionType.badResponse,
    );
    when(mockVideoListRepository.getVideoList())
        .thenAnswer((_) async => DataFailed(tError));

    // act
    final result = await getVideoUseCase();

    // assert
    expect(result, isA<DataFailed<List<LibraryVideoEntity>>>());
    expect((result as DataFailed).error, tError);
    verify(mockVideoListRepository.getVideoList());
    verifyNoMoreInteractions(mockVideoListRepository);
  });
}