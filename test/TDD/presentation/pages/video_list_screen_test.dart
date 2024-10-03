import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_video_player_screen/features/video_list/domain/entities/video_list.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/bloc/video_list_bloc/videolist_bloc.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/pages/video_list_screen/video_list_screen.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/pages/video_player_screen/video_player.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/widgets/video_tile_widget.dart';
import 'package:mocktail/mocktail.dart';

class MockVideoListBloc extends MockBloc<VideolistEvent, VideolistState> implements VideolistBloc {}

void main() {
  late MockVideoListBloc videolistBloc;

  setUp(() {
    videolistBloc = MockVideoListBloc();
  });

  Widget createWidgetUnderTest() {
    return BlocProvider<VideolistBloc>.value(
      value: videolistBloc,
      child: const MaterialApp(
        home: Scaffold(body: VideoListingScreen()),
      ),
    );
  }

  testWidgets('VideoListingScreen shows loading indicator when state is RemoteVideosLoading', (WidgetTester tester) async {
    when(() => videolistBloc.state).thenReturn(RemoteVideosLoading());
    await tester.pumpWidget(
        createWidgetUnderTest()
    );
    await tester.pump(); // This allows the widget tree to rebuild.

    // Ensure the loading indicator is present.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('VideoListingScreen shows error icon when state is VideosError', (WidgetTester tester) async {
    final dioException = DioException(
      requestOptions: RequestOptions(path: ''),
      error: 'An error occurred',
    );
    // Simulate the bloc emitting the VideosError state
    when(() => videolistBloc.state).thenReturn(VideosError(error: dioException));

    await tester.pumpWidget(
        createWidgetUnderTest()
    );
    await tester.pump();
    expect(find.byIcon(Icons.refresh), findsOneWidget);
  });
  //
  testWidgets('VideoListingScreen shows list of videos when state is VideosSuccessState', (WidgetTester tester) async {
    final mockVideos = [
      const LibraryVideoEntity(chapterId: '', chapterName: 'Video 1', duration: 1, isDrm: true, isLiked: true, jwMediaId: '', name: '', source: '', spentTime: 1, subjectId: '', url: '', videoCount: 1, videoSource: '', assets: AssetsModel()),
      const LibraryVideoEntity(chapterId: '', chapterName: 'Video 2', duration: 1, isDrm: true, isLiked: true, jwMediaId: '', name: '', source: '', spentTime: 1, subjectId: '', url: '', videoCount: 1, videoSource: '', assets: AssetsModel()),
    ];
    // Simulate the bloc emitting the VideosSuccessState
    when(() => videolistBloc.state).thenReturn(VideosSuccessState(videos: mockVideos));

    await tester.pumpWidget(
        createWidgetUnderTest()
    );
    await tester.pump();
    // Check for the ListView and VideoTileWidgets
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(VideoTileWidget), findsNWidgets(2));
  });
  //
  // testWidgets('VideoListingScreen navigates to VideoPlayerScreen when video tile is tapped', (WidgetTester tester) async {
  //   final mockVideos = [
  //     const LibraryVideoEntity(chapterId: '', chapterName: '', duration: 1, isDrm: true, isLiked: true, jwMediaId: '', name: '', source: '', spentTime: 1, subjectId: '', url: '', videoCount: 1, videoSource: '', assets: AssetsModel()),
  //   ];
  //   // Simulate the bloc emitting the VideosSuccessState
  //   when(() => videolistBloc.state).thenReturn(VideosSuccessState(videos: mockVideos));
  //
  //   await tester.pumpWidget(
  //       createWidgetUnderTest()
  //   );
  //   await tester.pump();
  //
  //   await tester.tap(find.byType(VideoTileWidget));
  //   await tester.pumpAndSettle();
  //
  //   expect(find.byType(VideoPlayerScreen), findsOneWidget);
  // });
}
