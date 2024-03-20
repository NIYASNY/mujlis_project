import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ui_for_college/app/authentication/widgets/detailspage.dart';
import 'package:ui_for_college/app/authentication/widgets/drawer.dart';
import 'package:ui_for_college/app/utils/constants.dart';
import 'package:ui_for_college/app/widgets/profileview.dart';
import 'package:ui_for_college/app/widgets/seeallpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        letIndexChange: (index) => true,
        backgroundColor: Colors.white,
        color: Color.fromARGB(255, 5, 226, 78),
        animationDuration: Duration(milliseconds: 300),
        items: [
          Icon(CupertinoIcons.home),
          Icon(CupertinoIcons.search),
          Icon(CupertinoIcons.person),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 5, 226, 78),
      drawer: Drawer(
        backgroundColor: Colors.amber,
      ),

      // drawer: EndDrawer(),
      // endDrawer: EndDrawer(),
      body: Container(
        child: SafeArea(
          child: Container(
            child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: firestore
                    .collection('users')
                    .doc(authcontroller.user!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hi, Amal!',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "16 March 2024",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            CircleAvatar(
                              child: IconButton(
                                onPressed: () {
                                  Get.off(() => EndDrawer());
                                },
                                icon: Icon(Icons.person),
                              ),
                            ),
                            // CircleAvatar(

                            //   // backgroundImage: NetworkImage(
                            //   //     "https://hips.hearstapps.com/hmg-prod/images/lionel-messi-celebrates-after-their-sides-third-goal-by-news-photo-1686170172.jpg"),
                            //   // radius: 24,
                            // ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 25,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       color: Colors.black,
                      //     ),
                      //     padding: EdgeInsets.all(12),
                      //     child: Row(
                      //       children: [
                      //         Icon(
                      //           Icons.search,
                      //           color: Colors.white,
                      //         ),
                      //         SizedBox(
                      //           width: 10,
                      //         ),
                      //         Text(
                      //           'Search',
                      //           style: TextStyle(color: Colors.white),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 50,
                      ),
                      Expanded(
                          child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        child: Container(
                          color: Colors.white,
                          child: Center(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30, top: 20),
                                      child: Text(
                                        "Features",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 25, top: 20),
                                      child: TextButton(
                                        child: Text(
                                          "See all",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Seeall()));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _buildSquare(
                                          Icons.business,
                                          'Office',
                                        ),
                                        _buildSquare(
                                          Icons.people,
                                          'Staff',
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _buildSquare(Icons.group, 'Union'),
                                        _buildSquare(Icons.apartment, 'Hostel'),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _buildSquare(Icons.book, 'Library'),
                                        _buildSquare(Icons.fastfood, 'Canteen'),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _buildSquare(
                                            Icons.account_balance, 'Bank'),
                                        _buildSquare(Icons.more_horiz, 'More'),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ))
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}

Widget _buildSquare(
  IconData icon,
  String title,
  // final onTap,
) {
  return GestureDetector(
    // onTap: onTap,
    child: Card(
      color: Colors.white, // Changed card color
      child: Container(
        width: 150,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.black,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
