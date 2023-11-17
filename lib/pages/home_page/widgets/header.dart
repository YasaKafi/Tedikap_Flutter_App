import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/pages/register_page/controller/register_controller.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';

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
            padding: EdgeInsets.only(left: 30, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang',
                  style: homePageStyle(
                      color: ColorResources.white,
                      weight: FontWeight.w500,
                      fontSize: 12),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                    registerController.usernameController.text,
                    style: homePageStyle(
                      color: ColorResources.white,
                      weight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(right: 30, top: 50),
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
