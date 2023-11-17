// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/data/models/cart_item_model.dart';
import 'package:tedikap_flutter_app/data/models/history_item_model.dart';
import 'package:tedikap_flutter_app/pages/cart_page/controller/cart_controller.dart';
import 'package:tedikap_flutter_app/pages/history_page/controller/history_controller.dart';
import 'package:tedikap_flutter_app/pages/struck_page/controller/struck_controller.dart';
import 'package:tedikap_flutter_app/pages/struck_page/widgets/product_order.dart';
import 'package:tedikap_flutter_app/pages/struck_page/widgets/text_receipt_order.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';
import 'package:tedikap_flutter_app/utils/images.dart';

class StruckPage extends StatelessWidget {
  StruckPage({Key? key}) : super(key: key);
  final CartController cartController = Get.put(CartController());
  final StruckController controller = Get.put(StruckController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Receipt Order',
                    style: cartPageStyle(
                        color: primaryColor,
                        weight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.6717,
                  padding: const EdgeInsets.only(
                      top: 45, bottom: 24, left: 20, right: 20),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Color(0xFFEFEBE9)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Text(
                                'Thank You!',
                                style: strukPageStyle(
                                    color: primaryColor,
                                    weight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Your transaction was successful',
                                style: strukPageStyle(
                                    color: primaryColor,
                                    weight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextReceiptOrder(
                          textL: 'ID Transaction',
                          textR: controller.uniqueTransactionCode.value,
                          styleL: strukPageStyle(
                              color: primaryColor,
                              weight: FontWeight.w500,
                              fontSize: 16),
                          styleR: strukPageStyle(
                              color: primaryColor,
                              weight: FontWeight.w400,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextReceiptOrder(
                          textL: 'Date',
                          textR: controller.currentDate.value,
                          styleL: strukPageStyle(
                              color: primaryColor,
                              weight: FontWeight.w500,
                              fontSize: 16),
                          styleR: strukPageStyle(
                              color: primaryColor,
                              weight: FontWeight.w400,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextReceiptOrder(
                          textL: 'Time',
                          textR: controller.currentTime.value,
                          styleL: strukPageStyle(
                              color: primaryColor,
                              weight: FontWeight.w500,
                              fontSize: 16),
                          styleR: strukPageStyle(
                              color: primaryColor,
                              weight: FontWeight.w400,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: ColorResources.greySemi,
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Item',
                              style: strukPageStyle(
                                  color: primaryColor,
                                  weight: FontWeight.w500,
                                  fontSize: 16),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                height: screenHeight * 0.2,
                                width: screenWidth,
                                child: ListView.builder(
                                  itemCount: cartController.cartItems.length,
                                  itemBuilder: (context, index) {
                                    final cartItem =
                                        cartController.cartItems[index];
                                    return ProductOrder(
                                      title: cartItem.title,
                                      quantity: cartItem.quantity,
                                    );
                                  },
                                ))
                                ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Payment Summary',
                              style: strukPageStyle(
                                  color: primaryColor,
                                  weight: FontWeight.w500,
                                  fontSize: 16),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        TextReceiptOrder(
                          textL: 'Price',
                          textR: 'Rp. ' +
                              cartController.getTotalPrice().toString(),
                          styleL: strukPageStyle(
                              color: primaryColor,
                              weight: FontWeight.w400,
                              fontSize: 16),
                          styleR: strukPageStyle(
                              color: primaryColor,
                              weight: FontWeight.w400,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextReceiptOrder(
                          textL: 'Voucher',
                          textR: '0',
                          styleL: strukPageStyle(
                              color: primaryColor,
                              weight: FontWeight.w400,
                              fontSize: 16),
                          styleR: strukPageStyle(
                              color: primaryColor,
                              weight: FontWeight.w400,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextReceiptOrder(
                          textL: 'Total',
                          textR: 'Rp. ' +
                              cartController.getTotalPrice().toString(),
                          styleL: strukPageStyle(
                              color: primaryColor,
                              weight: FontWeight.w500,
                              fontSize: 16),
                          styleR: strukPageStyle(
                              color: primaryColor,
                              weight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextReceiptOrder(
                          textL: 'Payment Method',
                          textR: cartController.selectedPaymentName.value,
                          styleL: strukPageStyle(
                              color: primaryColor,
                              weight: FontWeight.w500,
                              fontSize: 16),
                          styleR: strukPageStyle(
                              color: primaryColor,
                              weight: FontWeight.w400,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextReceiptOrder(
                          textL: 'Schedule Pick Up',
                          textR: '05.15 PM',
                          styleL: strukPageStyle(
                              color: primaryColor,
                              weight: FontWeight.w500,
                              fontSize: 16),
                          styleR: strukPageStyle(
                              color: primaryColor,
                              weight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    List<CartItem> allCartItems =
                        cartController.cartItems.toList();
                    controller.createStruck(
                        allCartItems,
                        controller.currentTime.value,
                        controller.currentDate.value);
                        cartController.cartItems.clear();
                    Get.offNamed(Routes.BOTTOM_NAVBAR);
                  },
                  child: Container(
                    width: screenWidth * 0.3852,
                    height: screenHeight * 0.0539,
                    margin: EdgeInsets.only(bottom: screenHeight * 0.0449),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    decoration: ShapeDecoration(
                      color: ColorResources.blueDark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: Text(
                              'Back Home',
                              textAlign: TextAlign.center,
                              style: strukPageStyle(
                                  color: Colors.white,
                                  weight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.0899),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                      Images.check,
                      width: 90,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
