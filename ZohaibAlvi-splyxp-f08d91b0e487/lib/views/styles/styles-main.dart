import 'package:flutter/material.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import 'package:splyxp/views/styles/style-detail.dart';
import 'package:splyxp/views/vendor-channel/stylist-channel.dart';
import 'package:splyxp/widgets/InnerAppBar.dart';
import 'package:splyxp/widgets/horizontalList.dart';
import 'package:splyxp/widgets/lineHeading.dart';
import 'package:splyxp/widgets/navbar.dart';
import 'package:splyxp/widgets/roundedCard.dart';
import '../search/search.dart';
import '../../views/profile.dart';
import '../../views/sply-network.dart';
import 'package:splyxp/widgets/carousels.dart';

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
  int index = 0;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    if (_selectedIndex == 0 && index == 0) {
      Navigator.of(context).pop();
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _bottomNavList = [
    Styles(),
    Search(),
    ChatList(),
    SplyNetwork(),
    Profile()
  ];

  List styleBoxImg = [
    'assets/images/styles/boxList2.jpg',
    'assets/images/styles/boxList1.jpg',
    'assets/images/styles/boxList3.jpg',
  ];

  void _navigatorPage(index) {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          if (index == 'styleDetail') {
            return StyleDetail();
          } else {
            return StylistChannel();
          }
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
                  // key: new PageStorageKey('feed'),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
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
                                height: 1.3,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Heading(context, 'STYLE BOXES'),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: EdgeInsets.only(right: 15, left: 15, top: 0),
                          child: InkWell(
                              onTap: () {
                                _navigatorPage('styleDetail');
                              },
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: 7.0),
                                  child: Card(
                                      elevation: 1,
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: Column(children: [
                                        Image.asset(
                                          'assets/images/styles/styleBox1.jpg',
                                          fit: BoxFit.contain,
                                        ),
                                        Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 3),
                                            child: Column(children: [
                                              Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 13.0, top: 10),
                                                    child: Text(
                                                      'S-PLY CURATED STYLEBOXES',
                                                      style: TextStyle(
                                                          fontSize: width < 400
                                                              ? 22
                                                              : 25,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Colors.black),
                                                    ),
                                                  )),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 12.0,
                                                      left: 13,
                                                      bottom: 10,
                                                      right: 10),
                                                  child: Text(
                                                    'A S-PLY StyleBoxe contains a curated selection of designer products, ranging from exclusives, archive and current season pieces selected by our team of experienced stylists.',
                                                    style: TextStyle(
                                                        height: 1.3,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              )
                                            ])),
                                      ]))))),
                      SizedBox(
                        height: 50,
                      ),
                      Heading(context, 'FEATURED STYLE BOXES'),
                      InkWell(
                        onTap: () {
                          _navigatorPage('styleBox');
                        },
                        child: CarouselWithDots(
                          carouselImg: styleBoxImg,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      // Heading(context, 'WHY STYLE BOXES'),
                      // SizedBox(
                      //   height: 30,
                      // ),
                      // Featured Style Heading
                      Heading(context, 'FEATURED STYLES'),
                      SizedBox(
                        height: 20,
                      ),
                      // Image and Rounded Card
                      InkWell(
                        onTap: () {
                          _navigatorPage('styleDetail');
                        },
                        child: Container(
                          padding: EdgeInsets.only(right: 20, left: 20),
                          child: Stack(children: [
                            Image.asset('assets/images/styles/styles4.jpg'),
                            RoundedCard(context, 0.97, 0.97),
                          ]),
                        ),
                      ),
                      // Thome Brown Content
                      Padding(
                        padding: EdgeInsets.only(top: 35, left: 30, right: 30),
                        child: Text(
                          'Thome Brown Winter Clothing Styling By End Clothing',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                        child:
                            horizontalListWith3(context, img, Colors.white12),
                      ),
                      // spacing
                      SizedBox(
                        height: 50,
                      ),
                      // picture 2
                      InkWell(
                        onTap: () {
                          _navigatorPage('styleDetail');
                        },
                        child: Container(
                          color: Colors.grey[100],
                          padding: EdgeInsets.only(right: 20, left: 20),
                          child: Stack(children: [
                            Padding(
                              padding: EdgeInsets.only(top: 35.0, bottom: 35),
                              child: Image.asset(
                                  'assets/images/styles/style3.jpg'),
                            ),
                            RoundedCard(context, 0.9, 0.88)
                          ]),
                        ),
                      ),
                      Container(
                        color: Colors.grey[100],
                        padding: EdgeInsets.only(top: 35, left: 30, right: 30),
                        child: Text(
                          'Thome Brown Winter Clothing Styling By End Clothing',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        color: Colors.grey[100],
                        padding: EdgeInsets.only(
                            top: 18, left: 32, right: 30, bottom: 15),
                        child: Text(
                          'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
                          style: TextStyle(
                              fontSize: 16,
                              height: 1.5,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 50.0),
                        color: Colors.grey[100],
                        child: SizedBox(
                          height: 270,
                          child: horizontalListWith3(
                              context, img, Colors.grey[100]),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              : _bottomNavList.elementAt(_selectedIndex),
          bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
        ));
  }
}
