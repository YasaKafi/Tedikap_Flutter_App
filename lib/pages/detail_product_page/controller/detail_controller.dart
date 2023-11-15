import 'package:get/get.dart';
import 'package:tedikap_flutter_app/data/datasource/api_controller.dart';
import 'package:tedikap_flutter_app/data/models/cart_item_model.dart';
import 'package:tedikap_flutter_app/data/models/product_response_model.dart';
import 'package:tedikap_flutter_app/pages/cart_page/controller/cart_controller.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';

class DetailProductController extends GetxController {
  RxInt quantity = 1.obs;
  RxInt totalItemPrice = 0.obs;

  void resetquantity() async {
    await Future.delayed(Duration(seconds: 2));
    quantity.value = 1;
  }

  void incrementQuantity() {
    quantity.value++;
  }

  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  void addToCart(Product product) {
  final cartController = Get.put(CartController());
  final existingItem = cartController.cartItems.firstWhereOrNull((item) => item.id == product.id);

  if (existingItem != null) {
    // Produk sudah ada di keranjang, tingkatkan kuantitas dan perbarui total harga
    existingItem.quantity += quantity.value;
    existingItem.totalItemPrice = existingItem.price * existingItem.quantity;
  } else {
    // Produk belum ada di keranjang, tambahkan sebagai item baru
    cartController.addToCart(CartItem(
      title: product.name!,
      price: product.price!,
      quantity: quantity.value,
      image: product.imageUrl!,
      id: product.id!,
      totalItemPrice: product.price! * quantity.value,
    ));
  }

  resetquantity();
  Get.toNamed(Routes.CART_PAGE);
}

}
