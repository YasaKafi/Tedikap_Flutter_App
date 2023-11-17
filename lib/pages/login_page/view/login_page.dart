// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';

import '../../../utils/custom_themes.dart';
import '../widgets/form_login.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorResources.yellow,
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: primaryTextColorWhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: forgotTextStyleB,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.REGISTER_PAGE);
                      },
                      child: Text(
                        'SIGN UP',
                        style: buttonTextGoogleB,
                      ),
                    ),
                  ],
                ),
              ),
            ),
              Positioned(
                top: -screenHeight * 0.0416,
                left: -screenWidth * 0.3276,
                child: Container(
                  // ignore: sort_child_properties_last
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.3638, top: screenHeight * 0.2023),
                    child: Text(
                      'Welcome\nBack',
                      style: loginHeaderTextStyle,
                    ),
                  ),
                  width: screenWidth * 1.2491,
                  height: screenHeight * 0.4717,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                top: -screenHeight * 0.0562,
                right: -screenWidth * 0.5829,
                child: Container(
                  width: screenWidth * 1.1114,
                  height: screenHeight * 0.4487,
                  decoration: const ShapeDecoration(
                    color: ColorResources.yellow,
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.4487,
                child: SingleChildScrollView(
                  child: FormLogin(formKey: _formKey,
                      ),
                ),
              ),
              Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: primaryTextColorWhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: forgotTextStyleB,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.REGISTER_PAGE);
                      },
                      child: Text(
                        'SIGN UP',
                        style: buttonTextGoogleB,
                      ),
                    ),
                  ],
                ),
              ),
            ),
              
            ],
          ),
        ),
      ),
    );
  }
}
