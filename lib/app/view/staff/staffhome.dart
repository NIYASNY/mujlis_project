import 'package:flutter/material.dart';
import 'package:ui_for_college/app/view/staff/nonstaffpage.dart';
import 'package:ui_for_college/app/view/staff/staffcook.dart';
import 'package:ui_for_college/app/view/staff/staffsecurity.dart';
import 'package:ui_for_college/app/view/staff/staffteachers.dart';

class StaffHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Majlis Office'),
      ),
      body: GridView.count(crossAxisCount: 2, children: [
        _buildCard(context, 'Staff', StaffTeachersPage()),
        _buildCard(context, 'Non-Staff', OfficeNonStaffPage()),
        _buildCard(context, 'StaffSecurity', StaffSecurityPage()),
        _buildCard(context, 'StaffCook', StaffCookPage()),
      ]),
    );
  }

  Widget _buildCard(BuildContext context, String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Card(
        margin: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
