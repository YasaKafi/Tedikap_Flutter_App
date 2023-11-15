import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/pages/register_page/controller/register_controller.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';

import '../../../utils/custom_themes.dart';

// ignore: camel_case_types


class InputTextFormPasswordB extends StatelessWidget {
  final String hint;
  
  InputTextFormPasswordB({
    Key? key,
    required this.hint, 
  }) : super(key: key);

  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Obx( () => TextFormField(
      obscureText: registerController.obscureText.value,
      style: textFieldInputB,
      controller: registerController.passwordController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password is required';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hintTextStylB,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 2.0),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorResources.yellow,
            width: 2.0,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            registerController.toggleObscureText();
          },
          icon: Icon(
              !registerController.obscureText.value
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_rounded,
              color: primaryColor,
              size: 19,
            
          ),
        ),
      ),
    )
    );
  }
}



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
            borderSide: BorderSide(color: borderColor, width: 2.0),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorResources.yellow,
              width: 2.0,
            ),
          ),
        ));
  }
}