import 'package:http/http.dart' as http;
import 'package:my_app/screens/list%20video/model/exercise.dart';

class Services {
  static var client = http.Client();

  static Future<List<Exercise>?> fetchData(int id) async {
    var response = await client.get(
        Uri.parse('http://192.168.1.7:3000/exercise/find-exercises?id=${id}'));

    if (response.statusCode == 200) {
      var json = response.body;
      return exerciseFromJson(json);
    } else {
      return null;
    }
  }
}
