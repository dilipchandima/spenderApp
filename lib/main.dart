import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spender/Animations/FadeAnimation.dart';
import 'package:spender/components/spend_row.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spender/findevent.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _scaleController;
  Animation<double> _scaleAnimation;

  bool hide = false;

  @override
  void initState() {
    super.initState();

    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 30.0).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.push(
                  context,
                  PageTransition(
                      child: FindEvent(), type: PageTransitionType.fade));
            }
          });
  }

  @override
  void dispose() {
    super.dispose();

    _scaleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses'),
        backgroundColor: HexColor("#2CC8FD"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {},
          )
        ],
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              HexColor("#2CC8FD"),
              HexColor("#0F9CF1"),
              HexColor("#0B87E4"),
              HexColor("#0B87E4"),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            FadeAnimation(
                1,
                Text(
                  'My Remain',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                )),
            FadeAnimation(
                1.2,
                Text(
                  'Rs 345890.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            FadeAnimation(
                2,
                Text(
                  'My all expences',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                )),
            FadeAnimation(
                2.2,
                Text(
                  'Rs 345890.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            SizedBox(
              height: 60,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Container(
                    width: double.infinity,
                    child: ListView(
                      children: [
                        SpendRow(
                          title: 'Car rental',
                          icon: Icons.car_rental,
                        ),
                        SpendRow(
                          title: 'Car rental',
                          icon: Icons.shopping_bag,
                        ),
                        SpendRow(
                          title: 'Car rental',
                          icon: Icons.unarchive,
                        ),
                        SpendRow(
                          title: 'Car rental',
                          icon: Icons.unarchive,
                        ),
                        SpendRow(
                          title: 'Car rental',
                          icon: Icons.unarchive,
                        ),
                        SpendRow(
                          title: 'Car rental',
                          icon: Icons.unarchive,
                        ),
                        SpendRow(
                          title: 'Car rental',
                          icon: Icons.unarchive,
                        ),
                        SpendRow(
                          title: 'Car rental',
                          icon: Icons.unarchive,
                        ),
                        SpendRow(
                          title: 'Car rental',
                          icon: Icons.unarchive,
                        ),
                        SpendRow(
                          title: 'Car rental',
                          icon: Icons.unarchive,
                        ),
                        SpendRow(
                          title: 'Car rental',
                          icon: Icons.unarchive,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          setState(() {
            hide = true;
          });
          _scaleController.forward();
        },
        child: AnimatedBuilder(
          animation: _scaleController,
          builder: (context, child) => Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              height: 60,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    HexColor("#2CC8FD"),
                    HexColor("#0F9CF1"),
                    HexColor("#0B87E4"),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue[200],
                    spreadRadius: 5.0,
                    blurRadius: 10.0,
                  )
                ],
              ),
              child: hide == false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "ADD",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ],
                    )
                  : Container(),
            ),
          ),
        ),
      ),
    );
  }
}
