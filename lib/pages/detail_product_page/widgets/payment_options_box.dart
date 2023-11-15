import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/data/models/cart_item_model.dart';
import 'package:tedikap_flutter_app/data/models/product_response_model.dart';
import 'package:tedikap_flutter_app/pages/cart_page/controller/cart_controller.dart';
import 'package:tedikap_flutter_app/pages/detail_product_page/controller/detail_controller.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';

class PaymentOptions extends StatelessWidget {
  PaymentOptions({
    super.key,
    required this.screenWidth,
    required this.screenHeight, required this.product,
  });

  final double screenWidth;
  final double screenHeight;
  final Product product;
  final DetailProductController controller = Get.put(DetailProductController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight * 0.06284,
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
      child: Expanded(
        child: InkWell(
          onTap: () {
            return controller.addToCart(product);
          },
          child: Container(
            width: screenWidth * 0.4,
            height: screenHeight,
            decoration: BoxDecoration(
              color: Color(0xFFF0F0F3),
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(50),
                right: Radius.circular(50),
              ),
              boxShadow: [
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
                  Icons.shopping_cart_outlined,
                  color: ColorResources.greyBold,
                  size: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Add to Cart",
                  style: detailPageStyle(
                      color: ColorResources.greyBold,
                      weight: FontWeight.w600,
                      fontSize: 14),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

