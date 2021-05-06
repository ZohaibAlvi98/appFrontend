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
    GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(left: 0, right: 0, top: 2),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2.8,
        ),
        // scrollDirection: Axis.vertical,
        itemCount: text1.length,
        itemBuilder: (BuildContext context, int index) {
          return Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 14, top: 15),
              child: Container(
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
                    text1[index],
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.1,
                      fontFamily: 'RMNUEUREGULAR',
                      color: Colors.grey[800],
                    ),
                  )),
                ),
              ),
            ),
          );
        })
  ]);
}

Widget content1(heading, text1, text2) {
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
    GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(left: 0, right: 0, top: 2),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2.8,
        ),
        // scrollDirection: Axis.vertical,
        itemCount: text1.length,
        itemBuilder: (BuildContext context, int index) {
          return Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 14, top: 15),
              child: Container(
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
                    text1[index]['splyr_name'],
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.1,
                      fontFamily: 'RMNUEUREGULAR',
                      color: Colors.grey[800],
                    ),
                  )),
                ),
              ),
            ),
          );
        })
  ]);
}
