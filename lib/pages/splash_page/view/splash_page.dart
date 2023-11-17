// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/pages/splash_page/controller/splash_controller.dart';

import '../../../utils/color_resources.dart';
import '../../../utils/images.dart';

// ignore: must_be_immutable
class SplashPage extends StatelessWidget {
  SplashPage({super.key});
  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.white,
      body: Center(
        child: SvgPicture.asset(
          Images.splashLogo, 
          width: 192.0, 
        ),
      ),
    );
  }
}
