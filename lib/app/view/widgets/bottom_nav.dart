import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_for_college/app/view/bankscreens/bankhome.dart';
import 'package:ui_for_college/app/view/libraryscreen/library_home.dart';
import 'package:ui_for_college/app/view/widgets/homepage.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int myindex = 0;
  List<Widget> icons = [
    const Icon(CupertinoIcons.home),
    const Icon(CupertinoIcons.search),
    const Icon(CupertinoIcons.person),
  ];
  List<Widget> screens = [
    HomePage(),
    const LibraryScreenHome(),
    const BankHome(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      body: screens[myindex],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          letIndexChange: (index) => true,
            backgroundColor: Colors.transparent,
            animationDuration:
                const Duration(milliseconds: 300), //default is 600
            onTap: (index) {
              setState(
                () {
                  myindex = index;
                },
              );
            },
            items: icons),
      ),
    );
  }
}
