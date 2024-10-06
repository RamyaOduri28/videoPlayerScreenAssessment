import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import '../../bloc/video_detail_screen_bloc/video_player_bloc.dart';
import '../../widgets/survey_overlay.dart';
import '../../widgets/video_player_controls.dart';

class DefaultVideoPlayer extends StatefulWidget {
  const DefaultVideoPlayer({
    Key? key,
    required this.videoUrl,
    required this.videoName,
  }) : super(key: key);

  final String videoUrl;
  final String videoName;

  @override
  State<DefaultVideoPlayer> createState() => _DefaultVideoPlayerState();
}

class _DefaultVideoPlayerState extends State<DefaultVideoPlayer> {
  VideoPlayerController? controller;
  bool isPlaying = false;
  bool isFullscreen = false;

  @override
  void initState() {
    super.initState();
    isFullscreen = false;
    _setOrientation(isFullscreen);
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        context.read<VideoPlayerBloc>().add(PlayVideoClickedEvent());
      });
  }

  @override
  void dispose() {
    if (isFullscreen) {
      context.read<VideoPlayerBloc>().add(ToggleFullscreenClickedEvent());
      _setOrientation(false); // Ensure we reset to portrait on dispose
    }
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
      builder: (context, state) {
        if (state is VideoPlayerErrorState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ToggleFullScreenState) {
          isFullscreen = !isFullscreen;
          _setOrientation(isFullscreen);
        } else if (state is VideoPlayerPaused) {
          isPlaying = false;
          controller?.pause();
        } else if (state is VideoPlayerPlaying) {
          isPlaying = true;
          controller?.play();
        } else if (state is SeekForward) {
          _seekVideo(10); // Helper function to seek forward
        } else if (state is SeekBackward) {
          _seekVideo(-10); // Helper function to seek backward
        }
        return Scaffold(
            appBar: isFullscreen
                ? null
                : AppBar(
                    title: Text(
                      widget.videoName,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
            body: _buildBody(
                context, state) // Pass the current state to _buildBody
            );
      },
    );
  }

  void _seekVideo(int seconds) {
    if (controller != null && controller!.value.isInitialized) {
      final currentPosition = controller!.value.position;
      final newPosition = currentPosition + Duration(seconds: seconds);

      if (newPosition < Duration.zero) {
        controller!.seekTo(Duration.zero);
      } else if (newPosition < controller!.value.duration) {
        controller!.seekTo(newPosition);
      } else {
        controller!.seekTo(controller!.value.duration);
        context.read<VideoPlayerBloc>().add(VideoCompleteEvent());
      }
    }
  }

  Widget _buildBody(BuildContext context, VideoPlayerState state) {
    return SafeArea(
      child: Stack(
        fit: StackFit.loose,
        children: [
          if (controller != null && controller!.value.isInitialized)
            isFullscreen
                ? Positioned.fill(
              child: VideoPlayer(controller!),
            )
                : AspectRatio(
              aspectRatio: 16 / 9,
              child: VideoPlayer(controller!),
            )
          else
            const Center(
              child: CircularProgressIndicator(), // Show loading indicator while video is initializing
            ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: VideoPlayerControls(
              isPlaying: isPlaying,
              isFullscreen: isFullscreen,
              controller: controller!,
              onFullscreenToggle: () {
                context
                    .read<VideoPlayerBloc>()
                    .add(ToggleFullscreenClickedEvent());
              },
              onPlay: () {
                context.read<VideoPlayerBloc>().add(PlayVideoClickedEvent());
              },
              onPause: () {
                context.read<VideoPlayerBloc>().add(PauseVideoClickedEvent());
              },
              onSeekForward: () {
                context.read<VideoPlayerBloc>().add(SeekForwardClickedEvent());
              },
              onSeekBackward: () {
                context.read<VideoPlayerBloc>().add(SeekBackwardClickedEvent());
              },
            ),
          ),
          if (state is VideoPlayerCompleted)
            VideoCompletionSurvey(
              onSurveyComplete: () {
                context.read<VideoPlayerBloc>().add(PlayVideoClickedEvent());
              },
            ),
        ],
      ),
    );
  }
}

void _setOrientation(bool isFullscreen) {
  if (isFullscreen) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  } else {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }
}

