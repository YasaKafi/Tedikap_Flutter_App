

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/pages/history_page/controller/history_controller.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';

class BoxHistory extends StatelessWidget {
  const BoxHistory({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
    required this.date,
    required this.time,
    required this.titles, // Menambahkan parameter untuk daftar judul
    required this.priceTotal,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;
  final String date;
  final String time;
  final List<String> titles; // Menggunakan List<String> untuk menangani lebih dari satu judul
  final int priceTotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight * 0.15,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${date} | ${time}',
                    style: historyPageStyle(
                        color: ColorResources.grey,
                        weight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 200,
                    height: 50,
                    child: ListView.builder(
                      itemCount: titles.length,
                      itemBuilder: (context, index) {
                        final title = titles[index];
                        return ListProductHistory(title: title);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Tedikap RUS',
                        style: historyPageStyle(
                            color: primaryColor,
                            weight: FontWeight.w400,
                            fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    priceTotal.toString(),
                    style: historyPageStyle(
                        color: ColorResources.greyBold,
                        weight: FontWeight.w600,
                        fontSize: 18),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 90.43,
                    height: 38.08,
                    decoration: ShapeDecoration(
                      color: Color(0xFF324A59),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Order',
                        style: historyPageStyle(
                            color: ColorResources.white,
                            weight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            height: 2,
            thickness: 2,
            color: ColorResources.greySemi,
          )
        ],
      ),
    );
  }
}


class ListProductHistory extends StatelessWidget {
  const ListProductHistory({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.coffee,
            size: 20,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: historyPageStyle(
                color: primaryColor,
                weight: FontWeight.w400,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}
