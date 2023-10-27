import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tedikap_flutter_app/pages/onboarding_page/view/onboarding_page.dart';
import 'dart:async';
import '../../../utils/color_resources.dart';
import '../../../utils/images.dart';
import '../../../routes/AppPages.dart';


class SplashPage extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Get.offNamed(Routes.ONBOARDING_PAGE);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.getImageBg(context),
      body: Center(
        child: SvgPicture.asset(
          Images.splashLogo, // Menggunakan konstanta dari kelas Images
          width: 192.0, // Mengatur ukuran logo menjadi 192
        ),
      ),
    );
  }
}
