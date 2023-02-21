import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutuVideoWidget extends StatelessWidget {
  final String videoKey;

  const YoutuVideoWidget({super.key, required this.videoKey});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      width: double.infinity,
      child: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: videoKey,
        ),
        showVideoProgressIndicator: true,
      ),
    );
  }
}
