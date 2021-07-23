import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Tusesday extends StatelessWidget {
  const Tusesday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Center(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 35),
            height: size.height * 0.8 - 40,
            width: size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: size.width * 0.7 + 25,
                      height: size.height * 0.1 - 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: HexColor('#E68F839C'),
                      ),
                      child: Center(
                        child: Text(
                          'Tusesday',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: 'Poppins-Bold'),
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          width: size.width * 0.7 + 25,
                          height: size.height * 0.2 + 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              border: Border.all(color: HexColor('#E68F839C'))),
                          child: Column(
                            children: [
                              MuscleGroup(
                                image: 'assets/images/leg_schedule.jpg',
                                muscle: 'Leg',
                              ),
                              MuscleGroup(
                                image: 'assets/images/abs_schedule.jpg',
                                muscle: 'Abs',
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 1.5,
                          right: 1.5,
                          left: 1.5,
                          child: Container(
                            decoration: BoxDecoration(
                                color: HexColor('#CC8F839C'),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 20),
                              child: Text(
                                "Beginner",
                                style: TextStyle(
                                    fontFamily: 'Poppins-SemiBold',
                                    fontSize: 18,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          width: size.width * 0.7 + 25,
                          height: size.height * 0.3 + 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              border: Border.all(color: HexColor('#E68F839C'))),
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.1 - 40,
                              ),
                              MuscleGroup(
                                image: 'assets/images/back_schedule.jpg',
                                muscle: 'Back',
                              ),
                              MuscleGroup(
                                image: 'assets/images/biceps_schedule.jpg',
                                muscle: 'Biceps',
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 1.5,
                          right: 1.5,
                          left: 1.5,
                          child: Container(
                            decoration: BoxDecoration(
                                color: HexColor('#CC8F839C'),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 20),
                              child: Text(
                                "Advance",
                                style: TextStyle(
                                    fontFamily: 'Poppins-SemiBold',
                                    fontSize: 18,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MuscleGroup extends StatelessWidget {
  const MuscleGroup({required this.image, required this.muscle});

  final String image;
  final String muscle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        Image.asset(
          image,
          width: 80,
          height: 80,
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
            child: Text(
              muscle,
              style: TextStyle(fontFamily: 'Poppins-SemiBold', fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
