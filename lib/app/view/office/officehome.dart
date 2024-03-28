import 'package:flutter/material.dart';
import 'package:ui_for_college/app/view/office/officestockpage.dart';
import 'package:ui_for_college/app/view/office/officestudentfee.dart';
import 'package:ui_for_college/app/view/office/studentadding.dart';
import 'package:ui_for_college/app/view/staff/home/homescreen.dart';
import 'package:ui_for_college/app/view/staff/nonstaffpage.dart';

class OfficeHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Majlis Office',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: [
            _buildAnimatedCard(context, 'Office Staff', Icons.people,
                OfficeNonStaffPage(), Colors.blue),
            _buildAnimatedCard(context, 'Non-Staff', Icons.person_outline,
                OfficeNonStaffPage(), Colors.green),
            _buildAnimatedCard(context, 'New Admission',
                Icons.add_circle_outline, HomeScreen(), Colors.orange),
            _buildAnimatedCard(context, 'Fee Details', Icons.attach_money,
                OfficeStudentFee(), Colors.purple),
            _buildAnimatedCard(
                context, 'Stock', Icons.store, OfficeStockPage(), Colors.teal),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedCard(BuildContext context, String title, IconData icon,
      Widget page, Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50.0,
              color: Colors.white,
            ),
            SizedBox(height: 10.0),
            Text(
              title,
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
