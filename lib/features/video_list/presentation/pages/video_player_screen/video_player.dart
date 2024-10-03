import 'package:flutter/material.dart';
import '../video_players/default_video_player.dart';
import '../video_players/youtube_player.dart';

class VideoPlayerScreen extends StatelessWidget {
  final String videoUrl;
  final String videoName;
  final String videoType; // Add a video type (e.g., 's3', 'youtube')

  const VideoPlayerScreen({
    required this.videoUrl,
    required this.videoName,
    required this.videoType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildVideoPlayer(),
    );
  }

  Widget _buildVideoPlayer() {
    if (videoType == 's3') {
      return DefaultVideoPlayer(videoUrl: videoUrl, videoName: videoName,);
    } else if (videoType == 'youtube') {
      return YoutubePlayerScreen(videoUrl: videoUrl, videoName: videoName,);
    } else {
      return const Text('Unsupported video type');
    }
  }
}
