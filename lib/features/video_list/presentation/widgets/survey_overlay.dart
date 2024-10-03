import 'package:flutter/material.dart';

class VideoCompletionSurvey extends StatelessWidget {
  final VoidCallback onSurveyComplete;

  const VideoCompletionSurvey({Key? key, required this.onSurveyComplete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      child: Container(
        color: Colors.black.withOpacity(0.8),
        child: Card(
          margin: const EdgeInsets.all(24),
          elevation: 8, // Adds shadow for better visibility
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'How was the video?',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        onSurveyComplete(); // Handle completion
                      },
                      child: const Text('Great'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        onSurveyComplete(); // Handle completion
                      },
                      child: const Text('Good'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        onSurveyComplete(); // Handle completion
                      },
                      child: const Text('Okay'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
