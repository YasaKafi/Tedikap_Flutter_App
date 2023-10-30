import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import '../../../utils/custom_themes.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';
import '../controller/onboarding_controller.dart';
import 'dotindicator_widget.dart';

class OnboardingItemWidget extends StatelessWidget {
  final OnboardingItem item;
  final OnBoardingController controller;

  OnboardingItemWidget({required this.item, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSizeDefault), // Add padding around the entire content.
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeExtraSmall),
                child: Text(
                  "Tedikap",
                  style: onboardingBrandTextStyle,
                ),
              ),
              SvgPicture.asset(Images.splashLogo, height: Dimensions.iconSizeExtraSmall),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: Dimensions.paddingSizeLarge),
            child: SvgPicture.asset(item.image, width: 300, height: 300,),
          ),
          SizedBox(height: Dimensions.paddingSizeThirtyFive),
          Text(
            item.title,
            style: onboardingHeaderTextStyle,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.only(top: Dimensions.paddingSizeDefault),
            child: Text(
              item.subtitle,
              textAlign: TextAlign.center,
              style: onboardingSubHeaderTextStyle,
            ),
          ),
           SizedBox(height: Dimensions.paddingSizeDefault),
           DotIndicator(controller: controller),
           SizedBox(
            width: 300,
             child: Padding(
             padding: EdgeInsets.only(top: Dimensions.paddingSizeExtraLarge),
             child: ElevatedButton(
             onPressed: () {
            if (controller.currentPage.value == controller.onboardingItems.length - 1) {
              Get.offNamed(Routes.LOGIN_PAGE);
            } else {
              controller.pageController.nextPage(
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            }
          },
          
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 20, vertical: 15), ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            elevation: MaterialStateProperty.all<double>(10.0),
            backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
          ),
             child: Text('Continue', style: onboardingButtonTextStyle,),
        ),
      ),
    ),
        ],
      ),
    );
  }
}
