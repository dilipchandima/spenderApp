import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';

class SpendRow extends StatelessWidget {
  IconData icon;
  String title;

  SpendRow({IconData icon, String title}) {
    this.icon = icon;
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          bottom: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: HexColor("#0F9CF1"),
                        style: BorderStyle.solid,
                        width: 1.5,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(
                        icon,
                        color: HexColor("#0F9CF1"),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'from comment',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Text(
              'Rs 2800.00',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w900),
            )
          ],
        ),
      ),
    );
  }
}
