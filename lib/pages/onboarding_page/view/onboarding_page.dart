import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/utils/images.dart';
import '../../../utils/color_resources.dart';
import '../../../utils/custom_themes.dart';
import '../../../utils/dimensions.dart';
import '../controller/onboarding_controller.dart';
import 'dotindicator_widget.dart';
import 'onboardingitem_widget.dart';


class OnBoarding extends GetView<OnBoardingController> {
  @override
  Widget build(BuildContext context) {
    OnBoardingController controller = Get.find<OnBoardingController>();
    List<OnboardingItem> onboardingItems = controller.onboardingItems;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.onboardingItems.length,
                onPageChanged: (index) {
                  controller.currentPage.value = index;
                },
                itemBuilder: (context, index) {
                  return OnboardingItemWidget(
                    item: controller.onboardingItems[index],
                    controller: controller,
                  );
                },
              ),
            ),
            DotIndicator(controller: controller),
          ],
        ),
      ),
    );
  }
}



