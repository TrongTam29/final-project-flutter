import 'package:flutter/material.dart';
import 'package:my_app/screens/home%20screen/components/header_with_seachbox.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        HeaderAndSearchbox(),
        MethodsInBody(),
      ],
    ));
  }

  // ignore: non_constant_identifier_names
  Container MethodsInBody() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/images/GymGuide.png',
            width: 360,
            height: 195,
            fit: BoxFit.fill,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/HomeWorkout.png',
                  width: 170,
                  height: 130,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  'assets/images/nutrition.png',
                  width: 170,
                  height: 130,
                  fit: BoxFit.fill,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/MyWorkout.png',
                  width: 170,
                  height: 130,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  'assets/images/cardio.png',
                  width: 170,
                  height: 130,
                  fit: BoxFit.fill,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
