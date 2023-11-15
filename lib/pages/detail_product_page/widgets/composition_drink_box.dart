import 'package:flutter/material.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';

class CompositionDrink extends StatelessWidget {
  const CompositionDrink({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight * 0.0561,
      decoration: ShapeDecoration(
        color: Color(0xFFF0F0F3),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: screenWidth * 0.38235,
              height: screenHeight * 0.04719,
              decoration: ShapeDecoration(
                color: ColorResources.gold,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: ColorResources.greySemi,
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x33AEAEC0),
                    blurRadius: 10,
                    offset: Offset(5, 5),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x66FFFFFF),
                    blurRadius: 5,
                    offset: Offset(-5, -5),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.fireplace_rounded,
                    color: ColorResources.red,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Hot",
                    style: detailPageStyle(
                        color: ColorResources.red,
                        weight: FontWeight.w600,
                        fontSize: 14),
                  )
                ],
              ),
            ),
            Container(
              width: screenWidth * 0.38235,
              height: screenHeight * 0.04719,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.ac_unit,
                    color: ColorResources.greyBold,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Iced",
                    style: detailPageStyle(
                        color: ColorResources.grey,
                        weight: FontWeight.w600,
                        fontSize: 14),
                  )
                ],
              ),
            ),
          ]),
    );
  }
}