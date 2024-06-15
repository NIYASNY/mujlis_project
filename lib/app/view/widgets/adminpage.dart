import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_for_college/app/controller/auth/widgets/drawer.dart';
import 'package:ui_for_college/app/controller/bloc/adminhome/bloc/adminhome_bloc.dart';
import 'package:ui_for_college/app/controller/bloc/adminhome/bloc/adminhome_event.dart';
import 'package:ui_for_college/app/controller/bloc/adminhome/bloc/adminhome_state.dart';
import 'package:ui_for_college/app/utils/constants.dart';
import 'package:ui_for_college/app/view/bankwidgets/bottomnavigation.dart';
import 'package:ui_for_college/app/view/canteenpage/pages/home.dart';
import 'package:ui_for_college/app/view/hostel/hostel_page.dart';
import 'package:ui_for_college/app/view/libraryscreen/library_home.dart';
import 'package:ui_for_college/app/view/office/officehome.dart';
import 'package:ui_for_college/app/view/staff/staffhome.dart';
import 'package:ui_for_college/app/view/union/unionhome.dart';
import 'package:ui_for_college/app/view/widgets/getmonth.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({
    Key? key,
  }) : super(key: key);

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
  int index = 1;
  bool showText1 = false;
  bool showText2 = false;
  bool showFeatures = false;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      showText1 = true;
    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      showText2 = true;
    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      showFeatures = true;
    });
  }

  final items = const [
    Icon(
      CupertinoIcons.home,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      CupertinoIcons.settings,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      CupertinoIcons.person,
      size: 30,
      color: Colors.white,
    ),
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
                setState(() {
                  index = value;
                });
              },
              letIndexChange: (index) => true,
              backgroundColor: Colors.transparent,
              height: 70,
              color: Colors.blue.shade900, // Dark blue color
              animationDuration: Duration(milliseconds: 300),
              items: items,
              index: index,
            ),
            drawer: Drawer(
              backgroundColor: Colors.blue.shade700, // Light blue color
            ),
            body: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF0088FF), // Blue color
                      Color(0xFF00FF88), // Green color
                    ], // Dark and light blue gradient
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
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
                    return SingleChildScrollView(
                      child: Column(
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
                                    AnimatedOpacity(
                                      opacity: showText1 ? 1.0 : 0.0,
                                      duration: Duration(seconds: 1),
                                      child: Text(
                                        'Hi, Admin!',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    AnimatedOpacity(
                                      opacity: showText2 ? 1.0 : 0.0,
                                      duration: Duration(seconds: 1),
                                      child: Text(
                                        "${DateTime.now().day} ${getMonth(DateTime.now().month)} ${DateTime.now().year}",
                                        style: TextStyle(color: Colors.white),
                                      ),
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
                                    backgroundImage:
                                        AssetImage('assets/admin.png'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 50),
                          AnimatedOpacity(
                            opacity: showFeatures ? 1.0 : 0.0,
                            duration: Duration(seconds: 1),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40)),
                              child: Container(
                                color: Colors.white,
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Features",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(height: 20),
                                    _buildFeatureRows(context),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeatureRows(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSquare(
              'assets/officeicon.png',
              'Office',
              () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OfficeHomePage()));
              },
            ),
            _buildSquare(
              'assets/staff.png',
              'Staff',
              () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StaffHomePage()));
              },
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSquare('assets/iconunion.png', 'Union', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => unionHomePage()));
            }),
            _buildSquare('assets/iconhostel.png', 'Hostel', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HostelHomePage()));
            }),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSquare('assets/library.png', 'Library', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LibraryScreenHome()));
            }),
            _buildSquare('assets/restaurant.png', 'Canteen', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CanteenHome()));
            }),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSquare('assets/bank.png', 'Bank', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BankBottom()));
            }),
            _buildSquare('assets/menu.png', 'More', () {}),
          ],
        ),
      ],
    );
  }

  Widget _buildSquare(String imagepath, String title, Function() ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Card(
        color: Colors.white,
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
}
