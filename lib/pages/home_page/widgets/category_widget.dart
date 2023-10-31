import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/images.dart';

class CategoryWidget extends StatelessWidget {
  final String image;
  const CategoryWidget({
    super.key, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(image),
    ));
  }
}
