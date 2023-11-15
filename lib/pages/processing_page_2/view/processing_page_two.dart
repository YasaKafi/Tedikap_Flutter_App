// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/pages/processing_page/controller/processing_controller.dart';
import 'package:tedikap_flutter_app/pages/processing_page_2/controller/processing_controller_two.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';
import 'package:tedikap_flutter_app/utils/images.dart';

// ignore: must_be_immutable
class ProcessingPageTwo extends StatelessWidget {
  ProcessingPageTwo({super.key});
  ProcessingControllerTwo splashController = Get.put(ProcessingControllerTwo());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorResources.white50,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Images.checkList, // Menggunakan konstanta dari kelas Images
              width: 192.0, // Mengatur ukuran logo menjadi 192
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: screenHeight * 0.2,
              child: Column(
                children: [
                  Text(
                    'Yeayy!!',
                    style: cartPageStyle(
                        color: primaryColor,
                        weight: FontWeight.w600,
                        fontSize: 18),
                  ),Text(
                    'Your Transaction was successful',
                    style: cartPageStyle(
                        color: primaryColor,
                        weight: FontWeight.w600,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Tedikap takes your order',
                    style: cartPageStyle(
                        color: primaryColor,
                        weight: FontWeight.w400,
                        fontSize: 18),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
