import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/pages/navigator_page/view/navbar.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';

class OnBoardingController extends GetxController  {
  late PageController pageController = PageController(initialPage: 0);

  var currentPage = 0.obs;

  

  void onPageChanged(int value) {
    currentPage.value = value;
  }

  void navigateToNextPage(PageController pageController) {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void navigateToStart() {
    Get.toNamed(Routes.REGISTER_PAGE);
  }
}

