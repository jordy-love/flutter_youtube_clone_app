import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_clone_app2/src/controller/app_controller.dart';
import 'package:youtube_clone_app2/src/pages/explore.dart';
import 'package:youtube_clone_app2/src/pages/home.dart';
import 'package:youtube_clone_app2/src/pages/library.dart';
import 'package:youtube_clone_app2/src/pages/subscribe.dart';

class App extends GetView<AppController> {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (RoutsName.values[controller.currentIndex.value]) {
          case RoutsName.Home:
            return Home();
            break;
          case RoutsName.Explore:
            return Explore();
            break;
          case RoutsName.Subs:
            return Subscribe();
            break;
          case RoutsName.Library:
            return Library();
            break;
          case RoutsName.Add:
            break;
        }
        return Container();
      }),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          selectedItemColor: Colors.black,
          /*onTap: (index) {
          print(index);
          //AppController.to.changePageIndex(index);
          ;
        },*/
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePageIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/icons/home_off.svg"),
              activeIcon: SvgPicture.asset("assets/svg/icons/home_on.svg"),
              label: "홈",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/icons/compass_off.svg",
                width: 22,
              ),
              activeIcon: SvgPicture.asset(
                "assets/svg/icons/compass_on.svg",
                width: 22,
              ),
              label: "탐색",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(
                  "assets/svg/icons/plus.svg",
                  width: 35,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/icons/subs_off.svg"),
              activeIcon: SvgPicture.asset("assets/svg/icons/subs_on.svg"),
              label: "구독",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/icons/library_off.svg"),
              activeIcon: SvgPicture.asset("assets/svg/icons/library_on.svg"),
              label: "보관함",
            ),
          ],
        ),
      ),
    );
  }
}
