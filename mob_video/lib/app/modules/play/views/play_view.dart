import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../controllers/play_controller.dart';

class PlayView extends GetView<PlayController> {
  const PlayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(controller.file.name),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<bool>(
          future: controller.started(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data ?? false) {
              return AspectRatio(
                aspectRatio: controller.videoPlayerController.value.aspectRatio,
                child: VideoPlayer(controller.videoPlayerController),
              );
            } else {
              return const Text('waiting for video to load');
            }
          },
        ),
      ),
    );
  }
}
