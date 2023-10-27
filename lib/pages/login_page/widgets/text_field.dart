import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/pages/login_page/controller/login_controller.dart';

import '../../../utils/custom_themes.dart';

class myTextField extends StatelessWidget {
  final String hint;

  final TextEditingController controller;
  final TextInputType keyboardInput;

  myTextField({
    super.key,
    required this.hint,
    required this.controller,
    required this.keyboardInput,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
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
      ),
      validator: (value) {
        if (value!.isEmpty ||
            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(value)) {
          return 'Enter Correct Email';
        }
        return null;
      },
    );
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
