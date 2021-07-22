import 'dart:async';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TimerApp extends StatefulWidget {
  TimerApp();

  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  static int minutes = 0;
  int seconds = 45;
  bool exerOrBreak = true;
  bool continueOrBreak = false;
  String active = "Let's Do Exercise";
  late TextEditingController minController;
  late TextEditingController secController;
  late TextEditingController breakController;

  late Timer timer;

  void restartTimerExer() {
    setState(() {
      minutes = int.parse((minController.text));
      seconds = int.parse((secController.text));
      exerOrBreak = true;
      flushBarExer(context);
    });
    startTimer();
  }

  void flushBarExer(BuildContext context) {
    Flushbar(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 30, top: 20, bottom: 20),
      borderRadius: BorderRadius.circular(20),
      backgroundGradient: LinearGradient(
        colors: [Colors.green.shade400, Colors.green.shade200],
        stops: [0.6, 1],
      ),
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      icon: Icon(
        Icons.directions_run_outlined,
        size: 35,
      ),
      messageText: Text("Let's Do Exercise",
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'Wellfleet-Regular',
              color: Colors.black)),
      messageColor: Colors.black,
      duration: Duration(seconds: 2),
    )..show(context);
  }

  void restartTimerBreak() {
    setState(() {
      seconds = int.parse((breakController.text));
      exerOrBreak = false;
      active = "Let's Breathe";
    });
    flushBarBreak(context);
    startTimer();
  }

  void flushBarBreak(BuildContext context) {
    Flushbar(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 30, top: 20, bottom: 20),
      borderRadius: BorderRadius.circular(20),
      backgroundGradient: LinearGradient(
        colors: [Colors.blue.shade400, Colors.blue.shade200],
        stops: [0.6, 1],
      ),
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      icon: Icon(
        Icons.task_alt_outlined,
        size: 35,
      ),
      messageText: Text("Let's Breathe",
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'Wellfleet-Regular',
              color: Colors.black)),
      messageColor: Colors.black,
      duration: Duration(seconds: 2),
    )..show(context);
  }

  void timerPaused() {
    if (timer.isActive == true) {
      timer.cancel();
    }
  }

  Future<void> startTimer() async {
    if ((minutes != 0) || (seconds != 0)) {
      timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
        setState(() {
          if ((minutes > 0) || (seconds > 0)) {
            if (seconds > 0) {
              seconds--;
            }
            if ((seconds == 0) & (minutes > 0)) {
              minutes--;
              seconds = 59;
            }
          } else if ((seconds == 0) & (minutes == 0)) {
            timer.cancel();
            if (exerOrBreak == true) {
              restartTimerBreak();
            } else
              restartTimerExer();
          }
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    minController = new TextEditingController(text: '0');
    secController = new TextEditingController(text: '45');
    breakController = new TextEditingController(text: '15');
  }

  @override
  void dispose() {
    if (timer.isActive == true) {
      timer.cancel();
    }
    minController.dispose();
    secController.dispose();
    breakController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var textStyle = TextStyle(fontSize: 25, fontFamily: 'Poppins-SemiBold');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LabelText(label: 'MIN', value: minutes.toString().padLeft(2, '0')),
            SizedBox(
              width: size.width * 0.1 - 15,
            ),
            LabelText(label: 'SEC', value: seconds.toString().padLeft(2, '0')),
          ],
        ),
        SizedBox(height: size.height * 0.1 - 25),
        Container(
          width: double.infinity,
          height: size.height * 0.4 - 10,
          decoration: BoxDecoration(
            color: HexColor('#FCFEFD'),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Exercise Time",
                            style: textStyle,
                          ),
                          SizedBox(
                            height: size.height * 0.1 - 80,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: size.width * 0.2 - 10,
                                child: TextFormField(
                                  controller: minController,
                                  style: TextStyle(fontSize: 40),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    fillColor: Colors.white,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.yellow, width: 2.0),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                " : ",
                                style: TextStyle(fontSize: 30),
                              ),
                              Container(
                                width: size.width * 0.2 - 10,
                                child: TextFormField(
                                  controller: secController,
                                  style: TextStyle(fontSize: 40),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    fillColor: Colors.white,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.yellow, width: 2.0),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Break Time",
                            style: textStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: size.width * 0.2 - 10,
                                child: TextFormField(
                                  controller: breakController,
                                  style: TextStyle(fontSize: 40),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    fillColor: Colors.white,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.yellow, width: 2.0),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.1 - 10,
                ),
                ElevatedButton.icon(
                  label: Text(
                    "Let's Do It",
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                  icon: Icon(
                    Icons.hourglass_bottom_rounded,
                    size: 18,
                    color: Colors.black87,
                  ),
                  onPressed: () {
                    setState(() {
                      continueOrBreak = !continueOrBreak;
                      minutes = int.parse((minController.text));
                      seconds = int.parse((secController.text));
                    });
                    if (continueOrBreak == false) {
                      timerPaused();
                      print(continueOrBreak);
                    } else
                      startTimer();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(HexColor('#99008080')),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.white))),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 45)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LabelText extends StatelessWidget {
  LabelText({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.teal,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
                color: Colors.white, fontSize: 55, fontWeight: FontWeight.bold),
          ),
          Text(
            '$label',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
