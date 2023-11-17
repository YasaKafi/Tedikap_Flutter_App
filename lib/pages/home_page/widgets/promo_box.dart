import 'package:flutter/material.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';
import 'package:tedikap_flutter_app/utils/images.dart';

class PromoBoxWidget extends StatelessWidget {
  const PromoBoxWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      margin: EdgeInsets.only(top: 10),
      height: screenHeight * 0.51,
      padding: EdgeInsets.only(left: 20, right: 20),
      color: ColorResources.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jajan Makin Hemat',
            style: promoTextStyle(
                fontSize: 16, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Dapatkan diskon dan harga spesial hanya dengan melakukan pemesanan di App Tedikap',
            style: promoTextStyle(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: screenHeight * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorResources.black,
                image: DecorationImage(
                    image: AssetImage(Images.promo1),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: screenHeight * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorResources.black,
                image: DecorationImage(
                    image: AssetImage(Images.promo2),
                    fit: BoxFit.cover)),
          ),
        ],
      ),
    );
  }
}

class PromoBox2Widget extends StatelessWidget {
  const PromoBox2Widget({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      height: screenHeight * 0.32,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: ColorResources.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHeight * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage(Images.promo1),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              'Dapatkan Potongan Sebesar Rp.20.000',
              style: promoTextStyle(
                  fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Potongan Harga ini hanya berlaku bagi Anak-anak kelas 12 yang sebentar lagi akan lulus dari sekolah',
              style: promoTextStyle(
                  fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              'S&K Berlaku',
              style: promoTextStyle(
                  fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
