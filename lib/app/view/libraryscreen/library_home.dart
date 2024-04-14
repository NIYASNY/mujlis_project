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
        body: Column(
          children: [
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
