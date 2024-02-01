import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tedikap_flutter_app/data/models/cart_item_model.dart';
import 'package:tedikap_flutter_app/data/models/product_response_model.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';

import '../../../data/datasource/cart_database_local.dart';

class CartController extends GetxController {

  @override
void onInit() async {
  super.onInit();
  await getCartItemsFromDatabase(); // Tambahkan baris ini untuk mengambil data dari database saat inisialisasi
}

  var cartItems = <CartItem>[].obs;
  RxInt selectedPayment = 0.obs;
  RxString selectedPaymentName = ''.obs;

  void setSelectedPayment(int index, String paymentName) {
    selectedPayment.value = index;
    selectedPaymentName.value = paymentName;
  }

  Future<void> getCartItemsFromDatabase() async {
  final cartRepository = CartRepository();
  final cartItems = await cartRepository.getCartItems();
  this.cartItems.value = cartItems;
}
  
  int getTotalPrice() {
    int totalPrice = 0;
    for (CartItem cartItem in cartItems) {
      totalPrice += cartItem.price * cartItem.quantity;
    }
    return totalPrice;
  }

  void addToCart(CartItem item) async {
  final cartRepository = CartRepository();
  await cartRepository.addCartItem(item);
  cartItems.add(item);
}

  Future<void> removeItemFromDatabase(int index) async {
  final cartRepository = CartRepository();
  await cartRepository.deleteCartItem(cartItems[index].id); // Panggil metode deleteCartItem dari CartRepository
  cartItems.removeAt(index);
}

  Future<bool?> showDeleteConfirmationDialog(BuildContext context) async {
    return await Get.defaultDialog(
      title: 'Konfirmasi',
      titleStyle: cartPageStyle(
          color: primaryColor, weight: FontWeight.w600, fontSize: 20),
      middleText: 'Apakah Anda yakin ingin menghapus item ini?',
      middleTextStyle: cartPageStyle(
          color: primaryColor, weight: FontWeight.w400, fontSize: 16),
      actions: [
        Center(
          child: TextButton(
            onPressed: () => Get.back(result: false),
            child: Text(
              'Batal',
              style: cartPageStyle(
                  color: ColorResources.lightSkyBlue,
                  weight: FontWeight.w400,
                  fontSize: 14),
            ),
          ),
        ),
        Center(
          child: TextButton(
            onPressed: () => Get.back(result: true),
            child: Text(
              'Hapus',
              style: cartPageStyle(
                  color: ColorResources.red,
                  weight: FontWeight.w400,
                  fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }

  String formatPrice(double price) {
    var formattedPrice =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(price);
    return formattedPrice.replaceAll(",00", "");
  }
}
