import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/pages/profile_page/widget/ListTileWidget.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/custom_themes.dart';
import 'package:tedikap_flutter_app/utils/dimensions.dart';
import 'package:tedikap_flutter_app/utils/images.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () { 
                Get.offNamed(Routes.DETAIL_PROFILE_PAGE);
              },
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: ColorResources.gold,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          child: SvgPicture.asset(
                            'assets/profile.svg',
                            width: 60,
                            height: 60,
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'YASA',
                                style: nameUserStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                '+6289525683801',
                                style: PhoneNumberStyle,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: ColorResources.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
            Container(
              width: 386,
              height: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorResources.white,
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(Images.CupPoint),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Diskon 50% Menunggumu!',
                        style: TextStyle(
                          color: ColorResources.gold,
                        ),
                      ),
                      Text(
                        'Ajak teman kamu download aplikasi Tedikap',
                        style: TextStyle(
                          color: ColorResources.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: Dimensions.marginSizeSmall,
              color: ColorResources.grey,  
              thickness: 3,
            ),
            MyListViewWidget(),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Butuh Bantuan?',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: 386,
              height: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorResources.white,
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),  
                    child: SvgPicture.asset(Images.Whatsappicon),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tedikap Customer Service ( chat only )',
                        style: TextStyle(
                          color: ColorResources.primaryColor,
                        ),
                      ),
                      Text(
                        '0895-2568-3801',
                        style: TextStyle(
                          color: ColorResources.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
