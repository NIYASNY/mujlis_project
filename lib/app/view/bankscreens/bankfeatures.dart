import 'package:flutter/material.dart';
import 'package:ui_for_college/app/view/bankscreens/bankcards.dart';

//bank features
class BankFeatures extends StatefulWidget {
  const BankFeatures({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BankFeatures> createState() => _BankFeaturesState();
}

class _BankFeaturesState extends State<BankFeatures> {
  @override
  Widget build(BuildContext context) {
    final _controller = PageController();

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/backgroundimage(1).jpg",
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.54),
                BlendMode.darken,
              ),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 25,
                        height: 47,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      'Services',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: Icon(
                        Icons.explore_sharp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              Expanded(
                child: ListView(
                  children: [
                    Container(
                      height: 160,
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: _controller,
                        children: [
                          MyCard(
                            balance: 3455.34,
                            cardNumber: 87633245,
                            expiryMonth: 01,
                            expiryYear: 23,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.83),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(0.95),
                                  Colors.white.withOpacity(0.15),
                                ],
                              ),
                            ),
                            cardname: 'DEBIT',
                          ),
                          MyCard(
                            balance: 57565.34,
                            cardNumber: 324235464,
                            expiryMonth: 02,
                            expiryYear: 24,
                            cardname: 'CREDIT',
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFB4ADEDE),
                                  Color(0xFFF7BD5F5),
                                  Color(0xFFF1CA7EC),
                                  Color(0xFF155FEA),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0, 0.2, 0.5, 0.8],
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          MyCard(
                            balance: 645645,
                            cardNumber: 87923421343,
                            expiryMonth: 03,
                            expiryYear: 25,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 252, 170, 48),
                                  Color.fromARGB(255, 248, 178, 87),
                                  Color.fromARGB(255, 205, 76, 67),
                                  Color.fromARGB(255, 231, 111, 111),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0, 0.2, 0.5, 0.8],
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            cardname: 'LOAN',
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        "Schemes",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    // Schemes cards
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          // Replace InkWell with GestureDetector if needed
                          InkWell(
                            onTap: () {},
                            child: Card(
                              child: ListTile(
                                leading: Image.asset(
                                  "assets/Education.png",
                                ),
                                title: Text(
                                  'KURI',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  'Emerging Hand`s power With bolding inked mind filling ideas in paper',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Card(
                              child: ListTile(
                                leading: Image.asset(
                                  "assets/Transportation.png",
                                ),
                                title: Text(
                                  'FD (Fixed Deposit)',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                                subtitle: Text(
                                  'Unleashing The Most fentabulus Brains without fearing as Stone',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Card(
                              child: ListTile(
                                leading: Image.asset(
                                  "assets/Deposit.png",
                                ),
                                title: Text(
                                  'Coming Soon',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
