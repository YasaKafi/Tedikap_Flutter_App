import 'package:get/get.dart';
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tedikap_flutter_app/data/datasource/api_controller.dart';
import 'package:tedikap_flutter_app/pages/home_page/controller/home_controller.dart';
import 'package:tedikap_flutter_app/pages/home_page/widgets/carousel_slider.dart';
import 'package:tedikap_flutter_app/pages/home_page/widgets/header.dart';
import 'package:tedikap_flutter_app/pages/home_page/widgets/list_box_product.dart';
import 'package:tedikap_flutter_app/pages/home_page/widgets/poin_box.dart';
import 'package:tedikap_flutter_app/pages/home_page/widgets/promo_box.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/dimensions.dart';
import 'package:tedikap_flutter_app/utils/images.dart';

import '../../../data/datasource/mock_data.dart';
import '../../../utils/custom_themes.dart';
import '../widgets/category_widget.dart';

// ignore: must_be_immutable
class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);
  final ApiController apiController = Get.put(ApiController());

  List carouselImageStrings = carouselImage.map((i) => i['image']).toList();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double sizeCard = MediaQuery.of(context).size.width * 0.9;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: screenHeight,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: HeaderHomeWidget(
                    screenWidth: screenWidth, screenHeight: screenHeight),
              ),
              Container(
                width: screenWidth,
                margin: EdgeInsets.only(top: screenHeight * 0.18),
                decoration: BoxDecoration(
                  color: ColorResources.white,
                ),
                child: Column(
                  children: [
                    CarouselSliderWidget(
                        screenWidth: screenWidth,
                        carouselImageStrings: carouselImageStrings),
                    Container(
                      padding: EdgeInsets.only(
                          left: Dimensions.paddingSizeLarge,
                          right: Dimensions.paddingSizeLarge),
                      width: screenWidth,
                      margin: EdgeInsets.only(
                        top: Dimensions.marginSizeSmall,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CategoryWidget(
                              image: Images.teaLogo,
                              title: 'Tea',
                              onTap: () {
                                Get.toNamed(
                                  Routes.DETAIL_LIST_TEA_PAGE,
                                );
                              },
                            ),
                            CategoryWidget(
                              image: Images.nonteaLogo,
                              title: 'Non Tea',
                              onTap: () {
                                Get.toNamed(
                                  Routes.DETAIL_LIST_NONTEA_PAGE,
                                );
                              },
                            ),
                            CategoryWidget(
                              image: Images.milkLogo,
                              title: 'Milk',
                              onTap: () {
                                Get.toNamed(
                                  Routes.DETAIL_LIST_MILK_PAGE,
                                );
                              },
                            ),
                            CategoryWidget(
                              image: Images.snackLogo,
                              title: 'Snack',
                              onTap: () {
                                Get.toNamed(
                                  Routes.DETAIL_LIST_SNACK_PAGE,
                                );
                              },
                            ),
                          ]),
                    ),
                    PromoBoxWidget(
                        screenWidth: screenWidth, screenHeight: screenHeight),
                    SizedBox(
                      height: Dimensions.marginSizeSmall,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: Dimensions.marginSizeLarge,
                              ),
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: SvgPicture.asset(Images.splashLogo),
                            ),
                            SizedBox(
                              width: Dimensions.marginSizeDefault,
                            ),
                            Text(
                              "Tedikap",
                              style: miniTedikapStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: Dimensions.marginSizeLarge,
                              ),
                              child: Text(
                                'Menu Terlaris',
                                style: promoTextStyle(
                                    fontSize: Dimensions.fontSizeExtraLarge,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                right: Dimensions.marginSizeLarge,
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      "Lihat semua",
                                      style: miniTedikapStyle,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: Dimensions.fontSizeLarge,
                                      color: primaryColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Obx(() {
                          if (apiController.isLoading.value) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Container(
                              width: screenWidth,
                              height: 240,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: apiController.teaSeries.length,
                                itemBuilder: (context, index) {
                                  final teaSeries =
                                      apiController.teaSeries[index];
                                  return InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.DETAIL_PRODUCT_PAGE,
                                          arguments: teaSeries);
                                    },
                                    child: ListBoxProduct(
                                      image: teaSeries.imageUrl ?? '',
                                      rating: teaSeries.rating ?? 0,
                                      category: teaSeries.category ?? '',
                                      title: teaSeries.name ?? '',
                                      screenHeight: double.infinity,
                                      screenWidth: double.infinity,
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                        }),
                      ],
                    ),
                    PromoBox2Widget(screenHeight: screenHeight),
                    Container(
                      margin: EdgeInsets.only(
                        top: Dimensions.marginSizeLarge,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: Dimensions.marginSizeLarge,
                                ),
                                width: 30,
                                height: 30,
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
                                child: SvgPicture.asset(Images.splashLogo),
                              ),
                              SizedBox(
                                width: Dimensions.marginSizeDefault,
                              ),
                              Text(
                                "Tedikap",
                                style: miniTedikapStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: Dimensions.marginSizeLarge,
                                ),
                                child: Text(
                                  'Snack yang bikin kenyang',
                                  style: promoTextStyle(
                                      fontSize: Dimensions.fontSizeLarge,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  right: Dimensions.marginSizeLarge,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.DETAIL_LIST_SNACK_PAGE);
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        "Lihat semua",
                                        style: miniTedikapStyle,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: Dimensions.fontSizeLarge,
                                        color: primaryColor,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Obx(() {
                            if (apiController.isLoading.value) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Container(
                                width: screenWidth,
                                height: 240,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: apiController.snacksSeries.length,
                                  itemBuilder: (context, index) {
                                    final snacksSeries =
                                        apiController.snacksSeries[index];
                                    return InkWell(
                                      onTap: () {
                                        controller.isSnacksSeriesClicked();
                                        Get.toNamed(Routes.DETAIL_SNACK_PAGE,
                                            arguments: snacksSeries);
                                      },
                                      child: ListBoxProduct(
                                        image: snacksSeries.imageUrl ?? '',
                                        rating: snacksSeries.rating ?? 0,
                                        category: snacksSeries.category ?? '',
                                        title: snacksSeries.name ?? '',
                                        screenHeight: double.infinity,
                                        screenWidth: double.infinity,
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: PoinBoxWidget(
                    screenHeight: screenHeight, sizeCard: sizeCard),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
