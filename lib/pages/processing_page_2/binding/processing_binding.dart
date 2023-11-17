
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/pages/processing_page/controller/processing_controller.dart';
import 'package:tedikap_flutter_app/pages/processing_page_2/controller/processing_controller_two.dart';



class ProcessingBindingTwo extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProcessingControllerTwo>(
      () => ProcessingControllerTwo(),
    );
  }
}