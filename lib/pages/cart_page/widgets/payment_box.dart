import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';
import 'package:tedikap_flutter_app/utils/images.dart';

class PaymentBox extends StatelessWidget {
  const PaymentBox({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.image,
    required this.payment,
    required this.balance,
    required this.textStyle,
    required this.scale,
    required this.isSelected,
    required this.onChanged,
  });

  final double screenWidth;
  final double screenHeight;
  final String image;
  final String payment;
  final String balance;
  final TextStyle textStyle;
  final double scale;
  final bool isSelected;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    
      return RadioListTile<bool>(
        title: Padding(
          padding:
              const EdgeInsets.only(top: 10.0, bottom: 10, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        payment,
                        style: cartPageStyle(
                            color: primaryColor,
                            weight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      Text(balance, style: textStyle),
                    ],
                  ),
                ],
              ),
              Image.asset(
                image,
                scale: scale,
              ),
            ],
          ),
        ),
        value: isSelected,
        groupValue: true, // Tandai jika tombol ini dipilih
        onChanged: (bool? value) {
          onChanged(value);
        },
      );
    
  }
}
