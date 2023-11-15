// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tedikap_flutter_app/pages/cart_page/controller/radio_controller.dart';

// // ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

// Widget radioButtonPayment({required context, required String pathImage, required String name, required String value}) {
//   final RadioController paymentPageController = Get.put(RadioController());

//   final Size mediaQuery = MediaQuery.of(context).size;
//   final double width = mediaQuery.width;
//   final double height = mediaQuery.height;

//   return InkWell(
//     onTap: () => paymentPageController.setOrderType(value),
//     child: Container(
//       height: height * 0.08,
//       color: Colors.white,
//       padding: EdgeInsets.symmetric(horizontal: width * 0.05),
//       margin: EdgeInsets.only(bottom: height * 0.003),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Image.asset('assets/images/$pathImage.png', height: height * 0.04, fit: BoxFit.fitHeight),
//               SizedBox(width: width * 0.03),
//               Text(name, style: ts14SemiboldBlack),
//             ],
//           ),
//           Obx(() => Radio(
//             value: value,
//             groupValue: paymentPageController.orderType.value,
//             activeColor: primaryColor,
//             onChanged: (val) {
//               paymentPageController.setOrderType(value);
//             },
//           ))
//         ],
//       ),
//     ),
//   );
// }
