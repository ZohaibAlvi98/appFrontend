import 'package:flutter/material.dart';

class SplyNetwork extends StatefulWidget {
  @override
  _SplyNetworkState createState() => _SplyNetworkState();
}

class _SplyNetworkState extends State<SplyNetwork> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        's-ply network',
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}
