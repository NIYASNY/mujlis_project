import 'package:flutter/material.dart';

class Assetfolder extends StatelessWidget {
  final String imageside;
  const Assetfolder({super.key, required this.imageside});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200]),
      child: Image.asset(
        imageside,
        height: 35,
      ),
    );
  }
}
