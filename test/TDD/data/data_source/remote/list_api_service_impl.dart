import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dio/dio.dart';
import 'package:flutter_video_player_screen/features/video_list/data/data_sources/remote/list_api_service_impl.dart';
import 'list_api_service_impl.mocks.dart';

@GenerateMocks([Dio])


void main() {
  late ListApiServiceImpl listApiService;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    listApiService = ListApiServiceImpl(mockDio);

    // Mock the options property
    final mockOptions = BaseOptions();
    when(mockDio.options).thenReturn(mockOptions);
  });

  test('getVideoList returns list of LibraryVideoModel on success', () async {
    // Arrange
    final mockResponse = {
      'data': [
        {
          'chapter_id': '1',
          'chapter_name': 'Test Video',
        },
        {
          'chapter_id': '2',
          'chapter_name': 'Another Test Video',
        },
      ]
    };

    when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
        .thenAnswer((_) async => Response(
      data: mockResponse,
      statusCode: 200,
      requestOptions: RequestOptions(path: ''),
    ));

    // Act
    final result = await listApiService.getVideoList();

    // Assert
    expect(result.length, 2);
    expect(result[0].chapterId, '1'); // Adjust this line as necessary
  });


  test('getVideoList throws exception on error', () async {
    // Arrange
    when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
        .thenThrow(DioException(
      requestOptions: RequestOptions(path: ''),
      error: 'Test error',
      type: DioExceptionType.badResponse,
    ));

    // Act & Assert
    expect(() => listApiService.getVideoList(), throwsA(isA<Exception>()));
  });
}