import 'package:get/get.dart';
import 'package:youtube_clone_app2/src/repository/youtube_repository.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  @override
  void onInit() {
    _videoLoad();
    super.onInit();
  }

  void _videoLoad() {
    YoutubeRepository.to.loadVideos();
  }
}
