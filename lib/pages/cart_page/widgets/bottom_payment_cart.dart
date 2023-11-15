import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tedikap_flutter_app/data/models/cart_item_model.dart';
import 'package:tedikap_flutter_app/pages/cart_page/controller/cart_controller.dart';
import 'package:tedikap_flutter_app/pages/cart_page/widgets/bottom_sheet_payment.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';

class BottomPaymentCart extends StatelessWidget {
  BottomPaymentCart({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.sizeBottomCard,
  });

  final double screenHeight;
  final double screenWidth;
  final double sizeBottomCard;
  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Align(
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
                              color: ColorResources.black,
                              weight: FontWeight.w500,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Obx(() {
                          
                          return Text(
                            'Rp. ' + controller.getTotalPrice().toString(),
                            style: cartPageStyle(
                                color: primaryColor,
                                weight: FontWeight.w600,
                                fontSize: 22),
                          );
                        })
                      ],
                    ),
                    BottomSheetPayment(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        sizeBottomCard: sizeBottomCard)
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
