import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';

import 'package:my_app/screens/detail%20cardio/detail_cardio.dart';
import 'package:my_app/screens/detail%20video/detail_video.dart';

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
        home: DetailCardio(
          url:
              'https://www.youtube.com/watch?v=2MZSjB1WLFg&list=WL&index=12&t=228s',
        ));
  }
}
