import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_video_player_screen/core/resources/data_state.dart';
import 'package:flutter_video_player_screen/features/video_list/domain/entities/video_list.dart';
import 'package:flutter_video_player_screen/features/video_list/domain/usecases/get_video.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/bloc/video_list_bloc/videolist_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'video_list_bloc_test.mocks.dart';

@GenerateMocks([GetVideoUseCase])
void main() {
  late VideolistBloc videolistBloc;
  late MockGetVideoUseCase mockGetVideoUseCase;

  setUp(() {
    mockGetVideoUseCase = MockGetVideoUseCase();
    videolistBloc = VideolistBloc(mockGetVideoUseCase);
  });

  group('VideolistBloc', () {
    blocTest<VideolistBloc, VideolistState>(
      'emits [RemoteVideosLoading, VideosSuccessState] when VideoInitialEvent is added',
      build: () {
        // Setup the mock to return a successful response
        when(mockGetVideoUseCase.call()).thenAnswer(
          (_) async => const DataSuccess<List<LibraryVideoEntity>>([]),
        );
        return videolistBloc;
      },
      act: (bloc) => bloc.add(VideoInitialEvent()),
      expect: () => [
        isA<RemoteVideosLoading>(),
        isA<VideosSuccessState>(),
      ],
    );

    blocTest<VideolistBloc, VideolistState>(
      'emits [RemoteVideosLoading, VideosError] when VideoInitialEvent fails',
      build: () {
        when(mockGetVideoUseCase.call()).thenAnswer(
          (_) async => DataFailed(
            DioException(
              requestOptions: RequestOptions(path: ''),
              error: 'Failed to fetch videos',
            ),
          ),
        );
        return videolistBloc;
      },
      act: (bloc) => bloc.add(VideoInitialEvent()),
      expect: () => [
        isA<RemoteVideosLoading>(),
        isA<VideosError>(),
      ],
    );
  });
}
