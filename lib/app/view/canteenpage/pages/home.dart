import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_for_college/app/view/canteenpage/pages/bottomnav.dart';
import 'package:ui_for_college/app/view/canteenpage/pages/details.dart';
import 'package:ui_for_college/app/view/canteenpage/pages/order.dart';
import 'package:ui_for_college/app/view/canteenpage/pages/profile.dart';
import 'package:ui_for_college/app/view/canteenpage/pages/wallet.dart';
import 'package:ui_for_college/app/view/canteenpage/widgets/widget_support.dart';

class CanteenHome extends StatefulWidget {
  const CanteenHome({super.key});

  @override
  State<CanteenHome> createState() => _CanteenHomeState();
}

class _CanteenHomeState extends State<CanteenHome> {
  bool icecream = false, pizza = false, biriyani = false, burger = false;
  int _currentIndex = 0;

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
                  margin: EdgeInsets.only(right: 10.0),
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
            Container(margin: EdgeInsets.only(right: 20.0), child: showItem()),
            SizedBox(
              height: 20.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(4),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/canteen/salad1.jpg",
                              height: 160,
                              width: 160,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              'Veggie Patch Platter',
                              style: Appwidget.boldTextfeildStyle(),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Fresh and Flavorful',
                              style: Appwidget.LightTextfeildStyle(),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              '\$50',
                              style: Appwidget.boldTextfeildStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    margin: EdgeInsets.all(4),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/canteen/salad1.jpg",
                              height: 160,
                              width: 160,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              'Mixed veg salad',
                              style: Appwidget.boldTextfeildStyle(),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'spicy with tomato',
                              style: Appwidget.LightTextfeildStyle(),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              '\$60',
                              style: Appwidget.boldTextfeildStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              // margin: EdgeInsets.only(right: 5.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/canteen/salad1.jpg",
                        height: 160,
                        width: 160,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 20.0,
                        width: 5,
                      ),
                      Column(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Macaroni\nChickpea Salad",
                                style: Appwidget.boldTextfeildStyle(),
                              )),
                          Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "spicy with cheese",
                                style: Appwidget.LightTextfeildStyle(),
                              )),
                          Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "\$30",
                                style: Appwidget.boldTextfeildStyle(),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CanteenHome()));
              break;
            case 1:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => details()));
              break;
            case 2:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => wallet()));
              break;
            case 3:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => profile()));
              break;
            default:
              break;
          }
        },
      ),
    );
  }

  Widget showItem() {
    return Row(
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
    );
  }
}
