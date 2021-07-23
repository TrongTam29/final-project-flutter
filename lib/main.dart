import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/screens/gym%20schedule/gym_schedule.dart';
import 'package:my_app/screens/gym%20schedule/components/monday.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        home: GymSchedule());
  }
}
