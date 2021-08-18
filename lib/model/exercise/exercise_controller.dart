import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:my_app/model/exercise/exercise.dart';

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

  postExercise(String name, String link, String image, String reps, String sets,
      String exerciseBreak, String detail, int muscleGroupId) async {
    var exercises = await Services.postExercise(
        name, link, image, reps, sets, exerciseBreak, detail, muscleGroupId);
  }
}
