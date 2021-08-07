import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:my_app/screens/list%20video/model/exercise.dart';

import 'remote_services.dart';

class ExerciseController extends GetxController {
  var isLoading = true.obs;
  var exerciseList = List<Exercise>.generate(100, (index) => Exercise()).obs;
  // List<Exercise> exerciseList = [];

  void fetchExercise(int id) async {
    try {
      isLoading(true);
      var exercises = await Services.fetchData(id);
      if (exercises != null) {
        exerciseList.value = exercises;
      }
    } finally {
      isLoading(false);
    }
  }
}
