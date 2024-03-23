import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_for_college/app/controller/authcontroller.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _logoAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _logoAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.forward();
    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        Get.put(AuthController());
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _logoAnimation,
              child: Image.network(
                "https://www.48hourslogo.com/48hourslogo_data/2015/07/15/201507151540519778.jpg",
                height: 150,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 50,
                child: LinearProgressIndicator(),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Welcome to Your App',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
