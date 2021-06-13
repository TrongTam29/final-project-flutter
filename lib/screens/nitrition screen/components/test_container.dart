import 'package:flutter/material.dart';

import '../../../constants.dart';

class TestContainer extends StatelessWidget {
  const TestContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var textStyle = TextStyle(
        fontSize: 20,
        fontFamily: 'Poppins-Light',
        fontWeight: FontWeight.w400,
        color: Colors.black);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 20),
          width: size.width * 0.9,
          height: size.height * 0.5,
          color: kBMI_Caculator,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    color: Colors.white,
                    child: Text(
                      'Male',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    color: Colors.white,
                    child: Text(
                      'Female',
                    ),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     Text(
              //       'Age: ',
              //       style: textStyle,
              //     ),
              //     SizedBox(
              //       width: 100,
              //       child: TextField(
              //         style: TextStyle(),
              //         decoration: InputDecoration(
              //           enabledBorder: UnderlineInputBorder(
              //             borderSide: BorderSide(color: Colors.white),
              //           ),
              //         ),
              //         textAlign: TextAlign.center,
              //         maxLines: 1,
              //       ),
              //     ),
              //     Text(
              //       'years',
              //       style: textStyle,
              //     ),
              //   ],
              // )
              Column(
                children: [
                  Container(
                    child: RichText(
                      text: TextSpan(
                        text: 'Age: \nHigh: \nWeight: \nActive:',
                        style: textStyle,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
