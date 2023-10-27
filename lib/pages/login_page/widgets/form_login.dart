import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';

import '../../../utils/custom_themes.dart';
import '../../register_page/view/register_page.dart';

import '../controller/login_controller.dart';
import 'text_field.dart';

class FormLogin extends GetView<LoginController> {
  FormLogin({
    super.key,
    // required this.loginController,

    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  // final LoginController controller = Get.put(LoginController());

  // final LoginController loginController;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth,
      height: screenHeight,
      color: ColorResources.yellow,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.0224,
                  left: screenWidth * 0.0485,
                  right: screenWidth * 0.0485),
              child: myTextField(
                controller: controller.emailController,
                hint: 'Email',
                keyboardInput: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.0124,
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.0224,
                    left: screenWidth * 0.0485,
                    right: screenWidth * 0.0485),
                child: InputTextFormPassword(
                  hint: 'Password',
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.0224,
                    left: screenWidth * 0.0485,
                    right: screenWidth * 0.0485),
                child: Text(
                  'Forgot Password?',
                  style: forgotTextStyle,
                )),
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.0224,
                left: screenWidth * 0.0485,
                right: screenWidth * 0.0485,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: screenHeight * 0.0618,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.signIn();
                    }
                  },
                  // ignore: sort_child_properties_last
                  child: Text(
                    'SIGN IN',
                    style: buttonTextStyle,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.0224,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.0224,
                  left: screenWidth * 0.0485,
                  right: screenWidth * 0.0485),
              child: Row(
                children: [
                  const Expanded(
                      child: Divider(
                    color: primaryColor,
                    thickness: 2,
                    height: 1,
                  )),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.0194),
                    child: Center(
                      child: Text(
                        'or SignUp with',
                        style: orSignUpWith,
                      ),
                    ),
                  ),
                  const Expanded(
                      child: Divider(
                    color: primaryColor,
                    height: 1,
                    thickness: 2,
                  )),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.0124),
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.0224,
                  left: screenWidth * 0.0485,
                  right: screenWidth * 0.0485),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: screenHeight * 0.0518,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorResources.yellow,
                        border: Border.all(
                          color: primaryColor,
                          width: 2.0,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        onPressed: () async {
                          // Tambahkan logika untuk menangani tombol Google
                          // authController.signInWithGoogle(context);
                        },
                        // icon: SvgPicture.asset('assets/logo_google.svg',
                        //     width: screenWidth * 0.0582,
                        //     height: screenHeight * 0.02697),
                        // label: Text(
                        //   'Sign Up with Google',
                        //   style: buttonTextGoogle,
                        // ),
                        child: Text(
                          'Sign Up with Google',
                          style: buttonTextGoogle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
