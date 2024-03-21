import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_for_college/app/utils/constants.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            alignment: Alignment.bottomLeft,
            color: PrimaryColor,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.check_circle,
                  size: 60,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${authcontroller.user!.email}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          ListTile(
            onTap: () {
              authcontroller.signOut();
            },
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
          )
        ],
      ),
    );
  }
}
