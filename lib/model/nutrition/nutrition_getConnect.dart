import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:my_app/model/nutrition/nutrition.dart';

class NutritionProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    // httpClient.defaultDecoder = Nutrition.listFromJson;
  }

  Future<Response<Nutrition>>? getNutrition() =>
      get('http://192.168.1.4:3000/day/get-day-diet/1/MonDay');
}
