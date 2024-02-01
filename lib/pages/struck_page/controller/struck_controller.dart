import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tedikap_flutter_app/data/models/cart_item_model.dart';
import 'package:tedikap_flutter_app/data/models/history_item_model.dart';
import 'package:tedikap_flutter_app/data/models/product_response_model.dart';
import 'package:tedikap_flutter_app/pages/cart_page/controller/cart_controller.dart';
import 'package:tedikap_flutter_app/pages/history_page/controller/history_controller.dart';
import 'package:uuid/uuid.dart';

class StruckController extends GetxController {
  RxString uniqueTransactionCode = ''.obs;
  RxString currentDate = ''.obs;
  RxString currentTime = ''.obs;
  RxString pickUpTime = ''.obs;

  @override
  void onInit() {
    super.onInit();
    generateUniqueTransactionCode();
    getCurrentDate();
    getCurrentTime();
    getSchedulePickUp();
  }

  void createStruck(
      List<CartItem> cartItems, String currentTime, String currentDate) {
    final historyController = Get.put(HistoryController());
    final cartController = Get.put(CartController());

    // Iterasi melalui setiap CartItem dan buat HistoryItem
    for (CartItem cartItem in cartItems) {
      historyController.createStruck(HistoryItem(
        title: cartItem.title!,
        price: cartController.getTotalPrice(),
        id: cartItem.id!,
        date: currentDate,
        time: currentTime,
      ));
    }
  }

  void generateUniqueTransactionCode() {
    Uuid uuid = Uuid();
    String fullUniqueCode = 'TEDIKAP' + uuid.v1();
    String truncatedCode = fullUniqueCode.substring(0, 8);
    uniqueTransactionCode.value = truncatedCode;
  }

  void getCurrentDate() {
    DateTime now = DateTime.now();
    currentDate.value = DateFormat('dd MMMM yyyy').format(now);
  }

  void getCurrentTime() {
    DateTime now = DateTime.now();
    currentTime.value = DateFormat('hh:mm a').format(now);
  }

  void getSchedulePickUp() {
    DateTime now = DateTime.now();
    DateTime newTime = now.add(Duration(minutes: 15));
    pickUpTime.value = DateFormat('hh:mm a').format(newTime);
    print('Pick up time: ${pickUpTime.value}');
  }
}
