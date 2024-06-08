import 'package:flutter/material.dart';
import 'package:ui_for_college/app/utils/constants.dart'; 


//drawer page
class EndDraweruser extends StatelessWidget {
  const EndDraweruser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userEmail = authcontroller.user?.email ??
        'No Email'; 

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            color: PrimaryColor,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/user.jpg'),
                ),
                SizedBox(height: 10),
                Text(
                  'Hi User!', 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userEmail, 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              // Navigate to profile page
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Navigate to settings page
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              authcontroller.signOut();
            },
          ),
        ],
      ),
    );
  }
}
