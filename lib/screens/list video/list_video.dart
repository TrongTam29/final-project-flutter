import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_app/components/appBar.dart';
import 'package:my_app/screens/detail%20video/detail_video.dart';
import 'package:my_app/screens/list%20video/model/exercise_controller.dart';

class ListVideo extends StatefulWidget {
  const ListVideo({required this.muscleName, required this.idMuscle});

  final String muscleName;
  final int idMuscle;
  @override
  _ListVideoState createState() => _ListVideoState();
}

class _ListVideoState extends State<ListVideo> {
  final ExerciseController exerciseController = Get.put(ExerciseController());
  @override
  void initState() {
    super.initState();
    exerciseController.fetchExercise(widget.idMuscle);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar_Components(
          title: widget.muscleName,
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          if (exerciseController.isLoading.value)
            return Center(
              child: CupertinoActivityIndicator(),
            );
          else
            return Container(
              margin: EdgeInsets.only(bottom: 20),
              child: ListView.builder(
                itemCount: exerciseController.exerciseList.length,
                itemBuilder: (context, index) {
                  var item = exerciseController.exerciseList[index];
                  return Stack(
                    children: [
                      GestureDetector(
                        child: Container(
                          height: size.height * 0.3 - 40,
                          width: size.width * 1,
                          margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              item.image!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        onTap: () => Get.to(DetailVideo(
                          url: item.link!,
                          nameExercise: item.name!,
                          reps: item.reps!,
                          sets: item.sets!,
                          breaks: item.exerciseBreak.toString(),
                          detail: item.detail.toString(),
                        )),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 25,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor('#C4C4C4'),
                          ),
                          child: Text(
                            item.name!,
                            style: TextStyle(
                                fontFamily: 'Poppins-SemiBold', fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
        }),
      ),
    );
  }
}
