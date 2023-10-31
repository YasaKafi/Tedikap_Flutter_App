import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/data/datasource/api_controller.dart';
import 'package:tedikap_flutter_app/pages/cart_page/widgets/cart_box.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';
import 'package:tedikap_flutter_app/utils/images.dart';

class CartPage extends StatelessWidget {
  final ApiController controller = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double sizeBottomCard = MediaQuery.of(context).size.height * 0.17;
    return Scaffold(
      backgroundColor: ColorResources.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Order",
          style: titleAppBarProductrStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios, color: ColorResources.black),
        ),
        backgroundColor: ColorResources.white,
        elevation: 0,
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ambil Pesananmu di',
                          style: nameProductrStyle,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10, top: 20, right: 10),
                              width: 60,
                              height: 60,
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: SvgPicture.asset(Images.splashLogo),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tedikap RUS",
                                    style: cartPageStyle(
                                        color: primaryColor,
                                        fontSize: 18,
                                        weight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "500m dari lokasimu",
                                    style: cartPageStyle(
                                        color: primaryColor,
                                        fontSize: 14,
                                        weight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    height: screenHeight * 0.0337,
                    width: screenWidth,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFDCDCDC),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: screenHeight,
                            width: screenWidth * 0.4,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.timer_rounded,
                                  size: 18,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'Estimasi ',
                                              style: cartPageStyle(
                                                  color: primaryColor,
                                                  weight: FontWeight.w400,
                                                  fontSize: 14)),
                                          TextSpan(
                                              text: '15 Menit',
                                              style: cartPageStyle(
                                                  color: primaryColor,
                                                  weight: FontWeight.w600,
                                                  fontSize: 14)),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Text(
                            'Siap diambil',
                            style: cartPageStyle(
                                color: primaryColor,
                                weight: FontWeight.w400,
                                fontSize: 12),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: ColorResources.grey,
                    thickness: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      "Detail Pesanan",
                      style: cartPageStyle(
                          color: primaryColor,
                          weight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: screenWidth,
                    height: screenHeight * 0.6,
                    child: ListView(
                      children: [
                        CartBox(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth),
                        CartBox(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth),
                        CartBox(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth),
                        CartBox(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth),
                        CartBox(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth),
                        CartBox(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth),
                        CartBox(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth),
                        CartBox(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth),
                        CartBox(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: screenHeight * 0.17,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 10,
                      offset: Offset(0, -4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: screenWidth * 0.877,
                      height: screenHeight * 0.0438,
                      margin: EdgeInsets.only(top: 20),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8, left: 8, right: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: screenWidth * 0.6,
                              height: screenHeight,
                              child: Row(
                                children: [
                                  Icon(Icons.discount),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Makin hemat pakai promo',
                                    style: cartPageStyle(
                                        color: primaryColor,
                                        weight: FontWeight.w600,
                                        fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: screenWidth * 0.877,
                      height: sizeBottomCard * 0.45,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Price',
                                  style: cartPageStyle(
                                      color: Color(0x38001733),
                                      weight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Rp. 15000',
                                  style: cartPageStyle(
                                      color: primaryColor,
                                      weight: FontWeight.w600,
                                      fontSize: 22),
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Get.bottomSheet(Container(
                                  height: screenHeight,
                                  width: screenWidth,
                                  decoration: ShapeDecoration(
                                    color: ColorResources.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(35),
                                        topRight: Radius.circular(35),
                                      ),
                                    ),
                                  ),
                                ));
                              },
                              child: Container(
                                width: screenWidth * 0.3157,
                                height: screenHeight * 0.0581,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF324A59),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.shopping_cart_sharp,
                                        color: ColorResources.white,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'Next',
                                        style: cartPageStyle(
                                            color: ColorResources.white,
                                            weight: FontWeight.w600,
                                            fontSize: 16),
                                      )
                                    ]),
                              ),
                            )
                          ]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
