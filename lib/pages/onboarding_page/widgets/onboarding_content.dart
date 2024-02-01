import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';
import 'package:tedikap_flutter_app/utils/dimensions.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 170,
        ),
        SvgPicture.asset(
          image,
          height: 220,
          width: 280,
        ),
        const SizedBox(height: Dimensions.marginSizeOnboardLarge),
        SizedBox(
          width: 260,
          child: Text(title,
              textAlign: TextAlign.center, style: onboardingHeaderTextStyle),
        ),
        Padding(
          padding: const EdgeInsets.only(top: Dimensions.marginSizeDefault),
          child: SizedBox(
            width: 300,
            child: Text(description,
                textAlign: TextAlign.center,
                style: onboardingSubHeaderTextStyle),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}