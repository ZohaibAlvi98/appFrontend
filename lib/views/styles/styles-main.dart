import 'package:flutter/material.dart';
import 'package:splyxp/widgets/InnerAppBar.dart';
import 'package:splyxp/widgets/horizontalList.dart';
import 'package:splyxp/widgets/lineHeading.dart';

class Styles extends StatefulWidget {
  @override
  _StylesState createState() => _StylesState();
}

class _StylesState extends State<Styles> {
  List img = [
    'assets/images/styles/list1.png',
    'assets/images/styles/list2.png',
    'assets/images/styles/list3.jpg',
    'assets/images/styles/list4.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print(width);
    return Scaffold(
      // App bar
      appBar: Appbar(context),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: Image.asset(
                'assets/images/styles/styles2.png',
              ),
            ),
            Padding(
              padding: width < 400
                  ? EdgeInsets.only(top: 20.0, left: 41)
                  : EdgeInsets.only(top: 20.0, left: 45),
              child: Text(
                  'Personalized style discovery and shopping as a service.\nWhere style meets fashion.',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400)),
            ),
            // Featured Style Heading
            Heading(context, 'FEATURED STYLES'),
            // Image and Rounded Card
            Container(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: Stack(children: [
                Image.asset('assets/images/styles/styles4.jpg'),
                RoundedCard(context, 0.97, 0.97),
              ]),
            ),
            // Thome Brown Content
            Padding(
              padding: EdgeInsets.only(top: 35, left: 30, right: 30),
              child: Text(
                'Thome Brown Winter Clothing Styling By End Clothing',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18, left: 32, right: 30),
              child: Text(
                'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
                style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            // horizontal Scrolling list
            SizedBox(
              height: 270,
              child: horizontalListWith3(context, img),
            ),
            // spacing
            SizedBox(
              height: 50,
            ),
            // picture 2
            Container(
              color: Colors.grey[100],
              padding: EdgeInsets.only(right: 20, left: 20),
              child: Stack(children: [
                Padding(
                  padding: EdgeInsets.only(top: 35.0, bottom: 35),
                  child: Image.asset('assets/images/styles/style3.jpg'),
                ),
                RoundedCard(context, 0.9, 0.88)
              ]),
            ),
            Container(
              color: Colors.grey[100],
              padding: EdgeInsets.only(top: 35, left: 30, right: 30),
              child: Text(
                'Thome Brown Winter Clothing Styling By End Clothing',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              color: Colors.grey[100],
              padding:
                  EdgeInsets.only(top: 18, left: 32, right: 30, bottom: 15),
              child: Text(
                'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
                style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Nov 4, 2020           ',
                    style: TextStyle(
                        color: Colors.grey[500], fontWeight: FontWeight.w500),
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
