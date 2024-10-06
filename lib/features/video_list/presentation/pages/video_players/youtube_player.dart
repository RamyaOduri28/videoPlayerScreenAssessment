import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/video_detail_screen_bloc/video_player_bloc.dart'; // Adjust import according to your project structure
import '../../widgets/survey_overlay.dart'; // Make sure to import your survey overlay widget

class YoutubePlayerScreen extends StatelessWidget {
  final String videoUrl;
  final String videoName;

  const YoutubePlayerScreen({
    Key? key,
    required this.videoUrl,
    required this.videoName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VideoPlayerBloc(),
      child: YoutubePlayerView(videoUrl: videoUrl, videoName: videoName),
    );
  }
}

class YoutubePlayerView extends StatefulWidget {
  final String videoUrl;
  final String videoName;

  const YoutubePlayerView({
    Key? key,
    required this.videoUrl,
    required this.videoName,
  }) : super(key: key);

  @override
  _YoutubePlayerViewState createState() => _YoutubePlayerViewState();
}

class _YoutubePlayerViewState extends State<YoutubePlayerView> {
  late YoutubePlayerController _controller;
  bool _isSurveyShown = false; // Track if the survey has been shown

  @override
  void initState() {
    super.initState();

    // Initialize YouTube player with the video URL
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        controlsVisibleAtStart: true,
        hideControls: false,
      ),
    );

    // Listen for video completion
    _controller.addListener(() {
      if (_controller.value.playerState == PlayerState.ended &&
          !_isSurveyShown) {
        context
            .read<VideoPlayerBloc>()
            .add(VideoCompleteEvent()); // Trigger video complete event
        _isSurveyShown = true; // Mark survey as shown
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _restartVideo() {
    _controller.load(YoutubePlayer.convertUrlToId(widget.videoUrl)!);
    _isSurveyShown = false; // Reset survey flag when restarting the video
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.videoName), // Display video name in appBar
            backgroundColor: Colors.blue,
          ),
          body: Stack(
            children: [
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                onReady: () {
                  // Additional actions when video is ready
                },
              ),
              if (state is VideoPlayerCompleted &&
                  _isSurveyShown) // Show survey overlay if video is completed
                VideoCompletionSurvey(
                  onSurveyComplete: () {
                    context.read<VideoPlayerBloc>().add(ResetVideoStateEvent());

                    // Delay to ensure the state is reset before restarting video
                    Future.delayed(const Duration(milliseconds: 100), () {
                      _restartVideo(); // Restart the video
                    });
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
