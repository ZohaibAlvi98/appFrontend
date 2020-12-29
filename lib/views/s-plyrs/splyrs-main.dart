import 'package:flutter/material.dart';

class Splyrs extends StatefulWidget {
  @override
  _SplyrsState createState() => _SplyrsState();
}

class _SplyrsState extends State<Splyrs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Text(
          's-plyrs',
          style: TextStyle(fontSize: 20),
        )),
      ),
    );
  }
}
