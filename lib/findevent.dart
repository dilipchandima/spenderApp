import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spender/main.dart';

class FindEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              HexColor("#2CC8FD"),
              HexColor("#0F9CF1"),
              HexColor("#0B87E4"),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 100),
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: MyHomePage(), type: PageTransitionType.fade));
              },
            ),
          ],
        ),
      ),
    );
  }
}
