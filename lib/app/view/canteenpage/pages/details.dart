import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class details extends StatefulWidget {
  const details({super.key});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            Image.asset(
              "assets/canteen/salad1.jpeg",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 10.0,),
            Text("Macaroni Chickpea Salad"),
          ],
        ),
      ),
    );
  }
}
