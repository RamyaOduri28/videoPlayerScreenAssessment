import 'package:dio/dio.dart';
import 'package:flutter_video_player_screen/features/video_list/data/data_sources/remote/list_api_service.dart';
import 'package:flutter_video_player_screen/features/video_list/data/data_sources/remote/list_api_service_impl.dart';
import 'package:flutter_video_player_screen/features/video_list/data/repository/video_list_repository_impl.dart';
import 'package:flutter_video_player_screen/features/video_list/domain/repository/video_list_repository.dart';
import 'package:flutter_video_player_screen/features/video_list/domain/usecases/get_video.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/bloc/video_detail_screen_bloc/video_player_bloc.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/bloc/video_list_bloc/videolist_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initializeDependencies() {
  sl.registerLazySingleton<Dio>(() => Dio());

  // Data sources
  sl.registerLazySingleton<ListApiService>(() => ListApiServiceImpl(sl()));

  // Repository
  sl.registerLazySingleton<VideoListRepository>(() => VideoListRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetVideoUseCase(sl()));

  // Blocs
  sl.registerFactory(() => VideolistBloc(sl()));
  sl.registerFactory(() => VideoPlayerBloc());

}