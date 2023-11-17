import 'package:get/get.dart';
import 'package:tedikap_flutter_app/data/models/history_item_model.dart';

class HistoryController extends GetxController {
  var historyItems = <HistoryItem>[].obs;

  void createStruck(HistoryItem item) {
    historyItems.add(item);
  }
}
