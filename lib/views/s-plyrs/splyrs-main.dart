import 'package:flutter/material.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import 'package:splyxp/views/requests/request-shopper.dart';
import 'package:splyxp/widgets/navbar.dart';
import 'package:splyxp/widgets/InnerAppBar.dart';
import 'package:splyxp/widgets/lineHeading.dart';
import 'package:splyxp/widgets/carousels.dart';
import '../vendor-channel/shopper-channel.dart';
import '../vendor-channel/stylist-channel.dart';
import '../search/search.dart';
import '../../views/profile.dart';
import '../../views/sply-network.dart';
import 'channel/channel.dart';
import '../requests/request-splyr.dart';
import '../../widgets/horizontalList.dart';
import '../auth/signup/signup.dart';
import '../../services/splyrs/featured-splyr-services.dart';
import '../../services/splyrs/splyr-general-content.dart';
import 'dart:ui';

SplyrContent splyrdata = SplyrContent();

class Splyrs extends StatefulWidget {
  final bool authenticated;
  Splyrs({Key key, this.authenticated}) : super(key: key);
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
    Signup()
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

  List img = [
    'assets/images/styles/list1.png',
    'assets/images/styles/list2.png',
    'assets/images/styles/list7.jpg',
    'assets/images/styles/list8.jpg'
  ];

  List imgProduct = [
    'assets/images/styles/list5.jpg',
    'assets/images/styles/list6.jpg',
    'assets/images/styles/list7.jpg',
    'assets/images/styles/list8.jpg'
  ];
  FeaturedSplyrs data = new FeaturedSplyrs();
  void _navigatorPage(index, id) {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          if (index == 'requestSplyr')
            return RequestSupplier();
          else if (index == 'shopper') {
            return ShopperChannel(
              vendorId: null,
            );
          } else
            return Channel(
              splyrId: id,
            );
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
          appBar: appbarWithMenu(context),
          drawer: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors
                    .black, //This will change the drawer background to blue.
                //other styles
              ),
              child: drawerAppBar(context, 'shop', widget.authenticated)),
          body: _selectedIndex == 0
              ? SingleChildScrollView(
                  child: Column(children: [
                  FutureBuilder(
                      future: splyrdata.getSplyrContent(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          final item = snapshot.data;
                          print(snapshot);
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 20, left: 20),
                                child: Image.network(
                                  item[0]['banner_image'],
                                ),
                              ),
                              Padding(
                                padding: width < 400
                                    ? EdgeInsets.only(
                                        top: 20.0, left: 50, right: 15)
                                    : EdgeInsets.only(
                                        top: 20.0, left: 55, right: 65),
                                child: Text(item[0]['subtext'],
                                    style: TextStyle(
                                        fontFamily: 'RMNUEUREGULAR',
                                        height: 1.3,
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ],
                          );
                        }
                      }),
                  SizedBox(
                    height: width < 400 ? 12 : 10,
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        side: BorderSide(color: Colors.black87, width: 1.4)),
                    onPressed: () {
                      _navigatorPage('requestSplyr', '');
                    },
                    child: Text(
                      'Become A SPLYR',
                      style: TextStyle(
                          fontFamily: 'RMNUEUREGULAR',
                          color: Colors.black,
                          fontSize: 20),
                    ),
                    color: Colors.white,
                    minWidth: 310,
                    height: 50,
                  ),
                  SizedBox(
                    height: width < 400 ? 62 : 45,
                  ),
                  Heading(context, 'FEATURED SPLYRS'),
                  FutureBuilder(
                      future: data.getFeaturedSplyrs(),
                      // artistService.getArtist(page),

                      builder: (BuildContext context,
                          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                        if (snapshot.hasData) {
                          // List<ArtistModel> artist = snapshot.data;
                          return GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding:
                                  EdgeInsets.only(left: 0, right: 0, top: 2),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: MediaQuery.of(context)
                                        .size
                                        .width /
                                    (MediaQuery.of(context).size.height / 1.41),
                              ),
                              // scrollDirection: Axis.vertical,
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                final item = snapshot.data[index];
                                return InkWell(
                                  onTap: () =>
                                      _navigatorPage(context, item['splyr_id']),
                                  child: Column(
                                    children: [
                                      featuredSplyrs(
                                        width,
                                        context,
                                        'men',
                                        _navigatorPage,
                                        item['image'],
                                        index,
                                        item['title'],
                                        item['splyr_cities'],
                                        item['short_text'],
                                        item['splyr_id'].toString(),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      SizedBox(
                                        height: 270,
                                        child: horizontalListFeaturedSplyrs(
                                            context, item['splyr_id']),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                    ],
                                  ),
                                );
                              });
                        } else if (snapshot.hasError) {
                          print(snapshot.error);
                          print('Sorry');
                        }
                        return Center(child: CircularProgressIndicator());
                      }),
                  Container(
                      padding: EdgeInsets.only(left: 13, right: 13, top: 5),
                      child: ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, i) => Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: Theme(
                                data: Theme.of(context)
                                    .copyWith(accentColor: Colors.black),
                                child: ExpansionTile(
                                    title: new Text(
                                      'ALL SPLYRS',
                                      style: TextStyle(
                                          fontFamily: 'Monument',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    children: [
                                      FutureBuilder(
                                          future: data.getFeaturedSplyrs(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<
                                                      List<
                                                          Map<String, dynamic>>>
                                                  snapshot) {
                                            if (snapshot.hasData) {
                                              return GridView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  padding: EdgeInsets.only(
                                                      left: 1,
                                                      right: 1,
                                                      top: 20),
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    childAspectRatio: width <
                                                            400
                                                        ? MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                2.3)
                                                        : MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                1.17),
                                                  ),
                                                  // scrollDirection: Axis.vertical,
                                                  itemCount: 8,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return lists(
                                                        context, 'men', index);
                                                  });
                                              // SizedBox(
                                              //   height: 15,
                                              // );
                                            } else if (snapshot.hasError) {
                                              print(snapshot.error);
                                              print('Sorry');
                                            }
                                            return Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }),
                                    ]),
                              )))),
                  // SizedBox(
                  //   height: 20,
                  // ),
                ]))
              : _bottomNavList.elementAt(_selectedIndex),
          bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
        ));
  }
}

