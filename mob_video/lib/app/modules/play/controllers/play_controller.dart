import 'dart:io';

import 'package:get/get.dart';
import 'package:mob_video/app/modules/home/model/assets_file.dart';
import 'package:video_player/video_player.dart';

class PlayController extends GetxController {
  final AssetsFile file = Get.arguments;
  late VideoPlayerController videoPlayerController;
  bool startedPlaying = false;

  @override
  void onInit() {
    super.onInit();

    videoPlayerController = VideoPlayerController.file(File(file.path));
    videoPlayerController.addListener(() {
      if (startedPlaying && !videoPlayerController.value.isPlaying) {
        //Get.back();
      }
    });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  Future<bool> started() async {
    await videoPlayerController.initialize();
    await videoPlayerController.play();
    startedPlaying = true;
    return true;
  }
}
