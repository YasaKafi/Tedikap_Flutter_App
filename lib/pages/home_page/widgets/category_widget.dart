import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';

import '../../../utils/images.dart';

class CategoryWidget extends StatelessWidget {
  final String image;
  final String title;
  final Function() onTap;
  const CategoryWidget({
    super.key, 
    required this.image,
    required this.title, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
          onTap: onTap,
          child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
          shape: BoxShape.circle,
              ),
              child: Column(
          children: [
            SvgPicture.asset(image),
            SizedBox(height: 5,),
            Text(title, style: homePageStyle(color: primaryColor, weight: FontWeight.w500, fontSize: 14),)
          ],
              ),
            ),
        ));
  }
}
