import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isSnacksSeriesClicked = false.obs;
  RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
  

  void onSnacksSeriesClick() {
    isSnacksSeriesClicked.value = true;
  }
}
