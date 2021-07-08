import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:youtube_clone_app2/src/binding/init_binding.dart';
import 'package:youtube_clone_app2/src/app.dart';
import 'package:youtube_clone_app2/src/controller/youtube_detail_controller.dart';
import 'package:youtube_clone_app2/src/controller/youtube_search_controller.dart';
import 'package:youtube_clone_app2/src/pages/search.dart';

import 'src/components/youtube_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Youtube Clone App",
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: InitBinding(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => App()),
        GetPage(
            name: "/detail/:videoId",
            page: () => YoutubeDetail(),
            binding: BindingsBuilder(() => Get.lazyPut<YoutubeDetailController>(
                () => YoutubeDetailController())
            )),
        GetPage(
            name: "/search",
            page: () => YoutubeSearch(),
            binding: BindingsBuilder(() => Get.lazyPut<YoutubeSearchController>(
                    () => YoutubeSearchController())
            )),
      ],
    );
  }
}
