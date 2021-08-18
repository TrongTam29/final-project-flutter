import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_app/model/exercise/exercise_controller.dart';
import 'package:my_app/screens/detail%20video/detail_video.dart';

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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.chevron_left_outlined),
            onPressed: () {},
            tooltip: 'Back',
            iconSize: 30,
          ),
          title: Padding(
            padding: EdgeInsets.only(top: 0),
            child: Text(
              widget.muscleName,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                fontFamily: 'AdventPro',
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                  child: Text(
                    'New',
                    style: TextStyle(fontSize: 16),
                  ),
                  icon: Icon(Icons.visibility_off)),
              Tab(
                  child: Text(
                    'Watched',
                    style: TextStyle(fontSize: 16),
                  ),
                  icon: Icon(Icons.visibility)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            tabComponent(size),
            tabComponent(size),
          ],
        ),
      ),
    );
  }

  SafeArea tabComponent(Size size) {
    return SafeArea(
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
                        height: size.height * 0.2 - 40,
                        width: size.width * 1,
                        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            item.image!,
                            fit: BoxFit.fitWidth,
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
                          color: Colors.blueGrey[100],
                        ),
                        child: Text(
                          item.name!,
                          style: TextStyle(
                              fontFamily: 'Poppins-SemiBold',
                              fontSize: 16,
                              color: Colors.black87),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
      }),
    );
  }
}
