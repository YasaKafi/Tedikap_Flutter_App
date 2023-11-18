import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tedikap_flutter_app/pages/profile_page/widget/ListTileWidget.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';
import 'package:tedikap_flutter_app/utils/dimensions.dart';
import 'package:tedikap_flutter_app/utils/images.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.09,
                  decoration: BoxDecoration(
                    color: ColorResources.gold,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.only(left: Dimensions.paddingSizeLarge),
                        width: screenWidth * 0.5,
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: ColorResources.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 23,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "YASA",
                                    style: profileTextStyle(
                                      color: ColorResources.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "0895-2568-3801",
                                    style: profileTextStyle(
                                      color: ColorResources.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: ColorResources.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                ),
                Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.09,
                  decoration: BoxDecoration(
                    color: ColorResources.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorResources.black),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.only(left: Dimensions.paddingSizeSmall),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              child: SvgPicture.asset(Images.CupPoint),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 23,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Diskon 50% Menunggumu!",
                                    style: profileTextStyle(
                                      color: ColorResources.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Ajak teman kamu download aplikasi Tedikap",
                                    style: profileTextStyle(
                                      color: ColorResources.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: ColorResources.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                ),
                Divider(
                  height: Dimensions.marginSizeSmall,
                  color: ColorResources.grey,
                  thickness: 8,
                ),
                MyListViewWidget(),
                Padding(
                  padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Butuh Bantuan?',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.1,
                  decoration: BoxDecoration(
                    color: ColorResources.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorResources.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                ),
                Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.09,
                  decoration: BoxDecoration(
                    color: ColorResources.red,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorResources.black),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: Text(
                          "LOGOUT",
                          style: profileTextStyle(
                            color: ColorResources.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
