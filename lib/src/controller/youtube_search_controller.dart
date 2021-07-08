import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_clone_app2/src/models/youtube_video_result.dart';
import 'package:youtube_clone_app2/src/repository/youtube_repository.dart';

class YoutubeSearchController extends GetxController {
  String key = "SearchKey";
  RxList<String> history = RxList<String>.empty(growable: true); //RxList 초기화방식
  //Set<String> originHistory = {}; // set은 중복허용x
  SharedPreferences _profs; //로컬스토리지 사용
  Rx<YoutubeVideoResult> youtubeVideoResult = YoutubeVideoResult(items: []).obs;
  ScrollController scrollController = ScrollController();
  String _currentKeyword;

  @override
  void onInit() async {
    _event();
    _profs = await SharedPreferences.getInstance();
    List<dynamic> initData = _profs.get(key) ?? [];

    // 중복제거방법1)set사용
    // originHistory.addAll(initData.map((_)=> _.toString()).toList());
    // history(originHistory.toList());

    // 중복제거방법2)
    history(initData.map<String>((_) => _.toString()).toList());
    super.onInit();
  }

  void _event() {
    scrollController.addListener(() {
      // 스크롤이 마지막 영역이면
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          youtubeVideoResult.value.nextPageToken != "") {
        _searchYoutube(_currentKeyword);
      }
    });
  }

  void submitSearch(String searchKey) {
    // 중복제거방법1)set사용
    // history.clear();
    // originHistory.add(searchKey);
    // history.addAll(originHistory.toList());
    // profs.setStringList(key, originHistory.toList());

    // 중복제거방법2) addIf사용
    history.addIf(!history.contains(searchKey), searchKey);
    _currentKeyword = searchKey;
    _profs.setStringList(key, history);
    _searchYoutube(searchKey);
  }

  void _searchYoutube(String searchKey) async {
    YoutubeVideoResult youtubeVideoResultFromServer =
        await YoutubeRepository.to.search(searchKey, youtubeVideoResult.value.nextPageToken?? "");

    if (youtubeVideoResultFromServer != null &&
        youtubeVideoResultFromServer.items != null &&
        youtubeVideoResultFromServer.items.length > 0) {
      youtubeVideoResult.update((youtube) {
        youtube.nextPageToken = youtubeVideoResultFromServer.nextPageToken;
        youtube.items.addAll(youtubeVideoResultFromServer.items);
      });
    }
  }
}
