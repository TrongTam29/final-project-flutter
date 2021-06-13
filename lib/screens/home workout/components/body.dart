import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding),
        child: Column(children: <Widget>[
          Image.asset(
            'assets/images/Eqiupment.png',
            width: size.width * 0.9,
            height: size.height * 0.1 + 10,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
          ),
          Image.asset(
            'assets/images/WorkoutPlan.png',
            width: size.width * 0.9,
            height: size.height * 0.1 + 10,
            fit: BoxFit.fill,
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              "The muscle groups for the gym:",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins-SemiBold',
              ),
            ),
            alignment: Alignment(-0.75, 0),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/Chest_workout.png',
                  width: size.width * 0.5 - 27,
                  height: size.height * 0.2 - 35,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  'assets/images/ForeArm_workout.png',
                  width: size.width * 0.5 - 27,
                  height: size.height * 0.2 - 35,
                  fit: BoxFit.fill,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/Shoulder_workout.png',
                  width: size.width * 0.5 - 27,
                  height: size.height * 0.2 - 35,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  'assets/images/backArm_workout.png',
                  width: size.width * 0.5 - 27,
                  height: size.height * 0.2 - 35,
                  fit: BoxFit.fill,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/Back_Workout.png',
                  width: size.width * 0.5 - 27,
                  height: size.height * 0.2 - 35,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  'assets/images/Abs_workout.png',
                  width: size.width * 0.5 - 27,
                  height: size.height * 0.2 - 35,
                  fit: BoxFit.fill,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/Leg_workout.png',
                  width: size.width * 0.9,
                  height: size.height * 0.2 - 35,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
