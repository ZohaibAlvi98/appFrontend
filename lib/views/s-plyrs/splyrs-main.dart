import 'package:flutter/material.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import 'package:splyxp/widgets/navbar.dart';
import 'package:splyxp/widgets/InnerAppBar.dart';
import 'package:splyxp/widgets/lineHeading.dart';
import 'package:splyxp/widgets/horizontalList.dart';
import 'package:splyxp/widgets/carousels.dart';

import '../../views/search.dart';
import '../../views/profile.dart';
import '../../views/sply-network.dart';
import '../../views/home.dart';

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
                        ? EdgeInsets.only(top: 20.0, left: 50, right: 30)
                        : EdgeInsets.only(top: 20.0, left: 55, right: 32),
                    child: Text(
                        'Curated selection of fashion and lifestyle products from popular S PLYRS from across the world',
                        style: TextStyle(
                            height: 1.3,
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Become A S-PLYR',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: Colors.black,
                    minWidth: 292,
                    height: 50,
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Heading(context, 'FEATURED S-PLYR'),
                  CarouselWithDots(
                    carouselImg: carouselImg,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Heading(context, 'OTHER S-PLYR'),
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
                              decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: ExactAssetImage(gridImg[a]),
                              fit: BoxFit.contain,
                            ),
                          ));
                        }

                        a++;
                        return Container(
                            decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: ExactAssetImage(gridImg[a]),
                            fit: BoxFit.contain,
                          ),
                        ));
                      }

                      return Container(
                        child: Padding(
                          padding: width < 400
                              ? EdgeInsets.only(left: 25, top: 25)
                              : EdgeInsets.only(left: 25, top: 35),
                          child: index == 1
                              ? Stack(children: [
                                  Text(
                                    'MRKTDEUX',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(top: 30),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_pin,
                                                size: 15,
                                              ),
                                              Text(
                                                ' MIAMI, FLORIDA,\n UNITED STATES (US)',
                                                style: TextStyle(
                                                    fontSize:
                                                        width < 400 ? 9 : 11,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: width < 400
                                                ? EdgeInsets.only(
                                                    top: 6, left: 7, right: 5)
                                                : EdgeInsets.only(
                                                    top: 10, left: 7, right: 5),
                                            child: Text(
                                              'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document.',
                                              style: TextStyle(
                                                  fontSize:
                                                      width < 400 ? 9 : 13,
                                                  color: Colors.grey[600],
                                                  fontWeight: FontWeight.w800,
                                                  height: 1.15),
                                            ),
                                          )
                                        ],
                                      ))
                                ])
                              : index == 2
                                  ? Stack(
                                      children: [
                                        Padding(
                                          padding: width < 400
                                              ? EdgeInsets.only(left: 10.0)
                                              : EdgeInsets.only(left: 30.0),
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
                                              padding: EdgeInsets.only(top: 30),
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
                                            Padding(
                                              padding: width < 400
                                                  ? EdgeInsets.only(
                                                      top: 6, left: 10)
                                                  : EdgeInsets.only(
                                                      top: 10, left: 10),
                                              child: Text(
                                                'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document.',
                                                style: TextStyle(
                                                    fontSize:
                                                        width < 400 ? 9 : 13,
                                                    color: Colors.grey[600],
                                                    fontWeight: FontWeight.w800,
                                                    height: 1.15),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  : Stack(children: [
                                      Text('ZOO FASHION',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20)),
                                      Padding(
                                          padding: EdgeInsets.only(top: 30),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_pin,
                                                    size: 15,
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
                                              Padding(
                                                padding: width < 400
                                                    ? EdgeInsets.only(
                                                        top: 6,
                                                        left: 7,
                                                        right: 5)
                                                    : EdgeInsets.only(
                                                        top: 10,
                                                        left: 7,
                                                        right: 5),
                                                child: Text(
                                                  'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document.',
                                                  style: TextStyle(
                                                      fontSize:
                                                          width < 400 ? 9 : 13,
                                                      color: Colors.grey[600],
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      height: 1.15),
                                                ),
                                              )
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
