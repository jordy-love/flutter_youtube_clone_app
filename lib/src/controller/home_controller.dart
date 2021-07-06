import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:youtube_clone_app2/src/models/youtube_video_result.dart';
import 'package:youtube_clone_app2/src/repository/youtube_repository.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult(items: []).obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    _videoLoad();
    _event();
    super.onInit();
  }

  void _event() {
    scrollController.addListener(() {
      //print(scrollController.position.pixels);
      //print(scrollController.position.maxScrollExtent);
      // 스크롤이 마지막 영역이면
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent && youtubeResult.value.nextPageToken != "") {
        _videoLoad();
      }
    });
  }

  void _videoLoad() async {
    YoutubeVideoResult youtubeVideoResult =
        await YoutubeRepository.to.loadVideos(youtubeResult.value.nextPageToken??"");

    if (youtubeVideoResult != null &&
        youtubeVideoResult.items != null &&
        youtubeVideoResult.items.length > 0) {
      youtubeResult.update((youtube) {
        youtube.nextPageToken = youtubeVideoResult.nextPageToken;
        youtube.items.addAll(youtubeVideoResult.items);
      });
    }
  }

}
