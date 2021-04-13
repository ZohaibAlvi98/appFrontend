import 'package:flutter/material.dart';

Widget item(img, width, text, cross) {
  return Stack(
    children: [
      if (cross)
        Padding(
          padding: width < 400
              ? EdgeInsets.only(top: 15.0, right: 10)
              : EdgeInsets.only(top: 15.0, right: 20),
          child: Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.close,
              size: width < 400 ? 15 : 19,
              color: Colors.grey[800],
            ),
          ),
        ),
      SizedBox(
        width: 160,
        child: Container(
            padding: EdgeInsets.only(top: 8, left: 15),
            child: Image.asset(img)),
      ),
      // Container(
      //   alignment: Alignment.topCenter,
      //   padding: width < 400
      //       ? EdgeInsets.only(top: 8, left: 135)
      //       : EdgeInsets.only(top: 10, left: 95),
      //   child: Text(
      //     'AIR JORDAN 1 MID \n"SISTERHOOD"',
      //     style: TextStyle(
      //         fontSize: width < 400 ? 14 : 18, fontWeight: FontWeight.w700),
      //   ),
      // ),
      // Padding(
      //   padding: width < 400
      //       ? EdgeInsets.only(top: 3, left: 120.0)
      //       : EdgeInsets.only(top: 5, left: 58.0),
      //   child: Center(
      //     heightFactor: width < 400 ? 6 : 6.5,
      //     child: Text(
      //       'Item Id: 16455890',
      //       style: TextStyle(
      //           color: Colors.grey[700], fontSize: width < 400 ? 13.5 : 15),
      //     ),
      //   ),
      // ),
      Padding(
          padding: EdgeInsets.only(left: 175, top: 8),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text,
                  style: TextStyle(
                      fontFamily: 'RMNUEUSEMIBOLD',
                      fontSize: width < 400 ? 14 : 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Item Id: 16455890',
                  style: TextStyle(
                      fontFamily: 'RMNUEUREGULAR',
                      color: Colors.grey[700],
                      fontSize: width < 400 ? 13.5 : 15),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              if (!cross)
                SizedBox(
                  height: 8,
                ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Size: M',
                    style: TextStyle(
                        fontFamily: 'RMNUEUREGULAR',
                        fontSize: width < 400 ? 14 : 14.5,
                        color: Colors.black),
                  )),
              SizedBox(
                height: 6,
              ),
              if (!cross)
                SizedBox(
                  height: 3,
                ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Color: Red',
                      style: TextStyle(
                          fontFamily: 'RMNUEUREGULAR',
                          fontSize: width < 400 ? 14 : 14.5,
                          color: Colors.black))),
              SizedBox(
                height: 6,
              ),
              if (!cross)
                SizedBox(
                  height: 3,
                ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Qty: 1',
                    style: TextStyle(
                        fontFamily: 'RMNUEUREGULAR',
                        fontSize: width < 400 ? 14 : 14.5,
                        color: Colors.black),
                  )),
            ],
          )),
      Padding(
        padding: EdgeInsets.only(left: 175, top: 155),
        child: Text(
          'Price:  £400',
          style: TextStyle(
              fontFamily: 'RMNUEUREGULAR',
              color: Colors.black,
              fontSize: width < 400 ? 14 : 16.5),
        ),
      )
    ],
  );
}
