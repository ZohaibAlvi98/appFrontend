import 'package:flutter/material.dart';

Widget Heading(context, text) {
  double height =
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

  return Row(children: <Widget>[
    SizedBox(
      height: height * 0.15,
    ),
    Expanded(
      child: new Container(
          margin: const EdgeInsets.only(left: 10.0, right: 20.0),
          child: Divider(
            color: Colors.black,
            height: 36,
          )),
    ),
    Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
    ),
    Expanded(
      child: new Container(
          margin: const EdgeInsets.only(left: 20.0, right: 10.0),
          child: Divider(
            color: Colors.black,
            height: 36,
          )),
    ),
  ]);
}
