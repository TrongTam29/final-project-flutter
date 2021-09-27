import 'package:http/http.dart' as http;
import 'package:my_app/model/cardio/cardio_model.dart';

import '../../constants.dart';

class CardioService {
  static var client = http.Client();

  static Future<List<Cardio>?> fetchData() async {
    var response = await client.get(Uri.parse('$baseUrl/cardio/cardios'));

    if (response.statusCode == 200) {
      var json = response.body;
      return cardioFromJson(json);
    } else {
      return null;
    }
  }
}
