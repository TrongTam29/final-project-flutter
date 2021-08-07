import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:my_app/screens/list%20cardio/model/cardio_model.dart';
import 'package:my_app/screens/list%20cardio/model/cardio_service.dart';

class CardioController extends GetxController {
  var isLoading = true.obs;
  var cardioList = List<Cardio>.generate(100, (index) => Cardio()).obs;
  // List<Exercise> exerciseList = [];

  @override
  void onInit() {
    super.onInit();
    fetchCardio();
  }

  void fetchCardio() async {
    try {
      isLoading(true);
      var cardios = await CardioService.fetchData();
      if (cardios != null) {
        cardioList.value = cardios;
      }
    } finally {
      isLoading(false);
    }
  }
}
