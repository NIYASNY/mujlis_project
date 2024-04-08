import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_for_college/app/controller/auth/widgets/drawer.dart';
import 'package:ui_for_college/app/controller/bloc/adminhome/bloc/adminhome_bloc.dart';
import 'package:ui_for_college/app/controller/bloc/adminhome/bloc/adminhome_event.dart';
import 'package:ui_for_college/app/controller/bloc/adminhome/bloc/adminhome_state.dart';
import 'package:ui_for_college/app/utils/constants.dart';
import 'package:ui_for_college/app/view/Canteen/canteen_home.dart';
import 'package:ui_for_college/app/view/bankwidgets/bottomnavigation.dart';
import 'package:ui_for_college/app/view/hostel/hostel_page.dart';
import 'package:ui_for_college/app/view/libraryscreen/library_home.dart';
import 'package:ui_for_college/app/view/office/officehome.dart';
import 'package:ui_for_college/app/view/staff/staffhome.dart';
import 'package:ui_for_college/app/view/union/unionhome.dart';
import 'package:ui_for_college/app/view/widgets/getmonth.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({
    super.key,
  });

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  void dispose() {
    adminPageBloc.close();
    super.dispose();
  }

  final adminPageBloc = AdminPageBloc();
  // int index = 0;

  List<Widget> featureScreens = [
    AdminPage(),
    OfficeHomePage(),
    StaffHomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => adminPageBloc,
      child: BlocBuilder<AdminPageBloc, AdminPageState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              onTap: (value) {
                adminPageBloc.add(UpdateIndexEvent(value));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => featureScreens[value]));
              },
              letIndexChange: (index) => true,
              backgroundColor: Colors.white,
              color: Colors.blueAccent,
              // color: Color.fromARGB(230, 27, 4, 230),
              animationDuration: Duration(milliseconds: 300),
              items: [
                Icon(CupertinoIcons.home),
                Icon(CupertinoIcons.search),
                Icon(CupertinoIcons.person)
              ],
            ),
            backgroundColor: Colors.blueAccent.withOpacity(0.9),
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
                                        'Hi, Admin!',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${DateTime.now().day} ${getMonth(DateTime.now().month)} ${DateTime.now().year}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EndDraweradmin()));
                                    },
                                    child: CircleAvatar(
                                      radius: 20, // Adjust the radius as needed
                                      backgroundImage: AssetImage(
                                          'assets/admin.png'), // Replace 'assets/profile_image.png' with the path to your profile image
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
                                        height: 10,
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
                                                () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              OfficeHomePage()));
                                                },
                                              ),
                                              //  SizedBox(height: 10,),
                                              _buildSquare(
                                                'assets/staff.png',
                                                'Staff',
                                                () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              StaffHomePage()));
                                                },
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              _buildSquare(
                                                  'assets/iconunion.png',
                                                  'Union', () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            unionHomePage()));
                                              }),
                                              _buildSquare(
                                                  'assets/iconhostel.png',
                                                  'Hostel', () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            HostelHomePage()));
                                              }),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              _buildSquare('assets/library.png',
                                                  'Library', () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LibraryScreenHome()));
                                              }),
                                              _buildSquare(
                                                  'assets/restaurant.png',
                                                  'Canteen', () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            CanteenHome()));
                                              }),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              _buildSquare(
                                                  'assets/bank.png', 'Bank',
                                                  () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            BankBottom()));
                                              }),
                                              _buildSquare('assets/menu.png',
                                                  'More', () {}),
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
        },
      ),
    );
  }
}

Widget _buildSquare(
  String imagepath,
  String title,
  Function() ontap,
  // final onTap,
) {
  return GestureDetector(
    onTap: ontap,
    child: Card(
      color: Colors.white, // Changed card color
      child: Container(
        width: 150,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagepath,
              width: 60,
              height: 60,
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
