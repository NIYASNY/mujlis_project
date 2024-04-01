import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70,
        ),
        Lottie.network(
            height: 130,
            'https://lottie.host/818e8a35-47db-4c11-a479-858f7402f625/sEh1OyYWvs.json'),
      ],
    );
  }
}
