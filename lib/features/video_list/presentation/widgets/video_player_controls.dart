import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerControls extends StatelessWidget {
  final VideoPlayerController controller;
  final bool isPlaying;
  final bool isFullscreen;
  final VoidCallback onFullscreenToggle;
  final VoidCallback onPlay;
  final VoidCallback onPause;
  final VoidCallback onSeekForward;
  final VoidCallback onSeekBackward;

  const VideoPlayerControls({
    Key? key,
    required this.controller,
    required this.isPlaying,
    required this.isFullscreen,
    required this.onFullscreenToggle,
    required this.onPlay,
    required this.onPause,
    required this.onSeekForward,
    required this.onSeekBackward,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(bottom: isFullscreen ? 20 : 0),
        height: isFullscreen ? 80.0 : 60.0,
        color: Colors.black45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white),
              onPressed: isPlaying ? onPause : onPlay,
            ),
            IconButton(
              icon: const Icon(Icons.replay_10, color: Colors.white),
              onPressed: onSeekBackward,
            ),
            IconButton(
              icon: const Icon(Icons.forward_10, color: Colors.white),
              onPressed: onSeekForward,
            ),
            Expanded(
              child: VideoProgressIndicator(
                controller,
                allowScrubbing: true,
                colors: const VideoProgressColors(
                  playedColor: Colors.blueAccent,
                  bufferedColor: Colors.grey,
                  backgroundColor: Colors.black,
                ),
              ),
            ),
            IconButton(
              icon: Icon(isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen, color: Colors.white),
              onPressed: onFullscreenToggle,
            ),
          ],
        ),
      ),
    );
  }
}