import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_for_college/app/modules/home/controller/authcontroller.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.put(AuthController());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                "https://www.48hourslogo.com/48hourslogo_data/2015/07/15/201507151540519778.jpg"), // Your app logo image widget goes here
            // Example: Image.asset('assets/images/logo.png'),

            SizedBox(height: 20),
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
