import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            (index) => Obx(
              () => Container(
            margin: EdgeInsets.all(4),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: controller.currentPage.value == index
                  ? ColorResources.primaryColor
                  : ColorResources.grey,
            ),
          ),
        ),
      ),
    );
  }
}
