import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/repositories/movie_repository.dart';

import '../models/product_response_model.dart';

class ApiController extends GetxController {
  var teaSeries = <Product>[].obs;
  var snacksSeries = <Product>[].obs;

  var isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    getTeaSeries();
    getSnackSeries();
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
}

