import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/data/datasource/api_controller.dart';
import 'package:tedikap_flutter_app/data/models/product_response_model.dart';

class MySearchController extends GetxController {
  RxBool isSearch = false.obs;
  final  searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() {
      if (searchController.text.isNotEmpty) {
        isSearch.value = true;
      } else {
        isSearch.value = false;
      }
    });
  }
}