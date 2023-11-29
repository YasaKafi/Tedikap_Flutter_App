import 'package:get/get.dart';
import 'package:get/get.dart';
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tedikap_flutter_app/data/datasource/api_controller.dart';
import 'package:tedikap_flutter_app/data/models/product_response_model.dart';
import 'package:tedikap_flutter_app/pages/search_page/controller/search_controller.dart';
import 'package:tedikap_flutter_app/pages/search_page/widgets/custom_app_bar.dart';
import 'package:tedikap_flutter_app/pages/search_page/widgets/list_box_tea.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';
import 'package:tedikap_flutter_app/utils/images.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final ApiController apiController = Get.put(ApiController());
  final MySearchController controller = Get.put(MySearchController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 4, 
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: CustomAppBar(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            controller: controller.searchController,
          ),
        ),
        body: Obx(() {
          if (controller.isSearch.value) {
             List<Product> searchResult = ApiController().searchAllData(controller.searchController.text.toLowerCase());
    return Container(
      color: Colors.white,
      width: screenWidth,
      height: screenHeight,
      child: ListView.builder(
        itemCount: searchResult.length,
        itemBuilder: (context, index) {
          Product product = searchResult[index];
          return ListBoxProductTea(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            image: product.imageUrl ?? "", // Ganti ini dengan properti yang sesuai dari objek Product
            category: product.category ?? "", // Sesuaikan dengan properti yang tepat
            title: product.name ?? "Kosong", // Contoh penggunaan properti 'name' dari objek Product
            rating: product.rating ?? 0, // Properti rating dari objek Product
            price: product.price ?? 0, // Properti price dari objek Product
            // Sesuaikan dengan properti yang ada pada objek Product
          );
        },
      ),
    );
          } else {
            return Container(
              width: screenWidth,
              height: screenHeight,
              child: Column(
                children: [
                  Container(
                    height: screenHeight * 0.05,
                    width: screenWidth,
                    child: TabBar(
                      indicatorColor: Colors.black,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(child: Text('Tea')),
                        Tab(child: Text('Non Tea')),
                        Tab(child: Text('Milk')),
                        Tab(child: Text('Snack')),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Tab(
                            child: ListView.builder(
                          itemCount: apiController.teaSeries.length,
                          scrollDirection: Axis.vertical,
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
                                  child: ListBoxProductTea(
                                    screenHeight: screenHeight,
                                    screenWidth: screenWidth,
                                    image: teaSeries.imageUrl ?? "",
                                    category: teaSeries.category ?? "",
                                    title: teaSeries.name ?? "",
                                    rating: teaSeries.rating ?? 0,
                                    price: teaSeries.price ?? 0,
                                  ),
                                );
                              }
                            });
                          },
                        )),
                        Tab(
                            child: ListView.builder(
                          itemCount: apiController.nonTeaSeries.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            final nonTeaSeries =
                                apiController.nonTeaSeries[index];
                            return Obx(() {
                              if (apiController.isLoading.value) {
                                print(apiController.isLoading.value);
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.DETAIL_PRODUCT_PAGE,
                                        arguments: nonTeaSeries);
                                  },
                                  child: ListBoxProductTea(
                                    screenHeight: screenHeight,
                                    screenWidth: screenWidth,
                                    image: nonTeaSeries.imageUrl ?? "",
                                    category: nonTeaSeries.category ?? "",
                                    title: nonTeaSeries.name ?? "",
                                    rating: nonTeaSeries.rating ?? 0,
                                    price: nonTeaSeries.price ?? 0,
                                  ),
                                );
                              }
                            });
                          },
                        )),
                        Tab(
                            child: ListView.builder(
                          itemCount: apiController.milkSeries.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            final milkSeries = apiController.milkSeries[index];
                            return Obx(() {
                              if (apiController.isLoading.value) {
                                print(apiController.isLoading.value);
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.DETAIL_PRODUCT_PAGE,
                                        arguments: milkSeries);
                                  },
                                  child: ListBoxProductTea(
                                    screenHeight: screenHeight,
                                    screenWidth: screenWidth,
                                    image: milkSeries.imageUrl ?? "",
                                    category: milkSeries.category ?? "",
                                    title: milkSeries.name ?? "",
                                    rating: milkSeries.rating ?? 0,
                                    price: milkSeries.price ?? 0,
                                  ),
                                );
                              }
                            });
                          },
                        )),
                        Tab(
                            child: ListView.builder(
                          itemCount: apiController.snacksSeries.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            final snacksSeries =
                                apiController.snacksSeries[index];
                            return Obx(() {
                              if (apiController.isLoading.value) {
                                print(apiController.isLoading.value);
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.DETAIL_PRODUCT_PAGE,
                                        arguments: snacksSeries);
                                  },
                                  child: ListBoxProductTea(
                                    screenHeight: screenHeight,
                                    screenWidth: screenWidth,
                                    image: snacksSeries.imageUrl ?? "",
                                    category: snacksSeries.category ?? "",
                                    title: snacksSeries.name ?? "",
                                    rating: snacksSeries.rating ?? 0,
                                    price: snacksSeries.price ?? 0,
                                  ),
                                );
                              }
                            });
                          },
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
