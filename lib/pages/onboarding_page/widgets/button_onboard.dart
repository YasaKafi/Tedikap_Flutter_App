import 'package:flutter/material.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';

class ButtonOnBoard extends StatelessWidget {
  final String text;

  const ButtonOnBoard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.0505,
      width: screenWidth * 0.6,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey, 
            offset: Offset(0, 4), 
            blurRadius: 6, 
            spreadRadius: 0, 
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: primaryColor,
      ),
      child: Center(
        child: Text(
          text,
          style: onboardingButtonTextStyle,
        ),
      ),
    );
  }
}