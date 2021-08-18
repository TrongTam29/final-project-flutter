import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/model/exercise/exercise.dart';
import 'package:my_app/model/exercise/exercise_controller.dart';

class AddExercise extends StatefulWidget {
  const AddExercise();

  @override
  _AddExerciseState createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  @override
  Widget build(BuildContext context) {
    Exercise _exercise;
    ExerciseController exerciseController = Get.put(ExerciseController());
    var textStyle = TextStyle(fontSize: 18, color: Colors.black);
    TextEditingController nameController = TextEditingController();
    TextEditingController imageController = TextEditingController();
    TextEditingController linkController = TextEditingController();
    TextEditingController repController = TextEditingController();
    TextEditingController setController = TextEditingController();
    TextEditingController breakTimeController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    TextEditingController muscleGroupIDController = TextEditingController();
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          ListTile(
            leading: Text(
              'Name',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter a search term'),
                controller: nameController,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Image',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter a search term'),
                controller: imageController,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Link',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter a search term'),
                controller: linkController,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Reps',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter a search term'),
                controller: repController,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Sets',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter a search term'),
                controller: setController,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Break',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter a search term'),
                controller: breakTimeController,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Detail',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter a search term'),
                controller: detailController,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'MuscleGroup ID',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter a search term'),
                controller: muscleGroupIDController,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     final String name = nameController.text;
          //     final String image = imageController.text;
          //     final String link = linkController.text;
          //     final String rep = repController.text;
          //     final String set = setController.text;
          //     final String breakTime = breakTimeController.text;
          //     final String detail = breakTimeController.text;
          //     final int muscleId = int.parse(muscleGroupIDController.text);
          //     setState(() async {
          //       _exercise = await exerciseController.postExercise(
          //           name, link, image, rep, set, breakTime, detail, muscleId);
          //     });
          //   },
          //   child: Center(
          //     child: ListTile(
          //       leading: Center(child: Icon(Icons.done)),
          //       title: Center(child: Text('Done')),
          //     ),
          //   ),
          //   style: ButtonStyle(
          //     backgroundColor:
          //         MaterialStateProperty.all(Colors.greenAccent[300]),
          //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //         RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(20),
          //             side: BorderSide(color: Colors.white))),
          //     padding: MaterialStateProperty.all(
          //         EdgeInsets.symmetric(vertical: 15, horizontal: 45)),
          //   ),
          // ),
        ],
      )),
    );
  }
}
