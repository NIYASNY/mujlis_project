import 'package:flutter/material.dart';
import 'package:ui_for_college/app/view/libraryscreen/libraryscreen.dart';
import 'package:ui_for_college/app/view/libraryscreen/libraryscreensubhome.dart';

class LibraryScreenHome extends StatefulWidget {
  const LibraryScreenHome({super.key});

  @override
  State<LibraryScreenHome> createState() => _LibraryScreenHomeState();
}

class _LibraryScreenHomeState extends State<LibraryScreenHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('MAJLIS LIBRARY'),
          backgroundColor: Colors.blue[300],
          centerTitle: true,
        ),
        body: Column(
          children: [
            TabBar(tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.person,
                ),
              )
            ]),
            Expanded(
              child: TabBarView(children: [
                LibraryScreenSubHome(),
                LibraryScreenAcconut(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
