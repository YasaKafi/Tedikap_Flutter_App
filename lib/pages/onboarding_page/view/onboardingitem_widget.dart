import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/custom_themes.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';
import '../controller/onboarding_controller.dart';


class OnboardingItemWidget extends StatelessWidget {
  final OnboardingItem item;
  final OnBoardingController controller;

  OnboardingItemWidget({required this.item, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                style: titilliumBold,
              ),
            ),
            SvgPicture.asset(Images.splashLogo, height: Dimensions.iconSizeExtraSmall),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: Dimensions.paddingSizeLarge),
          child: SvgPicture.asset(item.image, width: 253, height: 237),
        ),
        SizedBox(height: Dimensions.paddingSizeThirtyFive),
        Text(
          item.title,
          style: titilliumBold,
        ),
        Padding(
          padding: EdgeInsets.only(top: Dimensions.paddingSizeDefault),
          child: Text(
            item.subtitle,
            textAlign: TextAlign.center,
            style: titleRegular.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
