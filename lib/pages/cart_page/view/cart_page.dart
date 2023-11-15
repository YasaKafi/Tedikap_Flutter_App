import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/data/datasource/api_controller.dart';
import 'package:tedikap_flutter_app/pages/cart_page/controller/cart_controller.dart';
import 'package:tedikap_flutter_app/pages/cart_page/widgets/bottom_payment_cart.dart';
import 'package:tedikap_flutter_app/pages/cart_page/widgets/bottom_sheet_payment.dart';
import 'package:tedikap_flutter_app/pages/cart_page/widgets/cart_box.dart';
import 'package:tedikap_flutter_app/pages/cart_page/widgets/payment_box.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';
import 'package:tedikap_flutter_app/utils/images.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

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
            Get.offNamed(Routes.HOME_PAGE);
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
                    height: screenHeight * 0.45,
                    child: ListView.builder(
                      itemCount: cartController.cartItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        final cartItems = cartController.cartItems[index];
                        return Dismissible(
                          background: Container(
                            width: screenWidth * 0.7,
                            color: ColorResources.red,
                            child: Icon(Icons.restore_from_trash),
                          ),
                          onDismissed: (direction) {
                            cartController.removeItem(index);
                          },
                          key: ValueKey(cartController.cartItems[index].id),
                          child: CartBox(
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              item: cartItems,
                              ),
                              confirmDismiss: (direction) async {
                            final confirmed = await cartController
                                .showDeleteConfirmationDialog(context);
                            return confirmed ??
                                false;
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            BottomPaymentCart(screenHeight: screenHeight, screenWidth: screenWidth, sizeBottomCard: sizeBottomCard)
          ],
        ),
      ),
    );
  }
}




