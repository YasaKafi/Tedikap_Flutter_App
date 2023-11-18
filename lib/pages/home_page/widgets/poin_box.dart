import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';
import 'package:tedikap_flutter_app/utils/dimensions.dart';
import 'package:tedikap_flutter_app/utils/images.dart';

class PoinBoxWidget extends StatelessWidget {
  const PoinBoxWidget({
    super.key,
    required this.screenHeight,
    required this.sizeCard,
  });

  final double screenHeight;
  final double sizeCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.11),
      width: sizeCard,
      height: screenHeight * 0.12,
      decoration: BoxDecoration(
        color: ColorResources.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: Dimensions.marginSizeLarge, top: Dimensions.marginSizeSmall),
                width: 40,
                height: 40,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: SvgPicture.asset(Images.splashLogo),
              ),
              SizedBox(
                width: Dimensions.marginSizeDefault,
              ),
              Text(
                "5 Poin",
                style: pointStyle,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            width: sizeCard * 0.9,
            child: Divider(
              color: ColorResources.black30,
              thickness: 2,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: Dimensions.paddingSizeLarge, right: Dimensions.paddingSizeLarge, top: Dimensions.paddingSizeExtraSmall),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tukarkan poinmu dengan hadiah menarik',
                  style: subminiTextStyle,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: Dimensions.iconSizeSmall,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}