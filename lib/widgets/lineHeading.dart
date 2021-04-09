import 'package:flutter/material.dart';

Widget Heading(context, text) {
  double height =
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
  double width = MediaQuery.of(context).size.width;
  return Row(children: <Widget>[
    SizedBox(
      height: width < 400 ? 5 : 40,
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
      style: TextStyle(fontSize: 17.5, fontFamily: 'Monument'),
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

Widget Heading2(context, text) {
  double height =
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
  double width = MediaQuery.of(context).size.width;
  return Row(children: <Widget>[
    SizedBox(
      height: width < 400 ? 5 : 40,
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
      style: TextStyle(fontSize: 17.5, fontFamily: 'Monument'),
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
