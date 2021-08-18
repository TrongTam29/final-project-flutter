import 'package:http/http.dart' as http;
import 'package:my_app/model/exercise/exercise.dart';

class Services {
  static var client = http.Client();

  static Future<List<Exercise>?> fetchData(int id) async {
    var response = await client.get(
        Uri.parse('http://192.168.1.4:3000/exercise/find-exercises?id=${id}'));

    if (response.statusCode == 200) {
      var json = response.body;
      return exerciseFromJson(json);
    } else {
      return null;
    }
  }

  static Future<Exercise?> postExercise(
      String name,
      String link,
      String image,
      String reps,
      String sets,
      String exerciseBreak,
      String detail,
      int muscleGroupId) async {
    var response = await client.post(
        Uri.parse('http://192.168.1.4:3000/exercise/create-exercise'),
        body: {
          "name": name,
          "link": link,
          "image": image,
          "reps": reps,
          "sets": sets,
          "break": exerciseBreak,
          "detail": detail,
          "muscleGroupId": muscleGroupId,
        });
    if (response.statusCode == 201) {
      var json = response.body;
      return exerciseModelFromJson(json);
    }
  }
}
