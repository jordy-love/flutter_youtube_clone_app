import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_clone_app2/src/controller/video_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeDetailController extends GetxController {
  VideoController videoController;
  YoutubePlayerController playerController;

  @override
  void onInit() {
    // TODO: implement onInit
    videoController = Get.find(tag: Get.parameters['videoId']);
    playerController = YoutubePlayerController(
      initialVideoId: Get.parameters['videoId'],
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
    super.onInit();
  }

  String get title => videoController.video.snippet.title;

  String get description => videoController.video.snippet.description;

  String get viewCount => videoController.statistics.value.viewCount;

  String get likeCount => videoController.statistics.value.likeCount;

  String get dislikeCount => videoController.statistics.value.dislikeCount;

  String get publishedTime =>
      DateFormat("yyy-MM-dd").format(videoController.video.snippet.publishTime);

  String get youtuberThumbnail => videoController.youtuberThumbnailUrl;
  String get youtuberSubsCount => videoController.youtuber.value.statistics?.subscriberCount ?? "0";

  String get youtuberName {
    return videoController.youtuber.value.snippet?.title ?? "개발하는남자";
  }
}
