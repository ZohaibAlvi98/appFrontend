import 'package:flutter/material.dart';

class Sneakers extends StatefulWidget {
  @override
  _SneakersState createState() => _SneakersState();
}

class _SneakersState extends State<Sneakers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'sneakers',
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}
