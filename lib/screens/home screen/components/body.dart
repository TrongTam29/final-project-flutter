import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/screens/gym%20guide/gym_guide.dart';
import 'package:my_app/screens/home%20screen/components/header_with_seachbox.dart';
import 'package:my_app/screens/home%20workout/home_workout.dart';
import 'package:my_app/screens/list%20cardio/list_cardio.dart';
import 'package:my_app/screens/nitrition%20screen/nutrition_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderAndSearchbox(),
          MethodsInBody(),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container MethodsInBody() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Image.asset(
              'assets/images/GymGuide.png',
              width: 360,
              height: 195,
              fit: BoxFit.fill,
            ),
            onTap: () => Get.to(GymGuide()),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Image.asset(
                    'assets/images/HomeWorkout.png',
                    width: 170,
                    height: 130,
                    fit: BoxFit.fill,
                  ),
                  onTap: () => Get.to(HomeWorkout()),
                ),
                GestureDetector(
                  child: Image.asset(
                    'assets/images/nutrition.png',
                    width: 170,
                    height: 130,
                    fit: BoxFit.fill,
                  ),
                  onTap: () => Get.to(NutritionScreen()),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Image.asset(
                    'assets/images/MyWorkout.png',
                    width: 170,
                    height: 130,
                    fit: BoxFit.fill,
                  ),
                ),
                GestureDetector(
                  child: Image.asset(
                    'assets/images/cardio.png',
                    width: 170,
                    height: 130,
                    fit: BoxFit.fill,
                  ),
                  onTap: () => Get.to(ListCardio()),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
