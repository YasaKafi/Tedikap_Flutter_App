
import 'package:get/get.dart';

import '../controller/detail_controller.dart';

class DetailProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProductController>(() => DetailProductController());
  }
}
