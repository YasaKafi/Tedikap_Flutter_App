// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/pages/cart_page/controller/cart_controller.dart';
import 'package:tedikap_flutter_app/pages/history_page/view/history_page.dart';
import 'package:tedikap_flutter_app/pages/navigator_page/controller/navbar_controller.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';

import '../../home_page/view/home_page.dart';
import '../../profile_page/view/profile_page.dart';
import '../../search_page/view/search_page.dart';

class BottomNavBar extends StatelessWidget {
  final BottomNavigationController controller =
      Get.put(BottomNavigationController());
      final CartController cartController = Get.put(CartController());

  final List<Widget> pages = [
    HomePage(),
     SearchPage(),
     HistoryPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          selectedItemColor: ColorResources.gold,
          backgroundColor: ColorResources.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
