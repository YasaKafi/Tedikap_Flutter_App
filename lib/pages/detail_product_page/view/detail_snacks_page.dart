import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/data/models/product_response_model.dart';
import 'package:tedikap_flutter_app/pages/detail_product_page/controller/detail_controller.dart';
import 'package:tedikap_flutter_app/pages/detail_product_page/widgets/app_bar.dart';
import 'package:tedikap_flutter_app/pages/detail_product_page/widgets/composition_drink_box.dart';
import 'package:tedikap_flutter_app/pages/detail_product_page/widgets/increment_price.dart';
import 'package:tedikap_flutter_app/pages/detail_product_page/widgets/payment_options_box.dart';
import 'package:tedikap_flutter_app/pages/detail_product_page/widgets/size_drink_box.dart';
import 'package:tedikap_flutter_app/pages/home_page/controller/home_controller.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';
import 'package:tedikap_flutter_app/utils/dimensions.dart';

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
            detailProductController.resetquantity();
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, color: ColorResources.black),
        ),
        backgroundColor: ColorResources.white,
        elevation: 0,
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
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
                margin: EdgeInsets.only(top: Dimensions.marginSizeExtraLargeX2, left: Dimensions.marginSizeOnboardLarge, right: Dimensions.marginSizeOnboardLarge),
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
                      height: Dimensions.marginSizeSmall,
                    ),
                    Text(
                      snackSeries.category ?? "",
                      style: detailPageStyle(
                          color: primaryColor,
                          fontSize: Dimensions.fontSizeDefault,
                          weight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: Dimensions.marginSizeLarge,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.orange,
                          size: Dimensions.iconSizeDefault,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          snackSeries.rating.toString() ?? "0",
                          style: detailPageStyle(
                              color: primaryColor,
                              fontSize: Dimensions.fontSizeLarge,
                              weight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '(230)',
                          style: detailPageStyle(
                              color: ColorResources.greyBold,
                              fontSize: Dimensions.fontSizeDefault,
                              weight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.marginSizeLarge,
                    ),
                    Divider(
                      thickness: 1,
                      color: ColorResources.grey,
                    ),
                    SizedBox(
                      height: Dimensions.marginSizeLarge,
                    ),
                    Text(
                      "Description",
                      style: detailPageStyle(
                          color: primaryColor,
                          fontSize: Dimensions.fontSizeHomeName,
                          weight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: Dimensions.marginSizeSmall,
                    ),
                    Text(
                      snackSeries.description ?? "",
                      style: detailPageStyle(
                          color: primaryColor,
                          fontSize: Dimensions.fontSizeDefault,
                          weight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            Container(
              width: screenWidth,
              height: screenHeight * 0.15,
              margin: EdgeInsets.only(top: 20, left: 40, right: 40, ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IncrementPrice(detailProductController: detailProductController, teaSeries: snackSeries, screenWidth: screenWidth, screenHeight: screenHeight),
                  Align(
                    alignment: Alignment.bottomCenter,
                    
                    child: PaymentOptions(screenWidth: screenWidth, screenHeight: screenHeight, product: snackSeries))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
