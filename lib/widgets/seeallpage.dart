import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Seeall extends StatefulWidget {
  const Seeall({super.key});

  @override
  State<Seeall> createState() => _SeeallState();
}

class _SeeallState extends State<Seeall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Text("Features"),
      ),
      backgroundColor: Colors.grey.shade300,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.green,
        animationDuration: Duration(milliseconds: 300),
        items: [
          Icon(Icons.home),
          Icon(Icons.featured_video),
          Icon(Icons.person),
        ],
      ),
      body: SafeArea(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSquare(Icons.group, 'Union'),
                  _buildSquare(Icons.apartment, 'Hostel'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSquare(Icons.book, 'Library'),
                  _buildSquare(Icons.fastfood, 'Canteen'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSquare(Icons.account_balance, 'Bank'),
                  _buildSquare(Icons.more_horiz, 'More'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSquare(Icons.book, 'Library'),
                  _buildSquare(Icons.fastfood, 'Canteen'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSquare(Icons.book, 'Library'),
                  _buildSquare(Icons.fastfood, 'Canteen'),
                ],
              ),
            ],
          )
        ]),
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
