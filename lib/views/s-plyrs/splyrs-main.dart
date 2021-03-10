import 'package:flutter/material.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import 'package:splyxp/views/requests/request-shopper.dart';
import 'package:splyxp/widgets/navbar.dart';
import 'package:splyxp/widgets/InnerAppBar.dart';
import 'package:splyxp/widgets/lineHeading.dart';
import 'package:splyxp/widgets/carousels.dart';

import '../search/search.dart';
import '../../views/profile.dart';
import '../../views/sply-network.dart';
import 'channel/channel.dart';
import '../requests/request-splyr.dart';

class Splyrs extends StatefulWidget {
  @override
  _SplyrsState createState() => _SplyrsState();
}

class _SplyrsState extends State<Splyrs> {
  int index = 0;
  int _selectedIndex = 0;
  int counter = 0;
  void _onItemTapped(int index) {
    if (_selectedIndex == 0 && index == 0) {
      Navigator.of(context).pop();
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _bottomNavList = [
    Splyrs(),
    Search(),
    ChatList(),
    SplyNetwork(),
    Profile()
  ];
  List carouselImg = [
    'assets/images/splyrs/carousel1.jpg',
    'assets/images/splyrs/carousel1.jpg',
    'assets/images/splyrs/carousel1.jpg',
    // 'assets/images/item4.jpg'
  ];
  List obj = [
    {'images': 'assets/images/splyrs/grid1.jpg', 'index': '0'},
    {'images': 'assets/images/splyrs/grid2.jpg', 'index': '1'},
    {'images': 'assets/images/splyrs/grid3.jpg', 'index': '2'}
  ];
  List gridImg = [
    'assets/images/splyrs/grid1.jpg',
    'assets/images/splyrs/grid2.jpg',
    'assets/images/splyrs/grid3.jpg',
  ];

  void _navigatorPage(index) {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          if (index == 'requestSplyr')
            return RequestSupplier();
          else
            return Channel();
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new SlideTransition(
            child: child,
            position: new Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    int a = 0;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: () async {
          if (_selectedIndex == 0) return true;
          setState(() {
            _selectedIndex = 0;
          });
          return false;
        },
        child: Scaffold(
          // App bar
          appBar: Appbar(context),

          body: _selectedIndex == 0
              ? SingleChildScrollView(
                  child: Column(children: [
                  Container(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    child: Image.asset(
                      'assets/images/splyrs/main.jpg',
                    ),
                  ),
                  Padding(
                    padding: width < 400
                        ? EdgeInsets.only(top: 20.0, left: 50, right: 15)
                        : EdgeInsets.only(top: 20.0, left: 55, right: 65),
                    child: Text(
                        'Curated selection of fashion and lifestyle products from popular S-PLYRS from across the world',
                        style: TextStyle(
                            height: 1.3,
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                  ),
                  SizedBox(
                    height: width < 400 ? 12 : 9,
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        side: BorderSide(color: Colors.black87, width: 1.4)),
                    onPressed: () {
                      _navigatorPage('requestSplyr');
                    },
                    child: Text(
                      'Become A S-PLYR',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    color: Colors.white,
                    minWidth: 310,
                    height: 50,
                  ),
                  SizedBox(
                    height: width < 400 ? 62 : 45,
                  ),
                  Heading(context, 'FEATURED S-PLYR'),
                  InkWell(
                    onTap: () {
                      _navigatorPage('channel');
                    },
                    child: CarouselWithTextDots(
                      carouselImg: carouselImg,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Heading(context, 'OTHER S-PLYR'),
                  SizedBox(
                    height: 15,
                  ),
                  GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: obj.length * 2,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      if (index % 4 == 0 || (index - 3) % 4 == 0) {
                        if (a == 0 && index == 0) {
                          return Container(
                              margin: EdgeInsets.only(left: 20),
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: new DecorationImage(
                                  image: ExactAssetImage(gridImg[a]),
                                  fit: BoxFit.fill,
                                ),
                              ));
                        }

                        a++;
                        return Container(
                            margin: index % 2 == 0
                                ? EdgeInsets.only(left: 20)
                                : EdgeInsets.only(right: 20),
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: new DecorationImage(
                                image: ExactAssetImage(gridImg[a]),
                                fit: BoxFit.fill,
                              ),
                            ));
                      }

                      return Container(
                        child: Padding(
                          padding: width < 400
                              ? index % 2 != 0
                                  ? EdgeInsets.only(left: 15, top: 45)
                                  : EdgeInsets.only(left: 25, top: 45)
                              : EdgeInsets.only(left: 25, top: 56),
                          child: index == 1
                              ? Stack(children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      'MRKTDEUX',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(top: 40),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 9.0),
                                                child: Icon(
                                                  Icons.location_pin,
                                                  size: 15,
                                                ),
                                              ),
                                              Text(
                                                'MIAMI, FLORIDA,\nUNITED STATES (US)',
                                                style: TextStyle(
                                                    fontSize:
                                                        width < 400 ? 9 : 11,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                          // Padding(
                                          //   padding: width < 400
                                          //       ? EdgeInsets.only(
                                          //           top: 6, left: 7, right: 5)
                                          //       : EdgeInsets.only(
                                          //           top: 10, left: 7, right: 5),
                                          //   child: Text(
                                          //     'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document.',
                                          //     style: TextStyle(
                                          //         fontSize:
                                          //             width < 400 ? 9 : 13,
                                          //         color: Colors.grey[600],
                                          //         fontWeight: FontWeight.w800,
                                          //         height: 1.15),
                                          //   ),
                                          // )
                                        ],
                                      ))
                                ])
                              : index == 2
                                  ? Stack(
                                      children: [
                                        Padding(
                                          padding: width < 400
                                              ? EdgeInsets.only(
                                                  top: 15, left: 0.0)
                                              : EdgeInsets.only(
                                                  top: 15, left: 0.0),
                                          child: Text('TOKENMIAMI',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20)),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: width < 400
                                                  ? EdgeInsets.only(
                                                      top: 45, left: 0)
                                                  : EdgeInsets.only(
                                                      top: 45, left: 0),
                                              child: Stack(
                                                children: [
                                                  Icon(
                                                    Icons.location_pin,
                                                    size: 15,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 15.0),
                                                    child: Text(
                                                      'Address: 1537 NW 23rd Street florida, United States ((US), 33142)',
                                                      style: TextStyle(
                                                          fontSize: width < 400
                                                              ? 9
                                                              : 11,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Padding(
                                            //   padding: width < 400
                                            //       ? EdgeInsets.only(
                                            //           top: 6, left: 20)
                                            //       : EdgeInsets.only(
                                            //           top: 10, left: 30),
                                            //   child: Text(
                                            //     'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document.',
                                            //     style: TextStyle(
                                            //         fontSize:
                                            //             width < 400 ? 9 : 13,
                                            //         color: Colors.grey[600],
                                            //         fontWeight: FontWeight.w800,
                                            //         height: 1.15),
                                            //   ),
                                            // )
                                          ],
                                        )
                                      ],
                                    )
                                  : Stack(children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: 20, right: 5),
                                        child: Text('ZOO FASHION',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20)),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 50),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 10.0),
                                                    child: Icon(
                                                      Icons.location_pin,
                                                      size: 15,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 5.0),
                                                    child: Text(
                                                      'London United Kingdom\n (UK)',
                                                      style: TextStyle(
                                                          fontSize: width < 400
                                                              ? 9
                                                              : 11,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // Padding(
                                              //   padding: width < 400
                                              //       ? EdgeInsets.only(
                                              //           top: 6,
                                              //           left: 7,
                                              //           right: 5)
                                              //       : EdgeInsets.only(
                                              //           top: 10,
                                              //           left: 7,
                                              //           right: 5),
                                              //   child: Text(
                                              //     'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document.',
                                              //     style: TextStyle(
                                              //         fontSize:
                                              //             width < 400 ? 9 : 13,
                                              //         color: Colors.grey[600],
                                              //         fontWeight:
                                              //             FontWeight.w800,
                                              //         height: 1.15),
                                              //   ),
                                              // )
                                            ],
                                          ))
                                    ]),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  )
                ]))
              : _bottomNavList.elementAt(_selectedIndex),
          bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
        ));
  }
}
