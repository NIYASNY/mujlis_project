import 'package:flutter/material.dart';

class ImageLogo extends StatelessWidget {
  const ImageLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Image.network(
          "https://www.48hourslogo.com/48hourslogo_data/2015/07/15/201507151540519778.jpg",
          width: 150,
        ),

        // Icon(
        //   Icons.circle_notifications_rounded,
        //   size: 60,
        // )
      ],
    );
  }
}
