import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/components/appBar.dart';

class MyWorkout extends StatelessWidget {
  const MyWorkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar_Components(
          title: 'My Workout',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            StackDay(
              size: size,
              image:
                  'https://i.pinimg.com/564x/20/46/5a/20465a2eb9d1aef97a928968ab7efa15.jpg',
              day: 'Monday',
            ),
            StackDay(
              size: size,
              image:
                  'https://i.pinimg.com/564x/20/46/5a/20465a2eb9d1aef97a928968ab7efa15.jpg',
              day: 'Tuesday',
            ),
            StackDay(
              size: size,
              image:
                  'https://i.pinimg.com/564x/20/46/5a/20465a2eb9d1aef97a928968ab7efa15.jpg',
              day: 'Wednesday',
            ),
            StackDay(
              size: size,
              image:
                  'https://i.pinimg.com/564x/20/46/5a/20465a2eb9d1aef97a928968ab7efa15.jpg',
              day: 'Thusday',
            ),
            StackDay(
              size: size,
              image:
                  'https://i.pinimg.com/564x/20/46/5a/20465a2eb9d1aef97a928968ab7efa15.jpg',
              day: 'Friday',
            ),
            StackDay(
              size: size,
              image:
                  'https://i.pinimg.com/564x/20/46/5a/20465a2eb9d1aef97a928968ab7efa15.jpg',
              day: 'Saturday',
            ),
          ],
        ),
      ),
    );
  }
}

class StackDay extends StatelessWidget {
  const StackDay({required this.size, required this.day, required this.image});

  final Size size;
  final String image;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          child: Container(
            height: size.height * 0.2 - 70,
            width: size.width * 1,
            margin: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 110,
          child: Text(
            day,
            style: TextStyle(
                fontFamily: 'Poppins-Bold',
                fontSize: 40,
                color: Colors.white54),
          ),
        ),
      ],
    );
  }
}
