import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/pages/login_page/controller/login_controller.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';

import '../../../utils/custom_themes.dart';

class TextFieldCustom extends StatelessWidget {
  final String hint;
  final TextInputType keyboardInput;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const TextFieldCustom({
    super.key,
    required this.hint,
    required this.keyboardInput,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: validator,
        keyboardType: keyboardInput,
        controller: controller,
        style: textFieldInputB,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: hintTextStylB,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2.0),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
              width: 2.0,
            ),
          ),
        ));
  }
}

class InputTextFormPassword extends StatelessWidget {
  final String hint;
  InputTextFormPassword({
    super.key,
    required this.hint,
  });

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: loginController.passwordController,
        obscureText: loginController.obscureText.value,
        style: textFieldInput,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: hintTextStyle,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2.0),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFBA68C8),
              width: 2.0,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              loginController.toggleObscureText();
            },
            icon: Icon(
              !loginController.obscureText.value
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_rounded,
              color: primaryColor,
              size: 19,
            ),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Password is required';
          } else if (value.length < 8) {
            return 'Password must be at least 8 characters';
          }
          return null;
        },
      );
    });
  }
}
