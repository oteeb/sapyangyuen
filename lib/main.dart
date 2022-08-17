import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:sapyangyuen/intro_screens/introduction_screens.dart';
import 'pages/home_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to Sapyangyuen",
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        fontFamily: 'Mitr',
        
      ),
      debugShowCheckedModeBanner: false,
      home: IntroductionScreens(),
      builder: EasyLoading.init(),
    );
  }
}
