import 'package:get/get.dart';
import 'package:flutter/material.dart';

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/data/datasource/api_controller.dart';

import 'package:tedikap_flutter_app/pages/detail_product_page/widgets/list_box_product.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';

import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';

class DetailListTeaPage extends StatelessWidget {
  DetailListTeaPage({Key? key}) : super(key: key);
  final ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Tea Series",
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
        body: Container(
          width: screenWidth,
          height: screenHeight,
          child: ListView.builder(
            itemCount: apiController.teaSeries.length,
            itemBuilder: (context, index) {
              final teaSeries = apiController.teaSeries[index];
              return Obx(() {
                if (apiController.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.DETAIL_PRODUCT_PAGE,
                          arguments: teaSeries);
                    },
                    child: ListBoxProduct(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      image: teaSeries.imageUrl ?? '',
                      rating: teaSeries.rating ?? 0,
                      category: teaSeries.category ?? '',
                      title: teaSeries.name ?? '',
                      price: teaSeries.price ?? 0,
                    ),
                  );
                }
              });
            },
          ),
        ));
  }
}
