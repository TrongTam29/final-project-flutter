import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:my_app/model/nutrition/nutrition.dart';
import 'nutrition_service.dart';

class NutritionController extends GetxController {
  var isLoading = true.obs;
  // var nutritionList = List<Nutrition>.generate(100, (index) => Nutrition()).obs;
  final nutritionObj = Nutrition().obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<Nutrition?> fetchNutrition(int nutritionId, String nameDay) async {
    try {
      isLoading(true);
      var nutritions = await NutritionServices.fetchData(nutritionId, nameDay);
      if (nutritions != null) {
        return nutritionObj.value = nutritions;
      }
    } finally {
      isLoading(false);
    }
  }
}

// class NutritionControllerGetX extends GetxController
//     with StateMixin<Nutrition> {
//   final NutritionProvider nutritionProvider;
//   NutritionControllerGetX({required this.nutritionProvider});

//   @override
//   void onInit() {
//     findAllNutritions();
//     super.onInit();
//   }

//   void findAllNutritions() {
//     nutritionProvider.getNutrition()!.then((result) {
//       Nutrition? data = result.body;
//       change(data, status: RxStatus.success());
//     }, onError: (err) {
//       change(null, status: RxStatus.error(err.toString()));
//     });
//   }
// }
