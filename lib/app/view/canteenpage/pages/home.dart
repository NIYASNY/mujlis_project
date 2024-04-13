import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_for_college/app/view/canteenpage/widgets/widget_support.dart';

class CanteenHome extends StatefulWidget {
  const CanteenHome({super.key});

  @override
  State<CanteenHome> createState() => _CanteenHomeState();
}

class _CanteenHomeState extends State<CanteenHome> {
  bool icecream = false, pizza = false, biriyani = false, burger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello Admin!", style: Appwidget.boldTextfeildStyle()),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Delicious Food",
              style: Appwidget.HeadlineTextfeildStyle(),
            ),
            Text(
              "Discover and Get Great Food",
              style: Appwidget.LightTextfeildStyle(),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //...icecream...
                GestureDetector(
                  onTap: () {
                    icecream = true;
                    pizza = false;
                    biriyani = false;
                    burger = false;
                    setState(() {});
                  },
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: icecream ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(8),
                      child: Image.asset(
                        "assets/ice-cream.png",
                        height: 50,
                        width: 40,
                        fit: BoxFit.cover,
                        color: icecream ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                //.....pizza......
                GestureDetector(
                  onTap: () {
                    icecream = false;
                    pizza = true;
                    biriyani = false;
                    burger = false;
                    setState(() {});
                  },
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: pizza ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(8),
                      child: Image.asset(
                        "assets/icons8-pizza-50.png",
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                        color: pizza ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),

                //....burger....//
                GestureDetector(
                  onTap: () {
                    icecream = false;
                    pizza = false;
                    biriyani = false;
                    burger = true;
                    setState(() {});
                  },
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: burger ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(8),
                      child: Image.asset(
                        "assets/icons8-burger-80.png",
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                        color: burger ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),

                //...biriyani...//
                GestureDetector(
                  onTap: () {
                    icecream = false;
                    pizza = false;
                    biriyani = true;
                    burger = false;
                    setState(() {});
                  },
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: biriyani ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(8),
                      child: Image.asset(
                        "assets/biryani.png",
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                        color: biriyani ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
