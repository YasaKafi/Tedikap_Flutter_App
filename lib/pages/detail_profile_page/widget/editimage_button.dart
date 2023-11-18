import 'package:flutter/material.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';

class EditImageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const EditImageButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: () {},
      child: Icon(Icons.edit, color: ColorResources.black),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(10),
        backgroundColor: ColorResources.white,
      ),
    );
  }
}
