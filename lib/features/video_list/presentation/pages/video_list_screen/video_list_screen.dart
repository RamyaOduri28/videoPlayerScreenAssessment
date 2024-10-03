import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/widgets/video_tile_widget.dart';

import '../../bloc/video_list_bloc/videolist_bloc.dart';
import '../video_player_screen/video_player.dart';

class VideoListingScreen extends StatefulWidget {
  const VideoListingScreen({super.key});

  @override
  State<VideoListingScreen> createState() => _VideoListingScreenState();
}

class _VideoListingScreenState extends State<VideoListingScreen> {
  @override
  void initState() {
    context.read<VideolistBloc>().add(VideoInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Listing Screen"),
        backgroundColor: Colors.blue,
      ),
      body: const _buildBody(),
    );
  }
}

class _buildBody extends StatelessWidget {
  const _buildBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideolistBloc, VideolistState>(
      builder: (_, state) {
        if (state is RemoteVideosLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is VideosError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is VideosSuccessState) {
          return ListView.builder(
            itemCount: state.videos?.length,
            itemBuilder: (context, index) {
              final video = state.videos?[index];
              print("videoData$video");
              final imageUrl = (video?.assets.ekidsChapterIcon != null &&
                  video!.assets.ekidsChapterIcon!.isNotEmpty)
                  ? video.assets.ekidsChapterIcon![0]  // Using first icon or any fixed valid index
                  : '';
              final spentTime = video?.spentTime ?? 0;
              final duration = video?.duration ?? 0;
              final progressValue =  spentTime / duration ;
              return VideoTileWidget(
                videoName: video?.name ?? '',
                progressValue: progressValue,
                imageUrl: imageUrl,
                press: () {
                  print("videonameeee${video?.name}");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VideoPlayerScreen(
                                videoUrl: video?.url ?? '',
                                videoName: video?.name ?? '',
                                videoType: video?.videoSource ?? '',
                              )));
                },
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
