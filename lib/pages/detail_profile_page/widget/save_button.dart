import 'package:flutter/material.dart';
import 'package:tedikap_flutter_app/utils/color_resources.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SaveButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorResources.gold, 
        minimumSize: Size(437, 61), 
      ),
      child: Text(
        'Simpan',
        style: TextStyle(
          color: Colors.white, // Warna teks tombol
        ),
      ),
    );
  }
}
