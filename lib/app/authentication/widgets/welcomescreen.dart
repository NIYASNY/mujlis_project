
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_for_college/app/auth/controller/authcontroller.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Get.put(AuthController());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TodoLogo(),
            Padding(padding:  EdgeInsets.all(8.0),
            child: SizedBox(
              width: 50,
              child: LinearProgressIndicator(),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
