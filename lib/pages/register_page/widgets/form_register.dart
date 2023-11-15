import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/images.dart';

import '../../../utils/custom_themes.dart';
import '../../login_page/view/login_page.dart';
import '../controller/register_controller.dart';
import 'text_field.dart';

class FormRegister extends StatelessWidget {
  FormRegister({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.6,
      color: primaryTextColorWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextFieldCustom(
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                          return 'Enter Correct Name';
                        }
                        return null;
                      },
                      controller: registerController.usernameController,
                      hint: 'Name',
                      keyboardInput: TextInputType.name,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: TextFieldCustom(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                                  .hasMatch(value!)) {
                            return 'Enter Correct Email';
                          }

                          return null;
                        },
                        hint: 'Email',
                        keyboardInput: TextInputType.emailAddress,
                        controller: registerController.emailController,
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextFieldCustom(
                      keyboardInput: TextInputType.phone,
                      hint: 'PhoneNumber',
                      controller: registerController.phoneNumberController,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^(\+62|0)[0-9]{9,13}$')
                                .hasMatch(value!)) {
                          return 'Enter Correct Phone Number';
                        }

                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: InputTextFormPasswordB(
                        hint: 'Password',
                      )),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Semua kolom teks telah diisi dengan benar, lanjutkan dengan pendaftaran
                    registerController.signUp();
                  } else {
                    // Tampilkan Snackbar jika form tidak valid
                    Get.snackbar(
                      'Error',
                      'Form is not valid. Please check your input.',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: Text(
                  'SIGN UP',
                  style: buttonTextStyleW,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorResources.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              children: [
                const Expanded(
                    child: Divider(
                  color: borderColor,
                  thickness: 2,
                  height: 1,
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                    child: Text(
                      'or SignUp with',
                      style: orSignUpWith,
                    ),
                  ),
                ),
                const Expanded(
                    child: Divider(
                  color: borderColor,
                  height: 1,
                  thickness: 2,
                )),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryTextColorWhite,
                      border: Border.all(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(ColorResources.yellow),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        onPressed: () async {
                          registerController.signInWithGoogle(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Images.googleIcon,
                                width: 20, height: 20),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Sign Up with Google',
                              style: buttonTextGoogleB,
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showNotification(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.orange.shade900,
      content: Text(message.toString())));
}
