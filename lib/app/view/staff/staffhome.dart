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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            _buildCard(context, 'Staff', StaffTeachersPage(), Colors.blue),
            _buildCard(
                context, 'Non-Staff', OfficeNonStaffPage(), Colors.green),
            _buildCard(
                context, 'Staff Security', StaffSecurityPage(), Colors.orange),
            _buildCard(context, 'Staff Cook', StaffCookPage(), Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      BuildContext context, String title, Widget page, Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: color,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
