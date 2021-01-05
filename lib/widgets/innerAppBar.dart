import 'package:flutter/material.dart';

Widget Appbar(context) {
  double height =
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

  return AppBar(
    actions: [
      IconButton(
          padding: EdgeInsets.only(right: 20, bottom: 10),
          icon: new Image.asset(
            'assets/images/bag.png',
            height: 30,
          ),
          onPressed: () {})
    ],
    toolbarHeight: 60,
    elevation: 0,
    backgroundColor: Colors.white12,
    automaticallyImplyLeading: false,
    title: Padding(
      padding: const EdgeInsets.only(left: 1.0),
      child: Image.asset(
        'assets/images/home3.png',
        height: height * 40,
        width: 160,
      ),
    ),
  );
}
