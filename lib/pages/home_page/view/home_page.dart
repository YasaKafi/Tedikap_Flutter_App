import 'package:get/get.dart';
import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get/get.dart';
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/data/datasource/api_controller.dart';
import 'package:tedikap_flutter_app/pages/home_page/controller/home_controller.dart';
import 'package:tedikap_flutter_app/pages/home_page/widgets/list_box_product.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/images.dart';

import '../../../data/datasource/mock_data.dart';
import '../../../utils/custom_themes.dart';
import '../widgets/category_widget.dart';

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
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.18,
                  decoration: BoxDecoration(
                    color: ColorResources.gold,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30, top: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selamat Datang',
                              style: miniTextStyle,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'YASA',
                              style: nameUserStyle,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 30, top: 50),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: ColorResources.black30,
                              shape: BoxShape.circle),
                          child: Center(
                              child: Icon(
                            Icons.shopping_cart_outlined,
                            color: ColorResources.white,
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: screenWidth,
                margin: EdgeInsets.only(top: screenHeight * 0.18),
                decoration: BoxDecoration(
                  color: ColorResources.white,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      width: screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Align(
                              alignment: Alignment.center,
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 5),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 600),
                                  viewportFraction: 1.0,
                                  aspectRatio: 23 / 9,
                                  enlargeCenterPage: true,
                                  onPageChanged: (index, reason) {
                                    controller.changeIndex(index);
                                  },
                                ),
                                items: carouselImageStrings.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Image.asset(
                                            i,
                                            fit: BoxFit.fill,
                                          ));
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Obx(() {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:
                                    carouselImageStrings.map((imageString) {
                                  int index =
                                      carouselImageStrings.indexOf(imageString);
                                  return Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: controller.currentIndex == index
                                          ? ColorResources.gold
                                          : ColorResources.grey,
                                    ),
                                  );
                                }).toList(),
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      width: screenWidth,
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CategoryWidget(
                            image: Images.snackLogo,
                          ),
                          CategoryWidget(
                            image: Images.nonteaLogo,
                          ),
                          CategoryWidget(
                            image: Images.milkLogo,
                          ),
                          CategoryWidget(
                            image: Images.teaLogo,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: screenWidth,
                      margin: EdgeInsets.only(top: 10),
                      height: screenHeight * 0.51,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      color: ColorResources.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jajan Makin Hemat',
                            style: promoTextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Dapatkan diskon dan harga spesial hanya dengan melakukan pemesanan di App Tedikap',
                            style: promoTextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: screenHeight * 0.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorResources.black,
                                image: DecorationImage(
                                    image: AssetImage(Images.promo1),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: screenHeight * 0.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorResources.black,
                                image: DecorationImage(
                                    image: AssetImage(Images.promo2),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: 20,
                              ),
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: SvgPicture.asset(Images.splashLogo),
                            ),
                            SizedBox(
                              width: 15,
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
                                left: 20,
                              ),
                              child: Text(
                                'Menu Terlaris',
                                style: promoTextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                right: 20,
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
                                      size: 15,
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
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                      height: screenHeight * 0.31,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: ColorResources.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: screenHeight * 0.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                image: DecorationImage(
                                    image: AssetImage(Images.promo1),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              'Dapatkan Potongan Sebesar Rp.20.000',
                              style: promoTextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Potongan Harga ini hanya berlaku bagi Anak-anak kelas 12 yang sebentar lagi akan lulus dari sekolah',
                              style: promoTextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              'S&K Berlaku',
                              style: promoTextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: 20,
                                ),
                                width: 30,
                                height: 30,
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
                                child: SvgPicture.asset(Images.splashLogo),
                              ),
                              SizedBox(
                                width: 15,
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
                                  left: 20,
                                ),
                                child: Text(
                                  'Snack yang bikin kenyang',
                                  style: promoTextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  right: 20,
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
                                        size: 15,
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
                child: Container(
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
                            margin: EdgeInsets.only(left: 20, top: 10),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: SvgPicture.asset(Images.splashLogo),
                          ),
                          SizedBox(
                            width: 15,
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
                            const EdgeInsets.only(left: 20, right: 20, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tukarkan poinmu dengan hadiah menarik',
                              style: subminiTextStyle,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
