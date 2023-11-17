import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';
import 'package:tedikap_flutter_app/utils/images.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: screenHeight * 0.035),
      width: screenWidth,
      height: screenHeight,
      color: Colors.white,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromRGBO(232, 232, 232, 100), width: 2),
                  color: Color.fromRGBO(246, 246, 246, 100),
                  borderRadius: BorderRadius.circular(35)),
              width: screenWidth * 0.9,
              height: screenHeight * 0.045,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('What would you like to drink today?', style: searchPageStyle(color: ColorResources.greyBold, weight: FontWeight.w500, fontSize: 14),),
                SvgPicture.asset(Images.search, color: ColorResources.greyBold,)
              ]),
            ),
            
          ]),
    );
  }
}