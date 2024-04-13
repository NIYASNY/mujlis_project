import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ui_for_college/app/view/canteenpage/pages/home.dart';
import 'package:ui_for_college/app/view/canteenpage/pages/order.dart';
import 'package:ui_for_college/app/view/canteenpage/pages/profile.dart';
import 'package:ui_for_college/app/view/canteenpage/pages/wallet.dart';

class bottomnav extends StatefulWidget {
  const bottomnav({super.key});

  @override
  State<bottomnav> createState() => _bottomnavState();
}

class _bottomnavState extends State<bottomnav> {
  int currentTabIndex = 0;
  late List<Widget> pages;
  late Widget currentPage;
  late CanteenHome homePage;
  late profile profilepage;
  late order orderpage;
  late wallet walletpage;

  @override
  void initState() {
    homePage = CanteenHome();
    orderpage = order();
    profilepage = profile();
    walletpage = wallet();
    pages = [homePage, orderpage, walletpage, profilepage];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 65,
          backgroundColor: Colors.black,
          animationDuration: Duration(milliseconds: 500),
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          items: [
            Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.wallet_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
          ]),
      body: pages[currentTabIndex],
    );
  }
}
