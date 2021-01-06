import 'package:flutter/material.dart';

Widget horizontalListWith3(context, img) {
  double width = MediaQuery.of(context).size.width;
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    // physics: NeverScrollableScrollPhysics(),
    // shrinkWrap: true,
    itemCount: img.length,
    padding: EdgeInsets.only(right: 20.0, left: 5.5),
    itemBuilder: (context, index) {
      return Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Card(
              child: Wrap(children: [
                Image.asset(
                  img[index],
                  height: 175,
                  // width: imgwidth,
                ),
              ]),
            ),
            color: Colors.white12,
          ),
          Padding(
            padding: width < 400
                ? EdgeInsets.only(right: 15.0)
                : EdgeInsets.only(right: 18.0),
            child: Text(
              'Thome Brown 4 Bar \nJackets',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: width < 400
                ? EdgeInsets.only(top: 7.0, bottom: 5, right: 15)
                : EdgeInsets.only(top: 7.0, bottom: 5, right: 18),
            child: Text(
              'Brand: Thome Brown',
              style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 85),
            child: Text('£759.00'),
          ),
        ],
      );
    },
  );
}

Widget horizontalListWith2(context, img) {
  double width = MediaQuery.of(context).size.width;
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    // physics: NeverScrollableScrollPhysics(),
    // shrinkWrap: true,
    itemCount: img.length,
    padding: EdgeInsets.only(right: 15.0, left: 18),
    itemBuilder: (context, index) {
      return Column(
        children: [
          Container(
            padding: width < 400
                ? EdgeInsets.only(right: 5)
                : EdgeInsets.only(right: 10),
            child: Card(
              child: Wrap(children: [
                Image.asset(
                  img[index],
                  height: 260,
                  // width: imgwidth,
                ),
              ]),
            ),
            color: Colors.white12,
          ),
          Padding(
            padding: width < 400
                ? EdgeInsets.only(right: width / 5.1)
                : EdgeInsets.only(right: width / 4.5),
            child: Text(
              'AIR JORDAN 1 MID\n\"SISTERHOOD\"',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: width < 400
                ? EdgeInsets.only(right: 160, top: 10)
                : EdgeInsets.only(right: 170, top: 10),
            child: Text(
              '\$ 400.00',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
            ),
          ),
        ],
      );
    },
  );
}
