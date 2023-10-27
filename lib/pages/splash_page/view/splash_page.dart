// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:tedikap_flutter_app/pages/splash_page/controller/splash_controller.dart';

class SplashPage extends StatelessWidget {
   SplashPage({Key? key}) : super(key: key);
  final SplashController splashController = SplashController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Splash"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [Text('Ini Splash Page')],
          ),
        ),
      ),
    );
  }
}
