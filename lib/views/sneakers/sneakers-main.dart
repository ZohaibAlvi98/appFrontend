import 'package:flutter/material.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import 'package:splyxp/widgets/InnerAppBar.dart';
import 'package:splyxp/widgets/carousels.dart';
import 'package:splyxp/widgets/horizontalList.dart';
import 'package:splyxp/widgets/lineHeading.dart';
import 'package:splyxp/widgets/navbar.dart';
import '../search/search.dart';
import '../../views/profile.dart';
import '../../views/sply-network.dart';
import '../../views/home.dart';
import '../auth/signup/signup.dart';
import 'package:splyxp/views/styles/style-detail.dart';
import 'package:splyxp/views/sneakers/sneaker-mens.dart';
import 'package:splyxp/views/sneakers/sneaker-womens.dart';

class Sneakers extends StatefulWidget {
  @override
  _SneakersState createState() => _SneakersState();
}

class _SneakersState extends State<Sneakers> {
  List img = [
    'assets/images/sneakers/list1.jpg',
    'assets/images/sneakers/list2.jpg',
    'assets/images/sneakers/list3.jpg',
    // 'assets/images/list4.jpg'
  ];
  List carouselImg = [
    'assets/images/sneakers/carousel1.jpg',
    'assets/images/sneakers/carousel1.jpg',
    'assets/images/sneakers/carousel1.jpg',
    // 'assets/images/item4.jpg'
  ];
  List trendingImg = [
    'assets/images/sneakers/list4.jpg',
    'assets/images/sneakers/list3.jpg',
    'assets/images/sneakers/list2.jpg',
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
    Sneakers(),
    Search(),
    ChatList(),
    SplyNetwork(),
    Signup()
  ];
  void _navigatorPage(index) {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          if (index == 'mens') {
            return SneakersMens();
          } else if (index == 'womens') {
            return SneakersWomens();
          } else {
            return SneakersMens();
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
          appBar: appbarWithMenu(context),
          drawer: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors
                    .black, //This will change the drawer background to blue.
                //other styles
              ),
              child: drawerAppBar(context, '', false)),

          body: _selectedIndex == 0
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 20, left: 20),
                        child: Image.asset(
                          'assets/images/sneakers/sneakers1.jpg',
                        ),
                      ),
                      Padding(
                        padding: width < 400
                            ? EdgeInsets.only(top: 20.0, left: 50, right: 15)
                            : EdgeInsets.only(top: 20.0, left: 55, right: 32),
                        child: Text(
                            'A curated sneaker selection of new and popular drops.',
                            style: TextStyle(
                                fontFamily: 'RMNUEUREGULAR',
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      // Featured Style Heading
                      Heading(context, 'New Arrivals'),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(height: 320, child: sneakerListWith4(context)),

                      Container(
                        padding: EdgeInsets.only(top: 20, right: 30, left: 30),
                        child: InkWell(
                            onTap: () {
                              _navigatorPage('mens');
                            },
                            child: Stack(
                              children: [
                                Image.asset('assets/images/sneakers/mens.gif'),
                                Padding(
                                    padding: width < 400
                                        ? EdgeInsets.only(top: 140, left: 25)
                                        : EdgeInsets.only(top: 170, left: 30),
                                    child: Stack(
                                      children: <Widget>[
                                        // Stroked text as border.
                                        Text(
                                          'SNEAKERS-PLY',
                                          style: TextStyle(
                                            fontSize: width < 400 ? 30 : 40,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 2
                                              ..color = Colors.white,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        // Solid text as fill.
                                        Text(
                                          'SNEAKERS-PLY',
                                          style: TextStyle(
                                            fontSize: width < 400 ? 30 : 40,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        Padding(
                                          padding: width < 400
                                              ? EdgeInsets.only(top: 40.0)
                                              : EdgeInsets.only(top: 50.0),
                                          child: Center(
                                              child: Text(
                                            'MEN',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width < 400 ? 30 : 40,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          )),
                                        )
                                      ],
                                    )),
                              ],
                            )),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(right: 30, left: 30, bottom: 20),
                        child: InkWell(
                            onTap: () {
                              _navigatorPage('womens');
                            },
                            child: Stack(
                              children: [
                                Image.asset(
                                    'assets/images/sneakers/womens.gif'),
                                Padding(
                                    padding: width < 400
                                        ? EdgeInsets.only(top: 140, left: 25)
                                        : EdgeInsets.only(top: 170, left: 30),
                                    child: Stack(
                                      children: <Widget>[
                                        // Stroked text as border.
                                        Text(
                                          'SNEAKERS-PLY',
                                          style: TextStyle(
                                            fontSize: width < 400 ? 30 : 40,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 2
                                              ..color = Colors.white,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        // Solid text as fill.
                                        Text(
                                          'SNEAKERS-PLY',
                                          style: TextStyle(
                                            fontSize: width < 400 ? 30 : 40,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        Padding(
                                          padding: width < 400
                                              ? EdgeInsets.only(top: 40.0)
                                              : EdgeInsets.only(top: 50.0),
                                          child: Center(
                                              child: Text(
                                            'WOMEN',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width < 400 ? 30 : 40,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          )),
                                        )
                                      ],
                                    )
                                    // Center(
                                    //     child: Text(
                                    //   'hello',
                                    //   style: TextStyle(
                                    //     color: Colors.transparent,

                                    //   ),
                                    // )),
                                    )
                              ],
                            )),
                      ),
                      // CarouselWithDots(
                      //   carouselImg: carouselImg,
                      // ),
                      SizedBox(
                        height: 40,
                      ),
                      Heading(context, 'TOP TRENDING'),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          height: 280, child: sneakerListTopTrending(context)),
                    ],
                  ),
                )
              : _bottomNavList.elementAt(_selectedIndex),
          bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
        ));
  }
}
