// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';

import '../../../utils/custom_themes.dart';
import '../widgets/form_register.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryTextColorWhite,
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
                  color: ColorResources.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: forgotTextStyle,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.LOGIN_PAGE);
                        },
                        child: Text(
                          'SIGN IN',
                          style: buttonTextGoogle,
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 150, top: 180),
                    child: Text(
                      'Create\nAccount',
                      style: loginHeaderTextStyle,
                    ),
                  ),
                  width: screenWidth * 1.2491,
                  height: screenHeight * 0.4717,
                ),
              ),
              Positioned(
                top: -screenHeight * 0.0786,
                right: -screenWidth * 0.4370,
                child: Container(
                  width: screenWidth * 0.8703,
                  height: screenHeight * 0.3368,
                  decoration: const ShapeDecoration(
                    color: ColorResources.yellow,
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.3255,
                child: FormRegister(
                  formKey: _formKey,
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
