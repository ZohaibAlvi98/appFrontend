import 'package:flutter/material.dart';

class Tv extends StatefulWidget {
  @override
  _TvState createState() => _TvState();
}

class _TvState extends State<Tv> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'tv',
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}
