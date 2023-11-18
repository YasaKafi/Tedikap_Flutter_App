import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/pages/search_page/controller/search_controller.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';
import 'package:tedikap_flutter_app/utils/images.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.controller,
  });

  final double screenHeight;
  final double screenWidth;
  final TextEditingController controller;
  final MySearchController searchController = Get.put(MySearchController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: screenHeight * 0.035),
      width: screenWidth,
      height: screenHeight,
      color: Colors.white,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromRGBO(232, 232, 232, 100), width: 2),
                  color: Color.fromRGBO(246, 246, 246, 100),
                  borderRadius: BorderRadius.circular(35)),
              width: screenWidth * 0.9,
              height: screenHeight * 0.045,
              child: TextField(
                
                controller: searchController.searchController,
                onChanged: (value) {
                  // Perbarui status pencarian saat teks berubah
                  searchController.isSearch.value = value.isNotEmpty;
                },
                decoration: InputDecoration(
                    focusColor: Color.fromRGBO(246, 246, 246, 100),
                    fillColor: Color.fromRGBO(246, 246, 246, 100),
                    hintText: 'What would you like to drink today?',
                    hintStyle: searchPageStyle(
                        color: ColorResources.greyBold,
                        weight: FontWeight.w500,
                        fontSize: 14)),
                style: searchPageStyle(
                    color: ColorResources.black,
                    weight: FontWeight.w500,
                    fontSize: 14),
              ),
            ),
          ]),
    );
  }
}
