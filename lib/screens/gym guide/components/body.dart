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
            'assets/images/GymSchedule.png',
            width: size.width * 0.9,
            height: size.height * 0.2 + 20,
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
                  'assets/images/Chest_gym.png',
                  width: size.width * 0.5 - 27,
                  height: size.height * 0.2 - 35,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  'assets/images/ForeArm_gym.png',
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
                  'assets/images/shoulder_gym.png',
                  width: size.width * 0.5 - 27,
                  height: size.height * 0.2 - 35,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  'assets/images/backArm_gym.png',
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
                  'assets/images/Back_gym.png',
                  width: size.width * 0.5 - 27,
                  height: size.height * 0.2 - 35,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  'assets/images/Abs_gym.png',
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
                  'assets/images/Leg_gym.png',
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
