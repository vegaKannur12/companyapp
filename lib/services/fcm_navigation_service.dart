import 'package:companyapp/screen/page1.dart';
import 'package:companyapp/screen/page2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/dashboard/dashboard.dart';

class FcmNavigationService {
  FcmNavigationService({this.page});
  final String? page;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<void>? navigateToPage() {
    // ignore: avoid_print
    print("page----$page");
    // return Navigator.of(navigatorKey.currentContext!).push(
    //   MaterialPageRoute(
    //     builder: (context) => const Dashboard(),
    //   ),
    // );

    switch (page) {
      case "home":
        Get.to(const Dashboard());
        break;
      // return Navigator.of(navigatorKey.currentContext!)
      //     .push(MaterialPageRoute(
      //         builder: (context) => const Dashboard(

      //             )));
      case "page1":
        Get.to(const Page1());
        //  navigatorKey.currentState?.push(MaterialPageRoute(
        //         builder: (context) => const QuestionsPage1(

        //             )));
        break;

      case "page2":
        Get.to(const Page2());
        //  navigatorKey.currentState?.push(MaterialPageRoute(
        //         builder: (context) => const QuestionsPage1(

        //             )));
        break;
      // return Navigator.of(navigatorKey.currentContext!)
      //     .push(MaterialPageRoute(
      //         builder: (context) => const QuestionsPage1(

      //             )));
      // case "customer":
      //   return Navigator.of(navigatorKey.currentContext!).push(
      //       MaterialPageRoute(builder: (context) => const ProfileScreen()));

      // case "return":
      //   return Navigator.of(navigatorKey.currentContext!)
      //       .push(MaterialPageRoute(
      //           builder: (context) => const BottomNavScreen(
      //                 selectedIndex: 3,
      //               )));
      // case "promocode":
      //   return Navigator.of(navigatorKey.currentContext!)
      //       .push(MaterialPageRoute(
      //           builder: (context) => const BottomNavScreen(
      //                 selectedIndex: 1,
      //               )));

      // case "product":
      //   return Navigator.of(navigatorKey.currentContext!)
      //       .push(MaterialPageRoute(
      //           builder: (context) => const BottomNavScreen(
      //                 selectedIndex: 1,
      //               )));

      default:
        return Navigator.of(navigatorKey.currentContext!)
            .push(MaterialPageRoute(builder: (context) => const Dashboard()));
    }
  }
}
