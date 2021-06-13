import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/screens/gym%20guide/gym_guide.dart';
import 'package:my_app/screens/hello%20screen/hello_Screen.dart';
import 'package:my_app/screens/home%20screen/home_screen.dart';
import 'package:my_app/screens/home%20workout/home_workou.dart';
import 'package:my_app/screens/list%20video/list_video.dart';
import 'package:my_app/screens/nitrition%20screen/components/caculate_BMI.dart';
import 'package:my_app/screens/nitrition%20screen/components/test_container.dart';
import 'package:my_app/screens/nitrition%20screen/nutrition_screen.dart';
//import 'package:my_app/screens/home%20screen/home_screen.dart';
//import 'package:my_app/screens/hello%20screen/hello_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fit Body',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          primaryColor: kPrimaryColor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: TestContainer(),
    );
  }
}
