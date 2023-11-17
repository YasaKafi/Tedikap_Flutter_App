import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/repositories/movie_repository.dart';

import '../models/product_response_model.dart';

class ApiController extends GetxController {
  var teaSeries = <Product>[].obs;
  var nonTeaSeries = <Product>[].obs;
  var milkSeries = <Product>[].obs;
  var snacksSeries = <Product>[].obs;

  var isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    getTeaSeries();
    getSnackSeries();
    getMilkSeries();
    getNonTeaSeries();
  }
  

  Future<void> getTeaSeries() async {
    try {
      isLoading.value = true;
      final dio.Dio dioInstance = dio.Dio();
      final dio.Response response =
          await dioInstance.get(TedikapApiRepository().getTea);

      if (response.statusCode == 200) {
        final List<dynamic> teaList = response.data["data"];
        teaSeries.value =
            teaList.map((json) => Product.fromJson(json)).toList();
        print(teaSeries.value[0].name);
      } else {
        print("Failed to fetch tea. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error while fetching tea: $error");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getSnackSeries() async {
    try {
      isLoading.value = true;
      final dio.Dio dioInstance = dio.Dio();
      final dio.Response response =
          await dioInstance.get(TedikapApiRepository().getSnack);

      if (response.statusCode == 200) {
        final List<dynamic> snackList = response.data["data"];
        snacksSeries.value =
            snackList.map((json) => Product.fromJson(json)).toList();
        print(snacksSeries.value[0].name);
      } else {
        print("Failed to fetch snacks. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error while fetching snacks: $error");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getNonTeaSeries() async {
    try {
      isLoading.value = true;
      final dio.Dio dioInstance = dio.Dio();
      final dio.Response response =
          await dioInstance.get(TedikapApiRepository().getNonTea);

      if (response.statusCode == 200) {
        final List<dynamic> nonTeaList = response.data["data"];
        nonTeaSeries.value =
            nonTeaList.map((json) => Product.fromJson(json)).toList();
        print(nonTeaSeries.value[0].name);
      } else {
        print("Failed to fetch nonTea. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error while fetching nonTea: $error");
    } finally {
      isLoading.value = false;
    }
  }
  
  Future<void> getMilkSeries() async {
    try {
      isLoading.value = true;
      final dio.Dio dioInstance = dio.Dio();
      final dio.Response response =
          await dioInstance.get(TedikapApiRepository().getMilk);

      if (response.statusCode == 200) {
        final List<dynamic> milkList = response.data["data"];
        milkSeries.value =
            milkList.map((json) => Product.fromJson(json)).toList();
        print(milkSeries.value[0].name);
      } else {
        print("Failed to fetch milk. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error while fetching milk: $error");
    } finally {
      isLoading.value = false;
    }
  }
  

  
}
