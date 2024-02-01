// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/pages/history_page/controller/history_controller.dart';
import 'package:tedikap_flutter_app/pages/history_page/widget/box_history.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);
  final HistoryController controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Center(
                    child: Text(
                  'Riwayat Pembelian',
                  style: historyPageStyle(
                      color: primaryColor,
                      weight: FontWeight.w600,
                      fontSize: 20),
                )),
                SizedBox(height: 40),
                Container(
                  width: screenWidth,
                  height: screenHeight,
                  child:  controller.historyItems.isEmpty
                      ? Center(
                          child: Text(
                            'Anda belum pernah memesan produk',
                            style: historyPageStyle(
                      color: primaryColor,
                      weight: FontWeight.w600,
                      fontSize: 14),
                          ),
                        )
                      : ListView.builder(
                          itemCount: controller.historyItems.length,
                          itemBuilder: (context, index) {
                            final historyItems = controller.historyItems[index];
                            List<String> titles = [];
                            for (var cartItem in controller.historyItems) {
                              titles.add(cartItem.title);
                            }
                            return BoxHistory(
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                              date: historyItems.date,
                              time: historyItems.time,
                              priceTotal: historyItems.price,
                              titles: titles,
                            );
                          },
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
