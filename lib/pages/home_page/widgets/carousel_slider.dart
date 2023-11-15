import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/pages/home_page/controller/home_controller.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';

class CarouselSliderWidget extends StatelessWidget {
   CarouselSliderWidget({
    super.key,
    required this.screenWidth,
    
    required this.carouselImageStrings,
    
  });

  final double screenWidth;
  final HomeController controller = Get.put(HomeController());
  final List carouselImageStrings;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60),
      width: screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Align(
              alignment: Alignment.center,
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration:
                      Duration(milliseconds: 600),
                  viewportFraction: 1.0,
                  aspectRatio: 23 / 9,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    controller.changeIndex(index);
                  },
                ),
                items: carouselImageStrings.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width:
                              MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(
                              horizontal: 5.0),
                          child: Image.asset(
                            i,
                            fit: BoxFit.fill,
                          ));
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    carouselImageStrings.map((imageString) {
                  int index =
                      carouselImageStrings.indexOf(imageString);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.currentIndex == index
                          ? ColorResources.gold
                          : ColorResources.grey,
                    ),
                  );
                }).toList(),
              );
            }),
          )
        ],
      ),
    );
  }
}