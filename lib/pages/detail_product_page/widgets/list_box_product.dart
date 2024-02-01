import 'package:flutter/material.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';
import 'package:tedikap_flutter_app/utils/dimensions.dart';

class ListBoxProduct extends StatelessWidget {
  ListBoxProduct({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.image,
    required this.title,
    required this.rating,
    required this.category,
    required this.price,
  });

  final double screenWidth;
  final double screenHeight;
  final String image;
  final String title;
  final double rating;
  final int price;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: Dimensions.marginSizeLarge, right: Dimensions.marginSizeLarge, top: Dimensions.marginSizeLarge),
        height: screenHeight * 0.09,
        width: screenWidth,
        child: Row(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: Dimensions.marginSizeSmall),
                    width: 70,
                    height: 70,
                    decoration: ShapeDecoration(
                      color: Color(0x0C56473C),
                      shape: OvalBorder(),
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: Dimensions.marginSizeLarge,
                  right: 0,
                  child: Container(
                    width: 50,
                    height: 25,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.orange,
                          size: Dimensions.iconSizeKindDeafult,
                        ),
                        Text(
                          rating.toString(),
                          style: detailPageStyle(
                              color: primaryColor,
                              fontSize: Dimensions.fontSizeSmall,
                              weight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: Dimensions.marginSizeLarge,
            ),
            Container(
              width: screenWidth * 0.45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: searchPageStyle(
                        color: primaryColor,
                        weight: FontWeight.w500,
                        fontSize: Dimensions.fontSizeLarge),
                  ),
                  SizedBox(
                    height: Dimensions.marginSizeExtraSmall,
                  ),
                  Text(category,
                      style: searchPageStyle(
                          color: primaryColor,
                          weight: FontWeight.w400,
                          fontSize: Dimensions.fontSizeDefault)),
                ],
              ),
            ),
            Expanded(
                child: Container(
                    height: screenHeight,
                    child: Center(
                      child: Text(
                        'Rp. ${price.toString()}',
                        style: searchPageStyle(
                            color: primaryColor,
                            weight: FontWeight.w500,
                            fontSize: Dimensions.fontSizeDefault),
                      ),
                    )))
          ],
        ));
  }
}
