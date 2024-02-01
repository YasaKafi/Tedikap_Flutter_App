import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/data/models/product_response_model.dart';
import 'package:tedikap_flutter_app/pages/detail_product_page/controller/detail_controller.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';
import 'package:tedikap_flutter_app/utils/dimensions.dart';

class IncrementPrice extends StatelessWidget {
  const IncrementPrice({
    super.key,
    required this.detailProductController,
    required this.teaSeries,
    required this.screenWidth,
    required this.screenHeight,
  });

  final DetailProductController detailProductController;
  final Product teaSeries;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            child: Row(
          children: [
            Text(
              "Rp.",
              style: detailPageStyle(
                  color: ColorResources.greyBold,
                  fontSize: Dimensions.fontSizeLarge,
                  weight: FontWeight.w400),
            ),
            SizedBox(
              height: Dimensions.marginSizeSmall,
            ),
            Obx(() {
              final totalPriceItem =
              detailProductController.totalItemPrice.value =
                  teaSeries.price! * detailProductController.quantity.value;
              return Text(
                totalPriceItem.toString(),
                style: detailPageStyle(
                  color: primaryColor,
                  fontSize: Dimensions.fontSizeExtra2Large,
                  weight: FontWeight.bold,
                ),
              );
            }),
          ],
        )),
        Container(
          width: screenWidth * 0.38235,
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              width: screenWidth * 0.1019,
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
                  child: IconButton(
                icon: Icon(
                  Icons.remove,
                  color: ColorResources.greyBold,
                  size: Dimensions.iconSizeKindDeafult,
                ),
                onPressed: () => detailProductController.decrementQuantity(),
              )),
            ),
            Obx(() {
              return Center(
                child: Text(
                  detailProductController.quantity.value.toString(),
                  style: detailPageStyle(
                      color: primaryColor,
                      fontSize: Dimensions.fontSizeLarge,
                      weight: FontWeight.bold),
                ),
              );
            }),
            Container(
              width: screenWidth * 0.1019,
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
                  child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: ColorResources.greyBold,
                        size: Dimensions.iconSizeKindDeafult,
                      ),
                      onPressed: () =>
                          detailProductController.incrementQuantity())),
            ),
          ]),
        )
      ],
    );
  }
}
