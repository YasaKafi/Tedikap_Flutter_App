import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';
import 'package:tedikap_flutter_app/utils/dimensions.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Detail Product",
          style: detailPageStyle(color: primaryColor, weight: FontWeight.bold, fontSize: Dimensions.fontSizeHomeName)
        ),
      ),
    );
  }
}
