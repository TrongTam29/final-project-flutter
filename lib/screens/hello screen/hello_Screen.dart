import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/screens/home%20screen/home_screen.dart';

class HelloScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen())));
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage(
              "assets/images/HelloScreen.png",
            ),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 90)),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.topCenter,
                    child: RichText(
                      text: TextSpan(
                          text: 'Fit Body\n',
                          style: TextStyle(
                              fontSize: 45,
                              fontFamily: 'Wellfleet',
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Your Fitness starts here',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Wellfleet',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            )
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(padding: EdgeInsets.only(bottom: 150)),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: RichText(
                      text: TextSpan(
                          text:
                              'IF IT DOESN’T CHALLENGE YOU \nIT DOESN’T CHANGE YOU\n',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'AdventPro',
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                          children: [
                            TextSpan(
                              text: 'Channge with Fit Body\n\n',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'BeVietnam',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            )
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
