import 'package:flutter/material.dart';

Widget content(heading, text1, text2) {
  return Column(children: [
    Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 14),
        child: Text(
          heading,
          style: TextStyle(
              fontSize: 20,
              height: 1.3,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800]),
        ),
      ),
    ),
    Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 14, top: 15),
        child: Row(
          children: [
            if (text1 != '')
              Container(
                width: 80,
                color: Color(int.parse('#F2E1F2'.replaceAll('#', '0xff'))),
                child: Center(
                  child: Text(
                    text1,
                    style: TextStyle(
                      fontSize: 17,
                      height: 1.3,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
            SizedBox(width: 20),
            if (text2 != '')
              Container(
                width: 80,
                color: Color(int.parse('#F2E1F2'.replaceAll('#', '0xff'))),
                child: Center(
                  child: Text(
                    text2,
                    style: TextStyle(
                      fontSize: 17,
                      height: 1.3,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
  ]);
}
