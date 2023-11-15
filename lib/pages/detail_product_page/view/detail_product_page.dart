import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tedikap_flutter_app/data/models/product_response_model.dart';
import 'package:tedikap_flutter_app/pages/detail_product_page/controller/detail_controller.dart';
import 'package:tedikap_flutter_app/pages/detail_product_page/widgets/composition_drink_box.dart';
import 'package:tedikap_flutter_app/pages/detail_product_page/widgets/increment_price.dart';
import 'package:tedikap_flutter_app/pages/detail_product_page/widgets/payment_options_box.dart';
import 'package:tedikap_flutter_app/pages/detail_product_page/widgets/size_drink_box.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';

class DetailProduct extends StatelessWidget {
  DetailProduct({
    Key? key,
  }) : super(key: key);

  final DetailProductController detailProductController =
      Get.put(DetailProductController());

  @override
  Widget build(BuildContext context) {
    final teaSeries = Get.arguments as Product;
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
            detailProductController.resetquantity();
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
                        image: NetworkImage(teaSeries.imageUrl ?? ""),
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
                      teaSeries.name ?? "",
                      style: detailPageStyle(
                          color: primaryColor,
                          fontSize: 22,
                          weight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      teaSeries.category ?? "",
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
                          teaSeries.rating.toString() ?? "0",
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
                      teaSeries.description ?? "",
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
                    IncrementPrice(
                      detailProductController: detailProductController,
                      teaSeries: teaSeries,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CompositionDrink(
                        screenWidth: screenWidth, screenHeight: screenHeight),
                    SizedBox(
                      height: 20,
                    ),
                    SizeDrink(
                        screenWidth: screenWidth, screenHeight: screenHeight),
                    SizedBox(
                      height: 20,
                    ),
                    PaymentOptions(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      product: teaSeries,
                    ),
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
