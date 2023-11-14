import 'package:flutter/material.dart';
import 'package:tedikap_flutter_app/pages/detail_profile_page/widget/custom_textfield.dart';
import 'package:tedikap_flutter_app/pages/detail_profile_page/widget/editimage_button.dart';
import 'package:tedikap_flutter_app/pages/detail_profile_page/widget/save_button.dart'; // Sesuaikan path sesuai struktur proyek Anda
import 'package:tedikap_flutter_app/utils/color_resources.dart';
import 'package:tedikap_flutter_app/utils/dimensions.dart';

class DetailProfile extends StatelessWidget {
  const DetailProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.gold,
      appBar: AppBar(
        title: const Text("Detail Profile"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 180),
                  padding: const EdgeInsets.all(10),
                  width: 430,
                  height: 515,
                  decoration: BoxDecoration(
                    color: ColorResources.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 100),
                      CustomTextField(
                        hintText: 'Username',
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 25),
                      CustomTextField(
                        hintText: 'Email',
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 25),
                      CustomTextField(
                        hintText: 'Tanggal Lahir',
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 25),
                      CustomTextField(
                        hintText: 'Jenis Kelamin',
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 25),
                      CustomTextField(
                        hintText: 'Nomor Ponsel',
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(top: 90),
                    width: 190,
                    height: 190,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorResources.grey,
                    ),
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: ColorResources.grey,
                      child: Icon(Icons.person, size: 80, color: ColorResources.primaryColor),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.28),
                    child: EditImageButton(
                      onPressed: () {
                        print('Edit Image Button Pressed!');
                      },
                    ),
                  ),
                ),
              ],
            ),
              SaveButton(
              onPressed: () {
                  print('Tombol Simpan Ditekan');
              },
            ),
          ],
        ),
      ),
    );
  }
}
