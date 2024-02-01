import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/pages/register_page/controller/register_controller.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';
import 'package:tedikap_flutter_app/utils/dimensions.dart';

class HeaderHomeWidget extends StatelessWidget {
  HeaderHomeWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;
  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight * 0.18,
      decoration: BoxDecoration(
        color: ColorResources.gold,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: Dimensions.paddingSizeThirty, top: Dimensions.paddingSizeOverLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang',
                  style: homePageStyle(
                      color: ColorResources.white,
                      weight: FontWeight.w500,
                      fontSize: Dimensions.fontSizeSmall),
                ),
                
                Text(
                    'Yasa Kafi',
                    style: homePageStyle(
                      color: ColorResources.white,
                      weight: FontWeight.w500,
                      fontSize: Dimensions.fontSizeExtraLarge,
                    ),
                  ),
                
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(right: Dimensions.marginSizeSuperLarge, top: Dimensions.marginSizeExtraLargeX2),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: ColorResources.black30, shape: BoxShape.circle),
              child: Center(
                  child: InkWell(
                onTap: () => Get.toNamed(Routes.CART_PAGE),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: ColorResources.white,
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}
