import 'package:get/get.dart';
import 'package:tedikap_flutter_app/data/datasource/api_controller.dart';

class DetailProductController extends GetxController {
  var apiController =
      Get.find<ApiController>(); // Mengambil instance dari ApiController

  RxInt quantity = 1.obs; // Jumlah
  Map<int, RxDouble?> totalPrices = {};

  RxDouble getProductPrice(int productId) {
    return totalPrices[productId] ?? 0.0.obs;
  }

  void increaseQuantity() {
    if (quantity < apiController.teaSeries.length) {
      quantity++;
      updateTotalPrice();
    }
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
      updateTotalPrice();
    }
  }

  void updateTotalPrice() {
    if (apiController.teaSeries.isNotEmpty) {
      for (int i = 0; i < apiController.teaSeries.length; i++) {
        double price = apiController.teaSeries[i].price!.toDouble();
        int? productId = apiController.teaSeries[i].id; // ID produk dari API
        if (productId != null) {
          // Memperbarui total harga produk
          totalPrices[productId]?.value = price * quantity.value;
        }
      }
    }
  }
}
