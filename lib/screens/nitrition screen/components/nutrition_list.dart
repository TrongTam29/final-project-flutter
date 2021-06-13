import 'package:flutter/material.dart';

class NutritionListLeft extends StatelessWidget {
  const NutritionListLeft(
      {Key key,
      @required this.size,
      this.nutritionImage,
      this.nutritionSubTitle,
      this.nutritionTitle})
      : super(key: key);

  final Size size;
  final String nutritionImage;
  final String nutritionTitle;
  final String nutritionSubTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            nutritionImage,
            width: size.width * 0.5 - 10,
            height: size.height * 0.1 + 10,
            fit: BoxFit.fill,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                  text: nutritionTitle,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'PragatiNarrow-Bold',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text: nutritionSubTitle,
                      style: TextStyle(
                          height: 1.8,
                          fontSize: 13,
                          fontFamily: 'PragatiNarrow-Regular',
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    )
                  ]),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class NutritionListRight extends StatelessWidget {
  const NutritionListRight(
      {Key key,
      @required this.size,
      this.nutritionImage,
      this.nutritionSubTitle,
      this.nutritionTitle})
      : super(key: key);

  final Size size;
  final String nutritionImage;
  final String nutritionTitle;
  final String nutritionSubTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: RichText(
              text: TextSpan(
                  text: nutritionTitle,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'PragatiNarrow-Bold',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text: nutritionSubTitle,
                      style: TextStyle(
                          height: 1.8,
                          fontSize: 13,
                          fontFamily: 'PragatiNarrow-Regular',
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    )
                  ]),
              textAlign: TextAlign.center,
            ),
          ),
          Image.asset(
            nutritionImage,
            width: size.width * 0.5 - 10,
            height: size.height * 0.1 + 10,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
