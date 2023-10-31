import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
     

      child: Center(
       
        child: Text(
          "Detail Product",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        
      ),
    );
  }
}