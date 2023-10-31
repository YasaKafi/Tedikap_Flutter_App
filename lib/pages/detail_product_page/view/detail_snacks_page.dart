import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/data/models/product_response_model.dart';
import 'package:tedikap_flutter_app/pages/detail_product_page/controller/detail_controller.dart';
import 'package:tedikap_flutter_app/pages/detail_product_page/widgets/app_bar.dart';
import 'package:tedikap_flutter_app/pages/home_page/controller/home_controller.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';

class DetailSnack extends StatelessWidget {
  DetailSnack({Key? key}) : super(key: key);

  final DetailProductController detailProductController =
      Get.put(DetailProductController());

  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final snackSeries = Get.arguments as Product;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenButtonBuy = MediaQuery.of(context).size.height * 0.06284;
    return Scaffold(
      backgroundColor: ColorResources.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Detail",
          style: titleAppBarProductrStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, color: ColorResources.black),
        ),
        backgroundColor: ColorResources.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: AspectRatio(
                  aspectRatio: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: ColorResources.grey,
                          blurRadius: 25,
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(snackSeries.imageUrl ?? ""),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50, left: 40, right: 40),
                height: screenHeight * 0.35,
                width: screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      snackSeries.name ?? "",
                      style: detailPageStyle(
                          color: primaryColor,
                          fontSize: 22,
                          weight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      snackSeries.category ?? "",
                      style: detailPageStyle(
                          color: primaryColor,
                          fontSize: 14,
                          weight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.orange,
                          size: 25,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          snackSeries.rating.toString() ?? "0",
                          style: detailPageStyle(
                              color: primaryColor,
                              fontSize: 16,
                              weight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '(230)',
                          style: detailPageStyle(
                              color: ColorResources.greyBold,
                              fontSize: 14,
                              weight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      thickness: 1,
                      color: ColorResources.grey,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Description",
                      style: detailPageStyle(
                          color: primaryColor,
                          fontSize: 22,
                          weight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      snackSeries.description ?? "",
                      style: detailPageStyle(
                          color: primaryColor,
                          fontSize: 14,
                          weight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth,
                height: screenHeight * 0.3,
                margin: EdgeInsets.only(top: 20, left: 40, right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: Row(
                          children: [
                            Text(
                              "Rp.",
                              style: detailPageStyle(
                                  color: ColorResources.greyBold,
                                  fontSize: 16,
                                  weight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Obx(() {
                              final productPrice = detailProductController
                                  .getProductPrice(snackSeries.id ?? 0)
                                  .toString(); // Ganti 123 dengan ID produk yang diinginkan
                              return Text(
                                productPrice,
                                style: detailPageStyle(
                                  color: primaryColor,
                                  fontSize: 24,
                                  weight: FontWeight.bold,
                                ),
                              );
                            }),
                          ],
                        )),
                        Container(
                          width: screenWidth * 0.38235,
                          height: screenHeight * 0.0561,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF0F0F3),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: screenWidth * 0.1019,
                                  height: screenHeight * 0.04719,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF0F0F3),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: ColorResources.greySemi,
                                        width: 2,
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x33AEAEC0),
                                        blurRadius: 10,
                                        offset: Offset(5, 5),
                                        spreadRadius: 0,
                                      ),
                                      BoxShadow(
                                        color: Color(0x66FFFFFF),
                                        blurRadius: 5,
                                        offset: Offset(-5, -5),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Center(
                                      child: IconButton(
                                    icon: Icon(
                                      Icons.remove,
                                      color: ColorResources.greyBold,
                                      size: 20,
                                    ),
                                    onPressed: () => detailProductController
                                        .decreaseQuantity(),
                                  )),
                                ),
                                Obx(() {
                                  return Center(
                                    child: Text(
                                      detailProductController.quantity
                                          .toString(),
                                      style: detailPageStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          weight: FontWeight.bold),
                                    ),
                                  );
                                }),
                                Container(
                                  width: screenWidth * 0.1019,
                                  height: screenHeight * 0.04719,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF0F0F3),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: ColorResources.greySemi,
                                        width: 2,
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x33AEAEC0),
                                        blurRadius: 10,
                                        offset: Offset(5, 5),
                                        spreadRadius: 0,
                                      ),
                                      BoxShadow(
                                        color: Color(0x66FFFFFF),
                                        blurRadius: 5,
                                        offset: Offset(-5, -5),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Center(
                                      child: IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      color: ColorResources.greyBold,
                                      size: 20,
                                    ),
                                    onPressed: () => detailProductController
                                        .increaseQuantity(),
                                  )),
                                ),
                              ]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      return Visibility(
                        visible: homeController.isSnacksSeriesClicked.value,
                        child: Container(
                          width: screenWidth,
                          height: screenHeight * 0.0561,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF0F0F3),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: screenWidth * 0.38235,
                                  height: screenHeight * 0.04719,
                                  decoration: ShapeDecoration(
                                    color: ColorResources.gold,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: ColorResources.greySemi,
                                        width: 2,
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x33AEAEC0),
                                        blurRadius: 10,
                                        offset: Offset(5, 5),
                                        spreadRadius: 0,
                                      ),
                                      BoxShadow(
                                        color: Color(0x66FFFFFF),
                                        blurRadius: 5,
                                        offset: Offset(-5, -5),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.fireplace_rounded,
                                        color: ColorResources.red,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Hot",
                                        style: detailPageStyle(
                                            color: ColorResources.red,
                                            weight: FontWeight.w600,
                                            fontSize: 14),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.38235,
                                  height: screenHeight * 0.04719,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.ac_unit,
                                        color: ColorResources.greyBold,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Iced",
                                        style: detailPageStyle(
                                            color: ColorResources.grey,
                                            weight: FontWeight.w600,
                                            fontSize: 14),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      );
                    }),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      return Visibility(
                        visible: homeController.isSnacksSeriesClicked.value,
                        child: Container(
                          width: screenWidth,
                          height: screenHeight * 0.0561,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF0F0F3),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: screenWidth * 0.179,
                                  height: screenHeight * 0.04719,
                                  child: Center(
                                    child: Text(
                                      "Short",
                                      style: detailPageStyle(
                                          color: ColorResources.greyBold,
                                          weight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.179,
                                  height: screenHeight * 0.04719,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF0F0F3),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: ColorResources.greySemi,
                                        width: 2,
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x33AEAEC0),
                                        blurRadius: 10,
                                        offset: Offset(5, 5),
                                        spreadRadius: 0,
                                      ),
                                      BoxShadow(
                                        color: Color(0x66FFFFFF),
                                        blurRadius: 5,
                                        offset: Offset(-5, -5),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Tall",
                                      style: detailPageStyle(
                                          color: Colors.blueAccent,
                                          weight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.179,
                                  height: screenHeight * 0.04719,
                                  child: Center(
                                    child: Text(
                                      "Grande",
                                      style: detailPageStyle(
                                          color: ColorResources.greyBold,
                                          weight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.179,
                                  height: screenHeight * 0.04719,
                                  child: Center(
                                    child: Text(
                                      "Venti",
                                      style: detailPageStyle(
                                          color: ColorResources.greyBold,
                                          weight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      );
                    }),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: screenWidth,
                      height: screenHeight * 0.06284,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF0F0F3),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () =>  Get.offNamed(Routes.CART_PAGE),
                              child: Container(
                                width: screenWidth * 0.4,
                                height: screenHeight,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF0F0F3),
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(50)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x33AEAEC0),
                                      blurRadius: 10,
                                      offset: Offset(5, 5),
                                      spreadRadius: 0,
                                    ),
                                    BoxShadow(
                                      color: Color(0x66FFFFFF),
                                      blurRadius: 5,
                                      offset: Offset(-5, -5),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.shopping_cart_outlined,
                                      color: ColorResources.greyBold,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Add to Cart",
                                      style: detailPageStyle(
                                          color: ColorResources.greyBold,
                                          weight: FontWeight.w600,
                                          fontSize: 14),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: screenWidth * 0.4,
                              height: screenHeight,
                              decoration: BoxDecoration(
                                color: Color(0xFFF0F0F3),
                                borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(50)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x33AEAEC0),
                                    blurRadius: 10,
                                    offset: Offset(5, 5),
                                    spreadRadius: 0,
                                  ),
                                  BoxShadow(
                                    color: Color(0x66FFFFFF),
                                    blurRadius: 5,
                                    offset: Offset(-5, -5),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: ColorResources.green,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Order Now",
                                    style: detailPageStyle(
                                        color: ColorResources.green,
                                        weight: FontWeight.w600,
                                        fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                          ]),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
