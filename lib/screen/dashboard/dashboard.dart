import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../controller/controller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController customerCode = TextEditingController();
  String? token;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFirebaseTokken();
  }

  Future<String?> getFirebaseTokken() async {
    try {
      token = (await _fcm.getToken())!;
      // ignore: avoid_print
      print("token fromfcm--vv----$token");
    } catch (_) {}
    // Provider.of<Controller>(context, listen: false).getNot(token!);
    return token;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // double top=size.height * 0.25 - 0.02;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () async{
                Provider.of<Controller>(context, listen: false).getNot(token!);
              },
              icon: Icon(Icons.notification_add))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.black,
              height: size.height * 0.25,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 120),
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  onChanged: (value) {
                    // ignore: avoid_print
                    print("val---$value");
                  },
                  controller: customerCode,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.business),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: "Enter Customer Code Here ",
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 46, 44, 44), fontSize: 13),
                  ),
                ),
              ),
            ),
            customerData(size),
            // Padding(
            //   padding: const EdgeInsets.only(top: 18.0),
            //   child: Lottie.asset("assets/company.json"),
            // )
          ],
        ),
      )),
    );
  }

  Widget customerData(Size size) {
    // return Padding(
    //   padding: const EdgeInsets.only(left:18.0,right: 18),
    //   child: Container(
    //     height: size.height * 0.4,
    //     // color: Colors.black,
    //     child: LayoutBuilder(
    //       builder: (context, constraints) {
    //         double innerH = constraints.maxHeight;
    //         double innerw = constraints.maxWidth;

    //         return Stack(
    //           fit: StackFit.expand,
    //           children: [
    //             Positioned(
    //               bottom: 0,
    //               left: 0,
    //               right: 0,
    //               child: Container(
    //                 height: innerH * 0.65,
    //                 width: innerw,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(10),
    //                   color: Colors.grey[100],
    //                 ),
    //               ),
    //             ),
    //             Positioned(
    //               top: 0,
    //               left: 0,
    //               right: 0,
    //               child: Center(
    //                 child: Container(
    //                     child: Image.asset(
    //                   "assets/man.png",
    //                   fit: BoxFit.fitWidth,
    //                   width: innerw * 0.34,
    //                 )),
    //               ),
    //             )
    //           ],
    //         );
    //       },
    //     ),
    //   ),
    // );
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Column(
        // clipBehavior: Clip.none,
        // alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                  radius: 45,
                                  backgroundColor: Colors.grey[200],
                                  backgroundImage: const AssetImage(
                                    "assets/man.png",
                                  )),
                            ],
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "Vega Business Soft ".toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.006,
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                        child: Text(
                                      "C610111",
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.006,
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                        child: Text(
                                      "8900599594",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.006,
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                        child: Text(
                                      "Company Nmae",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[200]),
                                onPressed: () {
                                  Provider.of<Controller>(context,
                                          listen: false)
                                      .getLevel1Questions(context);
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           const QuestionsPage1()),
                                  // );
                                },
                                icon: Image.asset(
                                  "assets/right_d.png",
                                  height: size.height * 0.02,
                                ),
                                label: Text(
                                  "New Service",
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
