import 'package:flutter/material.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';


class ProductOrder extends StatelessWidget {
  final String title;
  final int quantity;

  const ProductOrder({
    Key? key,
    required this.title,
    required this.quantity,
  }) : super(key: key);

  @override
Widget build(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  return Container(
    width: screenWidth,
    height: screenHeight * 0.05,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title, // Gunakan nilai title dari parameter
              style: strukPageStyle(
                  color: primaryColor, weight: FontWeight.w500, fontSize: 16),
            ),
            Text(
              'Ice, Regular, Normal Sugar,',
              style: strukPageStyle(
                  color: primaryColor, weight: FontWeight.w400, fontSize: 14),
            ),
          ],
        ),
        Text(
          'x$quantity', // Gunakan nilai quantity dari parameter
          style: strukPageStyle(
              color: primaryColor, weight: FontWeight.w500, fontSize: 16),
        ),
      ],
    ),
  );
}

  }