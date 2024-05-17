import 'package:flutter/material.dart';
import 'package:ui_for_college/app/controller/auth/widgets/notification.dart';
import 'package:ui_for_college/app/controller/auth/widgets/welcomescreen.dart';
import 'package:ui_for_college/app/model/add.dart';
import 'package:ui_for_college/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>("data");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseAuths().initNotifications();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
