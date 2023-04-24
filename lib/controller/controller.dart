import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../components/network_connectivity.dart';

class Controller extends ChangeNotifier {
  String? firToken;
  List<bool> tileColor = [];
  bool buttonPressed = false;
  String? scancode;
  List<Map<String, dynamic>> level1Options = [];
  List<Map<String, dynamic>> level2Options = [
    {
      "id": "1",
      "value": " Install / ReInstall Server",
    },
    {
      "id": "2",
      "value": " Install/ ReInstall a node system ",
    },
  ];
  setScanCode(String scan) {
    scancode = scan;
    notifyListeners();
  }

  setbuttonPressed(bool value) {
    buttonPressed = value;
    notifyListeners();
  }

  saveEmployeeData(BuildContext context, String emCode) {
    NetConnection.networkConnection(context).then((value) async {
      if (value == true) {
        try {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String? branchId = prefs.getString("branch_id");
          String? userId = prefs.getString("user_id");

          Uri url =
              Uri.parse("https://trafiqerp.in/order/fj/get_registration.php");
          Map body = {
            'staff_id': userId,
            'branch_id': branchId,
          };
          // ignore: avoid_print
          print("menu body--$body");

          http.Response response = await http.post(url, body: body);
          var map = jsonDecode(response.body);
          // ignore: avoid_print
          print("map----$map");

          notifyListeners();
        } catch (e) {
          // return null;
          return [];
        }
      }
    });
  }

///////////////////////////////////////////////////////////////////////////////
  generateTileColor() {
    tileColor = List.generate(level1Options.length, (color) => false);
  }

  setColor(bool value, int i) {
    tileColor[i] = value;
    notifyListeners();
  }

////////////////////////////////////////////////////////////
  getLevel1Questions(BuildContext context) {
    level1Options = [
      {
        "id": "1",
        "value": " Install / ReInstall Software",
      },
      {
        "id": "2",
        "value": " Doubts about the software",
      },
      {
        "id": "3",
        "value": "Software Error",
      },
      {
        "id": "4",
        "value": "Software Modifications",
      },
      {
        "id": "5",
        "value": "Training request on Software",
      }
    ];
    // NetConnection.networkConnection(context).then((value) async {
    //   if (value == true) {
    //     try {
    //       Uri url = Uri.parse("$urlgolabl/dashboard_list.php");
    //       SharedPreferences prefs = await SharedPreferences.getInstance();
    //       String? branch_id = prefs.getString("branch_id");
    //       String? user_id = prefs.getString("user_id");
    //       Map body = {"staff_id": user_id};

    //       http.Response response = await http.post(url, body: body);
    //       var map = jsonDecode(response.body);
    //       print("dahsboard map------$map");

    //       notifyListeners();
    //       // PriorityListModel prioModel = PriorityListModel.fromJson(map);
    //       // print("priority_list-----$map");
    //       // priorityList.clear();
    //       // for (var item in prioModel.priorityLevel!) {
    //       //   priorityList.add(item);
    //       // }
    //     } catch (e) {
    //       print(e);
    //       // return null;
    //       return [];
    //     }
    //   }
    // });
  }

  ///////////////////////////////////////////

  getNot(String token) async {
   
    try {
      Uri url = Uri.parse("https://fcm.googleapis.com/fcm/send");
      Map body = {
        "registration_ids": [
          token
          // "fqE7wk85RDeBeM6WSaDehw:APA91bF5P6-Gw6reCJ9DT5s0kxCmOjx8BUYoyE9AG-JAUtDz02Kw3s1u7EVi_7c9hiJpWksiYbTD_Lp82N5bj6l--1EN5QFhljJeCoss3CF7cSQ9CGHcYnVI5elZgi98jKZu49f2yzWS"
        ],
        "notification": {
          "body": "New offer",
          "title": "haiiiii",
          "android_channel_id": "high_importance_channel",
          "sound": true
        },
        "data": {
          "payload": "page1",
          "priority": "high",
          // "sound": "app_sound.wav",
          "content_available": true,
        },
      };
      var jsonEn = jsonEncode(body);
      // ignore: avoid_print
      print("body------------$body");
      http.Response response = await http.post(
        url,
        body: jsonEn,
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              "key=AAAAdSTE6n8:APA91bG-wv0OTyU8JTQ4E800sHDqTy1H0PW_sgi-Vmg2VyrSZN-Y8M49a1YtlWelDvifXZIayIhK0IYPFb6wBhZTGyXkGTO7f_x1GaMzrljDTbrnlZxlV3yKDl6Yf9b3K4rqTocGG8jJ"
        },
      );

      var map = jsonDecode(response.body);

      // ignore: avoid_print
      print("map-------------$map");

      /////////////// insert into local db /////////////////////
    } catch (e) {
      // ignore: avoid_print
      print(e);
      // return null;
      return [];
    }
  }
}
