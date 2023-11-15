import 'package:get/get.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';

class ProcessingControllerTwo extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() async {
    await Future.delayed(Duration(seconds: 4));
    Get.offNamed(Routes.STRUCK_PAGE);
  }
}
