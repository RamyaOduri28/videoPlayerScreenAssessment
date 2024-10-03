import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_video_player_screen/config/theme/app_themes.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/bloc/video_detail_screen_bloc/video_player_bloc.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/bloc/video_list_bloc/videolist_bloc.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/pages/video_list_screen/video_list_screen.dart';
import 'features/ingection_container.dart';

void main() async {
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<VideolistBloc>()),
          BlocProvider(create: (_) => sl<VideoPlayerBloc>()),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const VideoListingScreen(),
      ),
    );
  }
}
