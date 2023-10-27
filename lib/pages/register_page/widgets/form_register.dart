import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';

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
      height: MediaQuery.of(context).size.height,
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
                    child: myTextFieldB(
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
                      child: myTextFieldB(
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
                    child: InputTextFormPhone(
                      keyboardInput: TextInputType.phone,
                      hint: 'PhoneNumber',
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
                  registerController.signUp();
                  // if (_formKey.currentState!.validate()) {

                  //   }
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
                        child: Text(
                          'Sign Up with Google',
                          style: buttonTextGoogleB,
                        )),
                    // icon: SvgPicture.asset('assets/logo_google.svg',
                    //     width: 24, height: 24),
                    // label: Text(
                    //   'Sign Up with Google',
                    //   style: buttonTextGoogleB,
                    // ),
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
