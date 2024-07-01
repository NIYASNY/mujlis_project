import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ui_for_college/app/controller/auth/widgets/drawer.dart';
import 'package:ui_for_college/app/controller/bloc/userhome/bloc/userhome_bloc.dart';
import 'package:ui_for_college/app/controller/bloc/userhome/bloc/userhome_event.dart';
import 'package:ui_for_college/app/controller/bloc/userhome/bloc/userhome_state.dart';
import 'package:ui_for_college/app/utils/constants.dart';
import 'package:ui_for_college/app/view/widgets/getmonth.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userhomebloc = UserHomeBloc();
  // int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => userhomebloc,
      child: BlocBuilder<UserHomeBloc, userHomeState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              onTap: (value) {
                userhomebloc.add(UpdateUserIndexEvent(value));
              },
              letIndexChange: (index) => true,
              backgroundColor: Colors.white,
              color: Colors.blueAccent,
              // color: Color.fromARGB(255, 5, 226, 78),
              animationDuration: Duration(milliseconds: 300),
              items: [
                Icon(CupertinoIcons.home),
                Icon(CupertinoIcons.search),
                Icon(CupertinoIcons.person),
              ],
            ),
            backgroundColor: Colors.blueAccent,
            drawer: Drawer(
              backgroundColor: Colors.amber,
            ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Hi, Amal!',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${DateTime.now().day} ${getMonth(DateTime.now().month)} ${DateTime.now().year}",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.off(() => EndDraweradmin());
                                    },
                                    child: CircleAvatar(
                                      radius: 20, // Adjust the radius as needed
                                      backgroundImage: AssetImage(
                                          'assets/user.jpg'), // Replace 'assets/profile_image.png' with the path to your profile image
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                                                'assets/officeicon.png',
                                                'Office',
                                                () {},
                                              ),
                                              _buildSquare(
                                                'assets/staff.png',
                                                'Staff',
                                                () {},
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              _buildSquare(
                                                  'assets/iconunion.png',
                                                  'Union',
                                                  () {},
                                                  ),
                                              _buildSquare(
                                                  'assets/iconhostel.png',
                                                  'Hostel',
                                                  () {},
                                                  ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              _buildSquare('assets/library.png',
                                                  'Library',
                                                  () {},
                                                  ),
                                              _buildSquare(
                                                  'assets/restaurant.png',
                                                  'Canteen',
                                                  () {},
                                                  ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              _buildSquare(
                                                  'assets/bank.png', 'Bank',
                                                  () {},),
                                              _buildSquare(
                                                  'assets/menu.png', 'More',() {},),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            )
                          ],
                        );
                      }),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
Widget _buildSquare(
  String imagepath,
  String title,
  Function() onTap,
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
            Image.asset(
              width: 50,
              height: 50,
              imagepath,
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
