import 'package:flutter/material.dart';
import 'package:splyxp/widgets/innerAppBar.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(context),
      body: Container(
        child: Center(
          child: Text('hey'),
        ),
      ),
    );
  }
}
