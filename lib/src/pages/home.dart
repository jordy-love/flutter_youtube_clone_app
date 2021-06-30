import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone_app2/src/components/CustomAppBar.dart';
import 'package:youtube_clone_app2/src/components/video_widget.dart';
import 'package:youtube_clone_app2/src/controller/home_controller.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: CustomAppBar(),
            floating: true,
            snap: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed("/detail/111");
                  },
                  child: VideoWidget(),
                );
              },
              childCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
