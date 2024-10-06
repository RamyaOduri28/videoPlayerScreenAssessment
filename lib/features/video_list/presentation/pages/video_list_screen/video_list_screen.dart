import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_video_player_screen/features/video_list/presentation/widgets/video_tile_widget.dart';

import '../../bloc/video_detail_screen_bloc/video_player_bloc.dart';
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
          title: const Text("Video Listing Screen", key: Key('VideoListingScreen'),),
          backgroundColor: Colors.blue,
        ),
        body: BlocBuilder<VideolistBloc, VideolistState>(
          builder: (_, state) {
            if (state is RemoteVideosLoading) {
              return const Center(child: CircularProgressIndicator(),  key: Key("ListPageLoadingIndicator"),);
            }
            if (state is VideosError) {
              return const Center(child: Icon(Icons.refresh));
            }
            if (state is VideosSuccessState) {
              return ListView.builder(
                itemCount: state.videos?.length,
                itemBuilder: (context, index) {
                  final video = state.videos?[index];
                  final imageUrl = (video?.assets.ekidsChapterIcon != null &&
                          video!.assets.ekidsChapterIcon!.isNotEmpty)
                      ? video.assets.ekidsChapterIcon![
                          0] // Using first icon or any fixed valid index
                      : '';
                  final spentTime = video?.spentTime ?? 0;
                  final duration = video?.duration ?? 0;
                  final progressValue = spentTime / duration;
                  return VideoTileWidget(
                    key: Key('video_list_item_$index'),
                    videoName: video?.name ?? '',
                    progressValue: progressValue,
                    index: index,
                    imageUrl: imageUrl,
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoPlayerScreen(
                                    videoUrl: video?.url ?? '',
                                    videoName: video?.name ?? 'S3',
                                    videoType: video?.videoSource ?? '',
                                  ))).then((value){
                        context.read<VideoPlayerBloc>().add(ResetVideoStateEvent());
                      });
                    },
                  );
                },
              );
            }
            return const SizedBox();
          },
        ));
  }
}
