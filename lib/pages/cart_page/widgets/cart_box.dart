// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/data/datasource/api_controller.dart';
import 'package:tedikap_flutter_app/data/models/cart_item_model.dart';
import 'package:tedikap_flutter_app/data/models/product_response_model.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';

class CartBox extends StatelessWidget {
  final screenHeight;

  final screenWidth;
  final ApiController controller = Get.put(ApiController());
  final Function()? onTap;
  final CartItem item;


  CartBox({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    this.onTap, required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      width: screenWidth * 0.9305,
      height: screenHeight * 0.1077,
      decoration: ShapeDecoration(
        color: Color(0xFFF7F8FB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: screenWidth * 0.1577,
                  height: screenHeight * 0.0729,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage(item.image),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(250),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x7FAEAEC0),
                        blurRadius: 20,
                        offset: Offset(10, 10),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0xFFFFFFFF),
                        blurRadius: 20,
                        offset: Offset(-10, -10),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 20,
                  ),
                  width: screenWidth * 0.38,
                  height: screenHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        item.title,
                        style: cartPageStyle(
                            color: primaryColor,
                            weight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      Text(
                        "hot | tall",
                        style: cartPageStyle(
                            color: primaryColor,
                            weight: FontWeight.w400,
                            fontSize: 12),
                      ),
                      Text(
                        "x " + item.quantity.toString(),
                        style: cartPageStyle(
                            color: primaryColor,
                            weight: FontWeight.w600,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
                Text(
                  "Rp. " + item.totalItemPrice.toString(),
                  style: cartPageStyle(
                      color: primaryColor,
                      weight: FontWeight.w600,
                      fontSize: 18),
                ),
              ],
            )
          
    );
  }
}
