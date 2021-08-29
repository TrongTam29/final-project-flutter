import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/login/FbLogin_controller.dart';
import 'package:my_app/login/GgLogin_controller.dart';
import 'package:my_app/screens/home%20screen/home_main.dart';

class HelloScreen extends StatefulWidget {
  @override
  _HelloScreenState createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  GgLoginController ggController = Get.put(GgLoginController());
  FbLoginController fbController = Get.put(FbLoginController());
  bool isLoggedin = false;

  @override
  void initState() {
    super.initState();
    ggController.autoLogin().then((value) {
      if (value == 'null') {
        print(isLoggedin);
        setState(() {
          isLoggedin = false;
        });
      } else if (value != null) {
        setState(() {
          isLoggedin = true;
        });
      } else {
        setState(() {
          isLoggedin = false;
        });
      }
    });

    fbController.autoLogin().then((value) {
      if (value == 'null') {
        print(isLoggedin);
        setState(() {
          isLoggedin = false;
        });
      } else if (value != null) {
        setState(() {
          isLoggedin = true;
        });
      } else {
        setState(() {
          isLoggedin = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2),
        () => {isLoggedin ? Get.to(() => HomeSreen()) : loginMethod()});
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

  Future<dynamic> loginMethod() {
    return Get.defaultDialog(
      barrierDismissible: false,
      title: 'Login',
      titleStyle: TextStyle(
        fontSize: 25,
        fontFamily: 'Wellfleet',
        fontWeight: FontWeight.w400,
      ),
      content: Container(
        child: Column(
          children: [
            Text(
              'Login to experience many interesting features',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins-Light',
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 20),
            FloatingActionButton.extended(
              onPressed: () {
                ggController.loginWithGoogle().then((value) {
                  ggController.logIn().then((value1) {
                    Get.to(() => HomeSreen());
                  });
                });
              },
              label: Text('Login with Google'),
              icon: Image.asset(
                'assets/images/google_icon.png',
                height: 32,
                width: 32,
              ),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            SizedBox(height: 20),
            FloatingActionButton.extended(
              onPressed: () {
                fbController.signInWithFacebook().then((value) {
                  fbController.logIn().then((value1) {
                    Get.to(() => HomeSreen());
                  });
                });
              },
              label: Text('Login with Facebook'),
              icon: Image.asset(
                'assets/images/facebook_icon.png',
                height: 32,
                width: 32,
              ),
              backgroundColor: Colors.blue[600],
              foregroundColor: Colors.black,
            ),
            SizedBox(height: 20),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                Get.to(HomeSreen());
              },
              child: const Text('Skip'),
            ),
          ],
        ),
      ),
    );
  }
}
