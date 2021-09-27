import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/components/appBar.dart';
import 'package:my_app/model/user/user_controller.dart';
import 'package:my_app/model/userWorkout/userWorkout_controller.dart';
import 'package:my_app/screens/my%20workouts/components/my_workout_detail.dart';

class MyWorkout extends StatefulWidget {
  const MyWorkout({Key? key}) : super(key: key);

  @override
  _MyWorkoutState createState() => _MyWorkoutState();
}

class _MyWorkoutState extends State<MyWorkout> {
  UserWorkoutController workoutController = Get.put(UserWorkoutController());
  UserController userController = Get.put(UserController());
  User? user = FirebaseAuth.instance.currentUser;

  var mondayList;
  var tuesdayList;
  var wednesdayList;
  var thursdayList;
  var fridayList;
  var saturdayList;
  late int userId;

  @override
  void initState() {
    super.initState();
    takeUserId();
  }

  void takeUserId() {
    userController.findUser(user!.email!).then((result) {
      workoutController.fetchWorkout(result!.id!);
      setState(() {
        userId = result.id!;
      });
    });
  }

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
      body: Obx(() {
        if (workoutController.isLoading.value)
          return Center(
            child: CupertinoActivityIndicator(),
          );
        else
          return SafeArea(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => {
                    mondayList = workoutController.userWorkoutObj.value.monday,
                    Get.to(
                        () => MyWorkoutDetail(
                              listWorkout: mondayList,
                              workoutDay: 'Monday',
                            ),
                        arguments: userId),
                  },
                  child: StackDay(
                    size: size,
                    image:
                        'https://i.pinimg.com/564x/20/46/5a/20465a2eb9d1aef97a928968ab7efa15.jpg',
                    day: 'Monday',
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    tuesdayList =
                        workoutController.userWorkoutObj.value.tuesday,
                    Get.to(
                        () => MyWorkoutDetail(
                              listWorkout: tuesdayList,
                              workoutDay: 'Tuesday',
                            ),
                        arguments: userId),
                  },
                  child: StackDay(
                    size: size,
                    image:
                        'https://i.pinimg.com/564x/20/46/5a/20465a2eb9d1aef97a928968ab7efa15.jpg',
                    day: 'Tuesday',
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    wednesdayList =
                        workoutController.userWorkoutObj.value.wednesday,
                    Get.to(
                        () => MyWorkoutDetail(
                              listWorkout: wednesdayList,
                              workoutDay: 'Wednesday',
                            ),
                        arguments: userId),
                  },
                  child: StackDay(
                    size: size,
                    image:
                        'https://i.pinimg.com/564x/20/46/5a/20465a2eb9d1aef97a928968ab7efa15.jpg',
                    day: 'Wednesday',
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    thursdayList =
                        workoutController.userWorkoutObj.value.thursday,
                    Get.to(
                        () => MyWorkoutDetail(
                              listWorkout: thursdayList,
                              workoutDay: 'Thursday',
                            ),
                        arguments: userId),
                  },
                  child: StackDay(
                    size: size,
                    image:
                        'https://i.pinimg.com/564x/20/46/5a/20465a2eb9d1aef97a928968ab7efa15.jpg',
                    day: 'Thursday',
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    fridayList = workoutController.userWorkoutObj.value.friday,
                    Get.to(
                        () => MyWorkoutDetail(
                              listWorkout: fridayList,
                              workoutDay: 'Friday',
                            ),
                        arguments: userId),
                  },
                  child: StackDay(
                    size: size,
                    image:
                        'https://i.pinimg.com/564x/20/46/5a/20465a2eb9d1aef97a928968ab7efa15.jpg',
                    day: 'Friday',
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    saturdayList =
                        workoutController.userWorkoutObj.value.saturday;
                    await Get.to(
                        () => MyWorkoutDetail(
                              listWorkout: saturdayList,
                              workoutDay: 'Saturday',
                            ),
                        arguments: userId);
                  },
                  child: StackDay(
                    size: size,
                    image:
                        'https://i.pinimg.com/564x/20/46/5a/20465a2eb9d1aef97a928968ab7efa15.jpg',
                    day: 'Saturday',
                  ),
                ),
              ],
            ),
          );
      }),
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
