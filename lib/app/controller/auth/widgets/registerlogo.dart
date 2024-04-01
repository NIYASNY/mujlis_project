import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegisterLogo extends StatelessWidget {
  const RegisterLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70,
        ),
        Lottie.network(
            height: 150,
            'https://lottie.host/eaeba462-2842-40c2-a8d0-86e02117eaa2/Nt2GWzGGTS.json'),

        // Icon(
        //   Icons.lock,
        //   size: 100,
        // )
        // Image.network(
        //   "https://www.48hourslogo.com/48hourslogo_data/2015/07/15/201507151540519778.jpg",
        //   width: 180,
        // ),

        // Icon(
        //   Icons.circle_notifications_rounded,
        //   size: 60,
        // )
      ],
    );
  }
}
