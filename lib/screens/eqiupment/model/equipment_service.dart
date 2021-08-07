import 'package:http/http.dart' as http;
import 'package:my_app/screens/eqiupment/model/equipment_model.dart';

class Services {
  static var client = http.Client();

  static Future<List<Equipment>?> fetchData() async {
    var response = await client.get(Uri.parse(
        'http://192.168.1.7:3000/workout-equipment/workout-equipment'));

    if (response.statusCode == 200) {
      var json = response.body;
      return equipmentFromJson(json);
    } else {
      return null;
    }
  }
}
