
import 'package:get/get.dart';

import '../view/detail_profile_page.dart';

class DetailProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProfile>(() => DetailProfile());
  }
}