Widget lists(context, check, index) {
  List gridImg = [
    'assets/images/splyrs/grid4.jpg',
    'assets/images/splyrs/grid2.jpg',
    'assets/images/splyrs/grid3.jpg',
    'assets/images/splyrs/grid6.jpg',
    'assets/images/splyrs/grid5.jpg',
    'assets/images/splyrs/grid1.jpg',
    'assets/images/splyrs/grid3.jpg',
    'assets/images/splyrs/grid5.jpg',
  ];
  void _navigatorPage(index) {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          var id;
          return StylistChannel(
            vendorId: null,
          );
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

  return InkWell(
    onTap: () {
      _navigatorPage(index);
    },
    child: Column(
      children: [
        Padding(
            padding: index != 0 && index != 1
                ? EdgeInsets.only(left: 7.0, right: 7, top: 8)
                : EdgeInsets.only(left: 7.0, right: 7, top: 4),
            child: Image.asset(
              gridImg[index],
              fit: BoxFit.cover,
            )),
      ],
    ),
  );
}

Widget featuredSplyrs(width, context, _navigatorPage, check, image, index,
    title, location, shorttext, ids) {
  return Container(
      child: Stack(children: [
    Container(
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
      padding: EdgeInsets.only(top: width / 15),
    ),
    Padding(
      padding: EdgeInsets.only(top: width / 2.55, left: 20),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5.0,
          ),
          child: Container(
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: 'RMNUEU',
                  fontSize: width < 400 ? 22 : 23,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(top: width / 2.2, left: 20),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 10.0,
          ),
          child: Container(
            child: Text(
              shorttext,
              style: TextStyle(
                  fontFamily: 'RMNUEUREGULAR',
                  fontSize: width < 400 ? 9 : 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    ),
    Padding(
        padding: EdgeInsets.only(top: width / 2, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10.0,
                      sigmaY: 10.0,
                    ),
                    child: Container(
                      child: Text(
                        location.toUpperCase(),
                        style: TextStyle(
                          fontSize: width < 400 ? 9 : 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
  ]));
}
