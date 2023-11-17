import 'package:flutter/material.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';

class TextReceiptOrder extends StatelessWidget {
  const TextReceiptOrder({
    super.key, required this.textL, required this.styleR, required this.textR, required this.styleL,
  });
  final String textL;
  final String textR;
  final TextStyle styleR;
  final TextStyle styleL;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textL,
          style: styleL
        ),
        Text(
        textR,
          style: styleR
        ),
      ],
    );
  }
}
