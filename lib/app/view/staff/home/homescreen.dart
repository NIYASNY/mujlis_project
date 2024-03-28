import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_for_college/app/controller/studentmanagement/home/bloc/home_bloc.dart';
import 'package:ui_for_college/app/utils/constants.dart';
import 'package:ui_for_college/app/view/staff/home/addscreen.dart';
import 'package:ui_for_college/app/view/staff/student_list/student_screen.dart';
import 'home_widgets/cardmenu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentPage = DrawerSection.dashboard;
  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          if (state is HomeNavigateToAddingPageActionState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddStudentPage()));
            // GoRouter.of(context)
            //     .pushNamed(RoutingConstants.addstudentsRouteName);
          } else if (state is HomeNavigateToStudentListPageActionState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StudentsPage()));
            // GoRouter.of(context)
            //     .pushNamed(RoutingConstants.studentlistRouteName);
          }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Constants.homeTitleString,
              ),
              // drawer: const Drawer(),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CardWidget(
                        homeBloc: homeBloc,
                        path: Constants.addCardmenuImageLogo,
                        event: HomeNavigateToAddEvent(),
                        buttonText: Constants.addStudentString,
                      ),
                      CardWidget(
                        homeBloc: homeBloc,
                        event: HomeNavigateToStudentListEvent(),
                        path: Constants.viewCardmenuImageLogo,
                        buttonText: Constants.viewStudentString,
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          // menuItem()
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSection.dashboard ? true : false),
          menuItem(2, "Contacts", Icons.people_alt_outlined,
              currentPage == DrawerSection.contacts ? true : false),
          menuItem(3, "Events", Icons.event,
              currentPage == DrawerSection.events ? true : false),
          menuItem(4, "Settings", Icons.settings_outlined,
              currentPage == DrawerSection.settings ? true : false),
          menuItem(5, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSection.notifications ? true : false),
          menuItem(6, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSection.privacy_policy ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          // Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSection.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSection.contacts;
            } else if (id == 3) {
              currentPage = DrawerSection.events;
            } else if (id == 4) {
              currentPage = DrawerSection.settings;
            } else if (id == 5) {
              currentPage = DrawerSection.notifications;
            } else if (id == 6) {
              currentPage == DrawerSection.privacy_policy;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 6,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSection {
  dashboard,
  contacts,
  events,
  settings,
  notifications,
  privacy_policy
}
