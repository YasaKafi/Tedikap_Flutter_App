import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';
import '../../../utils/color_resources.dart';
import '../controller/onboarding_controller.dart';

class DotIndicator extends StatelessWidget {
  final OnBoardingController controller;

  DotIndicator({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        controller.onboardingItems.length,
            (index) => Obx(() => Container(
            margin: EdgeInsets.all(4),
            width: controller.currentPage.value == index ? 11 : 11, 
            height: controller.currentPage.value == index ? 37 : 20, 
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(4),
              color: controller.currentPage.value == index
                  ? ColorResources.gold
                  : ColorResources.grey,
            ),
          ),
        ),
      ),
    );
  }
}
