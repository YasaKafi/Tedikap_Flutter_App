import 'package:flutter/material.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';

class SizeDrink extends StatelessWidget {
  const SizeDrink({
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: screenWidth * 0.179,
              height: screenHeight * 0.04719,
              child: Center(
                child: Text(
                  "Short",
                  style: detailPageStyle(
                      color: ColorResources.greyBold,
                      weight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
            ),
            Container(
              width: screenWidth * 0.179,
              height: screenHeight * 0.04719,
              decoration: ShapeDecoration(
                color: Color(0xFFF0F0F3),
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
              child: Center(
                child: Text(
                  "Tall",
                  style: detailPageStyle(
                      color: Colors.blueAccent,
                      weight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
            ),
            Container(
              width: screenWidth * 0.179,
              height: screenHeight * 0.04719,
              child: Center(
                child: Text(
                  "Grande",
                  style: detailPageStyle(
                      color: ColorResources.greyBold,
                      weight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
            ),
            Container(
              width: screenWidth * 0.179,
              height: screenHeight * 0.04719,
              child: Center(
                child: Text(
                  "Venti",
                  style: detailPageStyle(
                      color: ColorResources.greyBold,
                      weight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
            ),
          ]),
    );
  }
}
