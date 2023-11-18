import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/pages/detail_profile_page/widget/custom_textfield.dart';
import 'package:tedikap_flutter_app/pages/detail_profile_page/widget/editimage_button.dart';
import 'package:tedikap_flutter_app/pages/detail_profile_page/widget/save_button.dart'; // Sesuaikan path sesuai struktur proyek Anda
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';
import 'package:tedikap_flutter_app/utils/dimensions.dart';

class DetailProfile extends StatelessWidget {
  const DetailProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorResources.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Detail",
          style: titleAppBarProductrStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, color: ColorResources.black),
        ),
        backgroundColor: ColorResources.gold,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              Container(
                width: screenWidth,
                height: screenHeight * 0.3,
                color: ColorResources.gold,
                
              ),
              Positioned(
                top: screenHeight * 0.3,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeLarge),
                  width: screenWidth,
                  height: screenHeight * 0.7,
                  color: ColorResources.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 100),
                      CustomTextField(
                        hintText: 'Username',
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 30),
                      CustomTextField(
                        hintText: 'Email',
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 30),
                      CustomTextField(
                        hintText: 'Tanggal Lahir',
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 30),
                      CustomTextField(
                        hintText: 'Jenis Kelamin',
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 30),
                      CustomTextField(
                        hintText: 'Nomor Ponsel',
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 30),
                      Container(
                        margin: EdgeInsets.only(top: Dimensions.marginSizeExtraLarge),
                        child:SaveButton(
                          onPressed: () {
                            print('Tombol Simpan Ditekan');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 160),
                      width: 190,
                      height: 190,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorResources.grey,
                      ),
                      child: Center(
                        child: Icon(Icons.person,
                            size: 80, color: ColorResources.primaryColor),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.36,
                          left: screenHeight * 0.07),
                      child: EditImageButton(
                        onPressed: () {
                          print('Edit Image Button Pressed!');
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
