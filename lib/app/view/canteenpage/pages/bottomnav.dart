// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:ui_for_college/app/view/canteenpage/pages/home.dart';
// import 'package:ui_for_college/app/view/canteenpage/pages/order.dart';
// import 'package:ui_for_college/app/view/canteenpage/pages/profile.dart';
// import 'package:ui_for_college/app/view/canteenpage/pages/wallet.dart';

// class bottomnav extends StatefulWidget {
//   const bottomnav({super.key});

//   @override
//   State<bottomnav> createState() => _bottomnavState();
// }

// class _bottomnavState extends State<bottomnav> {
//   int currentTabIndex = 0;
//   late List<Widget> pages;
//   late Widget currentPage;
//   late CanteenHome homePage;
//   late profile profilepage;
//   late order orderpage;
//   late wallet walletpage;

//   @override
//   void initState() {
//     homePage = CanteenHome();
//     orderpage = order();
//     profilepage = profile();
//     walletpage = wallet();
//     pages = [homePage, orderpage, walletpage, profilepage];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//           height: 65,
//           backgroundColor: Colors.black,
//           animationDuration: Duration(milliseconds: 500),
//           onTap: (int index) {
//             setState(() {
//               currentTabIndex = index;
//             });
//           },
//           items: [
//             Icon(
//               Icons.home_outlined,
//               color: Colors.white,
//             ),
//             Icon(
//               Icons.shopping_bag_outlined,
//               color: Colors.white,
//             ),
//             Icon(
//               Icons.wallet_outlined,
//               color: Colors.white,
//             ),
//             Icon(
//               Icons.person_outline,
//               color: Colors.white,
//             ),
//           ]),
//       body: pages[currentTabIndex],
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.green,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
