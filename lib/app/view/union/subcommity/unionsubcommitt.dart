import 'package:flutter/material.dart';
import 'package:ui_for_college/app/view/union/subcommity/unionfiners.dart';
import 'package:ui_for_college/app/view/union/subcommity/uniongardern.dart';
import 'package:ui_for_college/app/view/union/subcommity/unionliteracy.dart';
import 'package:ui_for_college/app/view/union/subcommity/unionprd.dart';
import 'package:ui_for_college/app/view/union/subcommity/unionresearch.dart';
import 'package:ui_for_college/app/view/union/subcommity/unionsocialafairs.dart';
import 'package:ui_for_college/app/view/union/subcommity/unionsports.dart';
import 'package:ui_for_college/app/view/union/subcommity/unionstore.dart';

//union subcommitte page
class UnionSubcommittee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sub-committees'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text('LIBRARY'),
              onTap: () {
                print('LITERARY selected');
              },
            ),
            ListTile(
              title: Text('FINE ARTS'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Unionfinearts(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('BANK'),
              onTap: () {
                print('SOCIAL AFFAIRS selected');
              },
            ),
            ListTile(
              title: Text('RESEARCH'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UnionResearch(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('GARDEN'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UnionGarden(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('LITERARY'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UnionLiterary(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('IT'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UnionPrd(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('SOCIAL AFFAIRS'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UnionSocialAffairs(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('STORE'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UnionStore(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('SPORTS'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UnionSports(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
