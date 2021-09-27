import 'package:get/get.dart';
import 'package:my_app/model/userWorkout/userWorkout_model.dart';
import 'package:my_app/model/userWorkout/userWorkout_service.dart';

class UserWorkoutController extends GetxController {
  var isLoading = true.obs;
  // var cardioList = List<UserWorkout>.generate(100, (index) => UserWorkout()).obs;
  Rx<UserWorkout> userWorkoutObj = UserWorkout().obs;

  @override
  void onInit() {
    super.onInit();
  }

  void fetchWorkout(int id) async {
    try {
      isLoading(true);
      var userWorkout = await UserWorkoutService.fetchData(id);
      if (userWorkout != null) {
        userWorkoutObj.value = userWorkout;
      }
    } finally {
      isLoading(false);
    }
  }

  Future<String?> findWorkout(int userId) async {
    var userWorkout = await UserWorkoutService.checkUserWorkout(userId);
    return userWorkout;
  }

  void createUserWorkout(int userId) {
    UserWorkoutService.createUserWorkout(userId);
  }

  void updateWorkout(int userId, List monday, List tuesday, List wednesday,
      List thursday, List friday, List saturday) {
    UserWorkoutService.updateWorkout(
        userId, monday, tuesday, wednesday, thursday, friday, saturday);
  }

  void updateMonday(int userId, List monday) {
    UserWorkoutService.updateMonday(userId, monday);
  }

  void updateTuesday(int userId, List tuesday) {
    UserWorkoutService.updateTuesday(userId, tuesday);
  }

  void updateWednesday(int userId, List wednesday) {
    UserWorkoutService.updateWednesday(userId, wednesday);
  }

  void updateThursday(int userId, List thursday) {
    UserWorkoutService.updateThursday(userId, thursday);
  }

  void updateFriday(int userId, List friday) {
    UserWorkoutService.updateFriday(userId, friday);
  }

  void updateSaturday(int userId, List saturday) {
    UserWorkoutService.updateSaturday(userId, saturday);
  }
}
