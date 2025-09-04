import 'package:flutter/material.dart';
import 'package:awesome_video_player/awesome_video_player.dart';

class CourseVideoPlayerView extends StatelessWidget {
  const CourseVideoPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Video", style: const TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: BetterPlayer.network(
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
          betterPlayerConfiguration: BetterPlayerConfiguration(
            aspectRatio: 16 / 9,
            autoDetectFullscreenAspectRatio: true,
            autoDetectFullscreenDeviceOrientation: true,

            subtitlesConfiguration: BetterPlayerSubtitlesConfiguration(
                alignment: Alignment.bottomCenter
            ),
            controlsConfiguration: BetterPlayerControlsConfiguration(
              enableSubtitles: true,
              subtitlesIcon: Icons.subtitles,
            )
          ),
        ),
      ),
    );
  }
}
