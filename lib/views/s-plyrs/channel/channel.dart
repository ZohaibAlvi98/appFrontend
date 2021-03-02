import 'package:flutter/material.dart';
import '../../../widgets/innerAppBar.dart';

class Channel extends StatefulWidget {
  @override
  _ChannelState createState() => _ChannelState();
}

class _ChannelState extends State<Channel> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: Appbar(context),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 10, left: 10, top: 5),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/splyrs/channels/main2.jpg',
                        fit: BoxFit.contain,
                      ),
                      Center(
                        heightFactor: 2.2,
                        child: Container(
                          width: 180,
                          height: 135,
                          decoration: new BoxDecoration(
                              border: new Border.all(
                                color: Colors.grey[200],
                                width: 1.0,
                              ),
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(2.2,
                                      2.2), // shadow direction: bottom right
                                )
                              ]),
                          child: Center(
                            child: Text(
                              'S-PLY',
                              style: TextStyle(
                                  fontSize: width < 400 ? 35 : 41,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 225.0),
                          child: Text(
                            'S-PLY STORE',
                            style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 270),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 50, right: 50),
                              child: Text(
                                'S-PLY is an online and retail concept store founded in London, with planned locations in Amsterdam, New York and Los Angeles',
                                style: TextStyle(fontSize: 17, height: 1.3),
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Icon(
                                    Icons.location_pin,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    'S-PLY Store, London, United Kingdom(UK)',
                                    style: TextStyle(fontSize: 15.5),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 45.0),
                                  child: Icon(
                                    Icons.mail_sharp,
                                  ),
                                ),
                                Text(
                                  ' s-plytv@s-plystyle.net',
                                  style: TextStyle(fontSize: 15.5),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
