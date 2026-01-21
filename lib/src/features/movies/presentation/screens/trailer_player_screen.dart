import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:adnan_movie_app_tentwenty_assignment/src/config/injector/app_injector_helper.dart';

class TrailerPlayerScreen extends StatefulWidget {
  final String videoKey;

  const TrailerPlayerScreen({super.key, required this.videoKey});

  @override
  State<TrailerPlayerScreen> createState() => _TrailerPlayerScreenState();
}

class _TrailerPlayerScreenState extends State<TrailerPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoKey,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        controlsVisibleAtStart: true,
        enableCaption: false,
        loop: false,
      ),
    );

    // Listen for video completion
    _controller.addListener(_videoListener);
  }

  void _videoListener() {
    final position = _controller.value.position;
    final duration = _controller.value.metaData.duration;

    // Auto-close when video finishes
    if (position.inMilliseconds > 0 &&
        duration.inMilliseconds > 0 &&
        position >= duration) {
      if (mounted) {
        context.pop();
      }
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_videoListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: injectedAppColors.black,
      body: Stack(
        children: [
          // Full-screen YouTube player
          SizedBox.expand(
            child: YoutubePlayer(
              controller: _controller,
              progressIndicatorColor: injectedAppColors.regularSeatColor,
              progressColors: ProgressBarColors(
                playedColor: injectedAppColors.regularSeatColor,
                handleColor: injectedAppColors.regularSeatColor,
                bufferedColor: injectedAppColors.lightGrey,
                backgroundColor: injectedAppColors.darkGrey,
              ),
            ),
          ),
          // Done button
          SafeArea(
            child: Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: Icon(Icons.close, color: injectedAppColors.white),
                onPressed: () {
                  _controller.pause();
                  context.pop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
