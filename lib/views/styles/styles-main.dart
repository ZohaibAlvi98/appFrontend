import 'package:flutter/material.dart';

class Styles extends StatefulWidget {
  @override
  _StylesState createState() => _StylesState();
}

class _StylesState extends State<Styles> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'styles',
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}
