// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/pages/processing_page/controller/processing_controller.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/images.dart';

class ProcessingPage extends StatelessWidget {
  ProcessingPage({super.key});
  ProcessingController splashController = Get.put(ProcessingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.white50,
      body: Center(
        child: Image.asset(
          Images.loadingCup, // Menggunakan konstanta dari kelas Images
          width: 192.0, // Mengatur ukuran logo menjadi 192
        ),
      ),
    );
  }
}
