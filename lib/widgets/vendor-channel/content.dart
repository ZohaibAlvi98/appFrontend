import 'package:flutter/material.dart';

Widget content(heading, text1, text2) {
  return Column(children: [
    Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 14),
        child: Text(
          heading,
          style: TextStyle(fontFamily: 'RMNUEU', fontSize: 16),
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
                height: 26.0,
                width: 90,
                color: Colors.transparent,
                child: new Container(
                  decoration: new BoxDecoration(
                      color:
                          Color(int.parse('#ededed'.replaceAll('#', '0xff'))),
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(4.5),
                        topRight: const Radius.circular(4.5),
                        bottomRight: const Radius.circular(4.5),
                        bottomLeft: const Radius.circular(4.5),
                      )),
                  child: Center(
                      child: Text(
                    text1,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.1,
                      fontFamily: 'RMNUEUREGULAR',
                      color: Colors.grey[800],
                    ),
                  )),
                ),
              ),
            SizedBox(width: 15),
            if (text2 != '')
              Container(
                height: 26.0,
                width: 90,
                color: Colors.transparent,
                child: new Container(
                  decoration: new BoxDecoration(
                      color:
                          Color(int.parse('#ededed'.replaceAll('#', '0xff'))),
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(4.5),
                        topRight: const Radius.circular(4.5),
                        bottomRight: const Radius.circular(4.5),
                        bottomLeft: const Radius.circular(4.5),
                      )),
                  child: Center(
                      child: Text(
                    text2,
                    style: TextStyle(
                        fontSize: 14,
                        height: 1.1,
                        color: Colors.grey[800],
                        fontFamily: 'RMNUEUREGULAR'),
                  )),
                ),
              ),
          ],
        ),
      ),
    ),
  ]);
}
