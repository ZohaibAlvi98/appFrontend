import 'package:flutter/material.dart';

class SplyNetwork extends StatefulWidget {
  @override
  _SplyNetworkState createState() => _SplyNetworkState();
}

class _SplyNetworkState extends State<SplyNetwork> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            cards(width, 'assets/images/rss/rss1.jpg'),
            SizedBox(
              height: 15,
            ),
            cards(width, 'assets/images/rss/rss2.jpg'),
            SizedBox(
              height: 15,
            ),
            cards(width, 'assets/images/rss/rss1.jpg'),
          ],
        ),
      ),
    );
  }
}

Widget cards(width, img) {
  return Container(
      padding: EdgeInsets.only(right: 15, left: 15, top: 0),
      child: InkResponse(
        onTap: () {
          print('hello');
        },
        child: Padding(
          padding: EdgeInsets.only(bottom: 7.0),
          child: Card(
            elevation: 1,
            margin: EdgeInsets.only(bottom: 5),
            child: Column(
              children: [
                Image.asset(
                  img,
                  fit: BoxFit.contain,
                ),
                Align(
                  // alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        width: width * 0.13,
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
                              ? EdgeInsets.only(left: 6.5, top: 13)
                              : EdgeInsets.only(left: 8.0, top: 13),
                          child: Text(
                            'End',
                            style: TextStyle(
                                fontSize: width < 400 ? 16 : 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 5.0, left: .7),
                          child: Column(
                            children: [
                              Padding(
                                padding: width < 400
                                    ? EdgeInsets.only(right: 55.0)
                                    : EdgeInsets.only(right: 63.0),
                                child: Text(
                                  'END.',
                                  style: TextStyle(
                                      fontSize: width < 400 ? 18 : 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 0.0),
                                child: Text(
                                  'January 22, 2021',
                                  style: TextStyle(
                                      fontSize: width < 400 ? 11 : 14),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 3),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 13.0),
                            child: Text(
                              '1017 Alyx 9sm x Stussy - Available Now',
                              style: TextStyle(
                                  fontSize: width < 400 ? 22 : 25,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                          )),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 7.0, left: 13, bottom: 10),
                          child: Text(
                            'Lorem ipsum is a placeholder text commonly used to demonstrate the visual....',
                            style: TextStyle(height: 1.3),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
}
