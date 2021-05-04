import 'package:flutter/material.dart';

Widget RoundedCard(
    context, dividingWidth1, dividingWidth2, owner, likes, date, logo) {
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
            margin: EdgeInsets.only(top: 5, left: 10, right: 10),
            width: width * 0.13,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(logo),
              ),
              border: Border.all(color: Colors.grey),
            ),
          ),
          Padding(
              padding: width < 400
                  ? EdgeInsets.only(top: 16)
                  : EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    owner,
                    style: TextStyle(
                        fontFamily: 'RMNUEU',
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                        fontFamily: 'RMNUEUREGULAR',
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500),
                  )
                ],
              )),
          Padding(
              padding: width < 400
                  ? EdgeInsets.only(top: 16, left: 80)
                  : EdgeInsets.only(
                      top: 16,
                    ),
              child: Column(
                children: [
                  Text(
                    likes,
                    style: TextStyle(
                        fontFamily: 'RMNUEU',
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Likes',
                    style: TextStyle(
                        fontFamily: 'RMNUEUREGULAR',
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500),
                  )
                ],
              ))
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

Widget RoundedCardDetail(
    context, dividingWidth1, dividingWidth2, owner, likes, date) {
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
                    owner,
                    style: TextStyle(
                        fontSize: width < 400 ? 8 : 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )),
          Padding(
              padding: width < 400
                  ? EdgeInsets.only(top: 16, left: 12)
                  : EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    owner,
                    style: TextStyle(
                        fontFamily: 'RMNUEU',
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                        fontFamily: 'RMNUEUREGULAR',
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500),
                  )
                ],
              )),
          Padding(
              padding: width < 400
                  ? EdgeInsets.only(top: 16, left: 85)
                  : EdgeInsets.only(
                      top: 16,
                    ),
              child: Column(
                children: [
                  Text(
                    likes,
                    style: TextStyle(
                        fontFamily: 'RMNUEU',
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Likes',
                    style: TextStyle(
                        fontFamily: 'RMNUEUREGULAR',
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500),
                  )
                ],
              ))
        ],
      ),
    ),
  );
}

Widget RoundedCardForStyle(
    context, dividingWidth1, dividingWidth2, title, date, logo, likes) {
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: width < 400
                ? EdgeInsets.only(left: 10)
                : EdgeInsets.only(left: 10),
            child: Container(
              margin: EdgeInsets.only(top: 0.5, left: 0, right: 0),
              width: width * 0.10,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(logo),
                ),
                border: Border.all(color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: width < 400
                ? EdgeInsets.only(left: 8, top: 10)
                : EdgeInsets.only(left: 8, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: width < 400 ? 9 : 12,
                      fontFamily: 'RMNUEU',
                      fontWeight: FontWeight.bold),
                ),
                Text(date,
                    style: TextStyle(
                        fontSize: width < 400 ? 9 : 11,
                        fontFamily: 'RMNUEUREGULAR',
                        color: Colors.grey[600])),
              ],
            ),
          ),
          Padding(
              padding: width < 400
                  ? EdgeInsets.only(left: 20, top: 10)
                  : EdgeInsets.only(left: 20, top: 10),
              child: Column(
                children: [
                  Text(
                    likes,
                    style: TextStyle(
                        fontSize: width < 400 ? 9 : 12,
                        fontFamily: 'RMNUEU',
                        fontWeight: FontWeight.bold),
                  ),
                  Text('Likes',
                      style: TextStyle(
                          fontSize: width < 400 ? 9 : 11,
                          fontFamily: 'RMNUEUREGULAR',
                          color: Colors.grey[600])),
                ],
              ))
        ],
      ),
    ),
  );
}
