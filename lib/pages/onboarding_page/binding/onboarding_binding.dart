import 'package:get/get.dart';
import 'package:tedikap_flutter_app/pages/onboarding_page/controller/onboarding_controller.dart';


class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingController>(() => OnBoardingController());
  }
}