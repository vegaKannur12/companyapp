import 'package:companyapp/screen/dashboard/dashboard.dart';
import 'package:companyapp/services/fcm_service.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'controller/controller.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@pragma("vm:entry-point")
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  debugPrint('Handling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FcmService().initialize();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Controller()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // fontFamily: 'Roboto Mono sample',
        visualDensity: VisualDensity.adaptivePlatformDensity,

        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
        // scaffoldBackgroundColor: P_Settings.bodycolor,
        // textTheme: const TextTheme(
        //   headline1: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        //   headline6: TextStyle(
        //     fontSize: 25.0,
        //   ),
        //   bodyText2: TextStyle(
        //     fontSize: 14.0,
        //   ),
        // ),
      ),
      navigatorKey: navigatorKey,
      home: const Dashboard(),
    );
  }
}

// import 'package:companyapp/services/notification.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// void main() async {
//   await init();
//   runApp(const MyApp());
// }

// Future init() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String notificationTitle = 'No Title';
//   String notificationBody = 'No Body';
//   String notificationData = 'No Data';

//   @override
//   void initState() {
//     final firebaseMessaging = FCM();
//     firebaseMessaging.setNotifications();
//     firebaseMessaging.streamCtlr.stream.listen(_changeData);
//     firebaseMessaging.bodyCtlr.stream.listen(_changeBody);
//     firebaseMessaging.titleCtlr.stream.listen(_changeTitle);

//     super.initState();
//   }

//   _changeData(String msg) => setState(() => notificationData = msg);
//   _changeBody(String msg) => setState(() => notificationBody = msg);
//   _changeTitle(String msg) => setState(() => notificationTitle = msg);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               notificationTitle,
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             Text(
//               notificationBody,
//               style: Theme.of(context).textTheme.headline6,
//             ),
//             Text(
//               notificationData,
//               style: Theme.of(context).textTheme.headline6,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
