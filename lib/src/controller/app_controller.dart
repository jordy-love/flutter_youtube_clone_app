import 'package:get/get.dart';
import 'package:youtube_clone_app2/src/components/youtube_bottom_sheet.dart';

enum RoutsName { Home, Explore, Add, Subs, Library }

// current index(page) 관리 컨트롤러
class AppController extends GetxService {
  static AppController get to => Get.find(); //어디서든 접근되도록 static
  RxInt currentIndex = 0.obs;

  void changePageIndex(int index) {
    if (RoutsName.values[index] == RoutsName.Add) {
      _showBottomSheet();
    } else {
      currentIndex(index);
    }
  }

  void _showBottomSheet() {
    Get.bottomSheet(YoutubeBottomSheet());
  }
}
