import 'package:flutter/material.dart';
import 'package:my_app/screens/nitrition%20screen/components/nutrition_list.dart';

import '../../../constants.dart';
import 'caculate_BMI.dart';

class Body extends StatelessWidget {
  const Body();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
        child: Column(
          children: [
            Align(
              alignment: Alignment(0.2, 0.2),
            ),
            CaculateBMI(),
            NutritionListLeft(
              nutritionMargin: 20,
              size: size,
              nutritionImage: 'assets/images/weight_loss.png',
              nutritionTitle: 'Diet for weight loss\n',
              nutritionSubTitle:
                  'This diet is for people with a BMI\n of 25 - 50',
            ),
            NutritionListRight(
              size: size,
              nutritionImage: 'assets/images/gain_weight.png',
              nutritionTitle: 'Diet for weight gain\n',
              nutritionSubTitle:
                  'This diet is for people with a BMI\n of less than 18.5',
            ),
            NutritionListLeft(
              nutritionMargin: 50,
              size: size,
              nutritionImage: 'assets/images/gain_muscle.png',
              nutritionTitle: 'Diet for muscle gain\n',
              nutritionSubTitle:
                  'This diet is for people with a BMI\n of 18.5 - 24.9 but want\n to gain muscle',
            ),
            NutritionListRight(
              size: size,
              nutritionImage: 'assets/images/clean_body.png',
              nutritionTitle: 'Diet for clean body\n',
              nutritionSubTitle:
                  'This diet is for people with a BMI\n of 18.5 - 24.9 but want\n to burn fat',
            ),
          ],
        ),
      ),
    );
  }
}
