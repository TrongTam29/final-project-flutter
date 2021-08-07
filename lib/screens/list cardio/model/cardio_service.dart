import 'package:http/http.dart' as http;
import 'package:my_app/screens/list%20cardio/model/cardio_model.dart';

class CardioService {
  static var client = http.Client();

  static Future<List<Cardio>?> fetchData() async {
    var response =
        await client.get(Uri.parse('http://192.168.1.7:3000/cardio/cardios'));

    if (response.statusCode == 200) {
      var json = response.body;
      return cardioFromJson(json);
    } else {
      return null;
    }
  }
}
