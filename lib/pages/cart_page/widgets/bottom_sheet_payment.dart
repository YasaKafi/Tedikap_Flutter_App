import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/pages/cart_page/controller/cart_controller.dart';
import 'package:tedikap_flutter_app/pages/cart_page/widgets/payment_box.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';
import 'package:tedikap_flutter_app/utils/dimensions.dart';
import 'package:tedikap_flutter_app/utils/images.dart';

class BottomSheetPayment extends StatelessWidget {
  BottomSheetPayment({
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
    return InkWell(
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
          child: Padding(
            padding: const EdgeInsets.only(
                top: Dimensions.paddingSizeLarge,
                left: Dimensions.paddingSizeSmall,
                right: Dimensions.paddingSizeSmall),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        'Order Payment',
                        style: cartPageStyle(
                            color: primaryColor,
                            weight: FontWeight.w600,
                            fontSize: Dimensions.fontSizeExtraLarge),
                      ),
                      Obx(() {
                        return PaymentBox(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          image: Images.qris,
                          payment: 'Qris',
                          balance: 'Click for the code',
                          textStyle: cartPageStyle(
                              color: Colors.blue,
                              weight: FontWeight.w600,
                              fontSize: Dimensions.fontSizeDefault),
                          scale: 1.5,
                          isSelected: controller.selectedPayment.value == 0,
                          onChanged: (bool? value) {
                            controller.setSelectedPayment(0, 'Qris');
                          },
                        );
                      }),
                      Obx(() {
                        return PaymentBox(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          image: Images.gopay,
                          payment: 'Gopay',
                          balance: 'Saldo : Rp 150.000',
                          textStyle: cartPageStyle(
                              color: ColorResources.black,
                              weight: FontWeight.w500,
                              fontSize: Dimensions.fontSizeDefault),
                          scale: 0.8,
                          isSelected: controller.selectedPayment.value == 1,
                          onChanged: (bool? value) {
                            controller.setSelectedPayment(1, 'Gopay');
                          },
                        );
                      }),
                      Obx(() {
                        return PaymentBox(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          image: Images.dana,
                          payment: 'Dana',
                          balance: 'Saldo : Rp 75.000',
                          textStyle: cartPageStyle(
                              color: ColorResources.black,
                              weight: FontWeight.w500,
                              fontSize: Dimensions.fontSizeDefault),
                          scale: 0.9,
                          isSelected: controller.selectedPayment.value == 2,
                          onChanged: (bool? value) {
                            controller.setSelectedPayment(2, 'Dana');
                          },
                        );
                      }),
                      Obx(() {
                        return PaymentBox(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          image: Images.ovo,
                          payment: 'Ovo',
                          balance: 'Saldo : Rp 50.000',
                          textStyle: cartPageStyle(
                              color: ColorResources.black,
                              weight: FontWeight.w500,
                              fontSize: Dimensions.fontSizeDefault),
                          scale: 1.2,
                          isSelected: controller.selectedPayment.value == 3,
                          onChanged: (bool? value) {
                            controller.setSelectedPayment(3, 'Ovo');
                          },
                        );
                      }),
                      Obx(() {
                        return PaymentBox(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          image: Images.linkaja,
                          payment: 'Link Aja',
                          balance: 'Saldo : Rp 200.000',
                          textStyle: cartPageStyle(
                              color: ColorResources.black,
                              weight: FontWeight.w500,
                              fontSize: Dimensions.fontSizeDefault),
                          scale: 7,
                          isSelected: controller.selectedPayment.value == 4,
                          onChanged: (bool? value) {
                            controller.setSelectedPayment(4, 'Link Aja');
                          },
                        );
                      }),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: Dimensions.marginSizeLarge),
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
                                  fontSize: Dimensions.fontSizeDefault),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Rp. ' + controller.getTotalPrice().toString(),
                              style: cartPageStyle(
                                  color: primaryColor,
                                  weight: FontWeight.w600,
                                  fontSize: Dimensions.fontSizeHomeName),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Get.offNamed(Routes.PROCESSING_PAGE);
                          },
                          child: Container(
                            width: screenWidth * 0.4157,
                            height: screenHeight * 0.0581,
                            decoration: ShapeDecoration(
                              color: ColorResources.blueDark,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.card_membership_outlined,
                                    color: ColorResources.white,
                                  ),
                                  SizedBox(
                                    width: Dimensions.marginSizeLarge,
                                  ),
                                  Text(
                                    'Pay Now',
                                    style: cartPageStyle(
                                        color: ColorResources.white,
                                        weight: FontWeight.w600,
                                        fontSize: Dimensions.fontSizeLarge),
                                  )
                                ]),
                          ),
                        ),
                      ]),
                ),
              ],
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
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
    );
  }
}
