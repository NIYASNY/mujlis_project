import 'package:flutter/material.dart';
import 'package:ui_for_college/app/view/office/officestockpage.dart';
import 'package:ui_for_college/app/view/office/officestudentfee.dart';
import 'package:ui_for_college/app/view/office/studentadding.dart';
import 'package:ui_for_college/app/view/staff/nonstaffpage.dart';

class OfficeHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Majlis Office'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildCard(context, 'OfficeStaff', OfficeNonStaffPage()),
          _buildCard(context, 'Non-Staff', OfficeNonStaffPage()),
          _buildCard(context, 'New Admission', NewStudentForm()),
          _buildCard(context, 'Fee Details', OfficeStudentFee()),
          _buildCard(context, 'Stock', OfficeStockPage()),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, Widget page) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, page);
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
