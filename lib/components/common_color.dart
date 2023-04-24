import 'package:flutter/material.dart';

// ignore: camel_case_types
class P_Font {
  static String kronaOne = 'KronaOne-Regular';
}

// ignore: camel_case_types
class P_Image {
  static String login = 'assets/image/01.jpg';
  static String empty = 'assets/image/04.jpg';
}

// ignore: camel_case_types
class P_Settings {
  /// [title] Project Title
  // static String get title => 'Order App';
  static Color get loginPagetheme => Colors.purple;
  static Color get lightPurple =>const Color.fromARGB(255, 173, 120, 182);
  static Color get fillcolor => const Color.fromARGB(255, 237, 226, 238);

  static Color get whiteColor => Colors.white;
  static Color get appbar => const Color(0xFF0EDED2);
  static Color get appbar2 => const Color(0xFFFF9945);
  static Color get mainColor =>Colors.blue;


  static List<Color> signInGradients = [
    const Color(0xFF0EDED2),
    const Color(0xFF03A0FE),
  ];

 static List<Color> signUpGradients = [
    const Color(0xFFFF9945),
    const Color(0xFFFc6076),
  ];
}
