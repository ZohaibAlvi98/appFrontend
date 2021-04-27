import 'package:flutter/material.dart';

Widget RoundedCard(context, dividingWidth1, dividingWidth2) {
  double width = MediaQuery.of(context).size.width;
  print(width);
  return Card(
    margin: width < 400
        ? EdgeInsets.fromLTRB(5, width / dividingWidth1, 5, 0)
        : EdgeInsets.fromLTRB(14, width / dividingWidth2, 14, 0),
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.grey[400], width: 1),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Container(
      height: 70,
      child: Row(
        children: <Widget>[
          Container(
            width: width * 0.2,
            height: 50,
            decoration: new BoxDecoration(
              border: new Border.all(
                color: Colors.grey[400],
                width: 1.0,
              ),
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: width < 400
                  ? EdgeInsets.only(left: 17.0, top: 13)
                  : EdgeInsets.only(left: 22.0, top: 13),
              child: Text(
                'End',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          Padding(
              padding: width < 400
                  ? EdgeInsets.only(top: 16)
                  : EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  Text(
                    'End Clothing',
                    style: TextStyle(
                        fontFamily: 'RMNUEU',
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Nov 4, 2020           ',
                    style: TextStyle(
                        fontFamily: 'RMNUEUREGULAR',
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500),
                  )
                ],
              )),
          Padding(
            padding: width < 400
                ? EdgeInsets.only(left: width * 0.02)
                : EdgeInsets.only(left: width * 0.08),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left: 10),
                    icon: Icon(Icons.favorite_outline_outlined),
                    color: Colors.black,
                    iconSize: 26,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.bookmark_border),
                    color: Colors.black,
                    iconSize: 26,
                    onPressed: () {},
                  ),
                ]),
          )
        ],
      ),
    ),
  );
}

Widget RoundedCardForGrid(
    context, dividingWidth1, dividingWidth2, title, date, brand) {
  double width = MediaQuery.of(context).size.width;
  print(width);
  return Card(
    margin: EdgeInsets.fromLTRB(0, width / dividingWidth1, 0, 0),
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.grey[400], width: 1),
      borderRadius: BorderRadius.circular(22),
    ),
    child: Container(
      height: 45,
      child: Row(
        children: <Widget>[
          Padding(
              padding: width < 400
                  ? EdgeInsets.only(left: 10)
                  : EdgeInsets.only(left: 15),
              child: Container(
                width: 40,
                height: 40,
                decoration: new BoxDecoration(
                  border: new Border.all(
                    color: Colors.grey[400],
                    // width: 1.0,
                  ),
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    brand,
                    style: TextStyle(
                        fontSize: width < 400 ? 8 : 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )),
          Padding(
            padding: width < 400
                ? EdgeInsets.only(left: 10.0, top: 10)
                : EdgeInsets.only(left: 11.0, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: width < 400 ? 9 : 12,
                      fontWeight: FontWeight.bold),
                ),
                Text(date,
                    style: TextStyle(
                        fontSize: width < 400 ? 9 : 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
