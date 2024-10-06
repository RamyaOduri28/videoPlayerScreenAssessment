import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VideoTileWidget extends StatelessWidget {
  const VideoTileWidget({
    super.key,
    required this.videoName,
    required this.progressValue,
    required this.press,
    this.imageUrl, this.index,
  });

  final String? videoName;
  final double progressValue;
  final VoidCallback press;
  final String? imageUrl;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey('videoTile'),  // Add this key
      margin: const EdgeInsets.only(top: 16, bottom: 0, left: 16, right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            // imageUrl ?? '',  // Replace with your image URL
            // fit: BoxFit.cover,
            width: 50,
            height: 50,
            color: Colors.teal,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  videoName ?? '',
                  key: const ValueKey('keyVideoName'),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 200,
                  height: 10,
                  child: LinearProgressIndicator(
                    key: const ValueKey('progressIndicatorKey'), // Ensure this value is unique for testing
                    value: progressValue,
                    borderRadius: BorderRadius.circular(8),
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () => press(),
            child: Container(
              width: 40.0,
              height: 40.0,
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: progressValue >= 1
                      ? const Icon(Icons.replay, key: ValueKey('replayIconKey'),)
                      : Icon(Icons.play_circle_fill, key: ValueKey('playIconKey_$index'),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
