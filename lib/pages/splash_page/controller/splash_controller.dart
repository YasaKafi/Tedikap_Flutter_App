import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() async {
    await Future.delayed(Duration(seconds: 4));
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn');

    if (isLoggedIn != null && isLoggedIn) {
      Get.toNamed(Routes.BOTTOM_NAVBAR);
    } else {

      Get.toNamed(Routes.LOGIN_PAGE);
    }
  }
}