// import 'package:http/http.dart' as http;
// import 'package:my_app/model/nutrition/nutrition.dart';

// class NutritionServices {
//   static var client = http.Client();

//   static Future<Nutrition?> fetchData(int nutritionId, String nameDay) async {
//     var response = await client.get(Uri.parse(
//         'http://192.168.1.4:3000/day/get-day-diet/$nutritionId/$nameDay'));

//     if (response.statusCode == 200) {
//       var json = response.body;
//       return nutritionFromJson(json);
//     } else {
//       return null;
//     }
//   }
// }
