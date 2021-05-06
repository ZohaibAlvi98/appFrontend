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
import '../auth/signup/signup.dart';
import '../../services/styles/featured-style-boxes.dart';
import 'package:splyxp/views/products/product-detail-stylebox.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../services/styles/styles-general-content.dart';
import '../../services/styles/featured-styles-listing.dart';

FeaturedStyleListing datastyle = FeaturedStyleListing();
StylesContent stylesdata = StylesContent();
FeaturedStyleBoxes getstylebox = FeaturedStyleBoxes();

class Styles extends StatefulWidget {
  final bool authenticated;
  Styles({Key key, this.authenticated}) : super(key: key);
  @override
  _StylesState createState() => _StylesState();
}

class _StylesState extends State<Styles> {
  List img = [
    'assets/images/styles/list1.png',
    'assets/images/styles/list2.png',
    'assets/images/styles/list7.jpg',
    'assets/images/styles/list8.jpg'
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
    Signup()
  ];

  List styleBoxImg = [];

  void _navigatorPage(index, id) {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          if (index == 'styleDetail') {
            return StyleDetail(
              styleId: null,
            );
          } else if (index == 'boxDetail') {
            return ProductDetailStyleBox(
              prodId: id,
            );
          } else {
            return StylistChannel(
              vendorId: null,
            );
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

  String getId(imgUrl, styleList) {
    for (var a = 0; a < styleList.length; a++) {
      if (styleList[a]['image'] == imgUrl) {
        return styleList[a]['box_id'].toString();
      }
    }
  }

  int _current = 1;
  void changeCurrent(index) {
    setState(() {
      _current = index;
    });
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double size = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;

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
              child: drawerAppBar(context, 'styles', widget.authenticated)),
          body: _selectedIndex == 0
              ? SingleChildScrollView(
                  // key: new PageStorageKey('feed'),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      FutureBuilder(
                          future: stylesdata.getStylesContent(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Map<String, dynamic>>>
                                  snapshot) {
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              final item = snapshot.data;
                              print(snapshot);
                              return Column(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            right: 20, left: 20),
                                        child: Image.network(
                                            item[0]['banner_image']),
                                      ),
                                      Padding(
                                        padding: width < 400
                                            ? EdgeInsets.only(
                                                top: 20.0, left: 41, right: 15)
                                            : EdgeInsets.only(
                                                top: 20.0, left: 45, right: 65),
                                        child: Text(item[0]['subtext'],
                                            style: TextStyle(
                                                fontFamily: 'RMNUEUREGULAR',
                                                fontSize: 20,
                                                height: 1.3,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                  Heading(context, 'STYLE BOXES'),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(
                                          right: 15, left: 15, top: 0),
                                      child: InkWell(
                                          // onTap: () {
                                          //   _navigatorPage('styleDetail', null);
                                          // },
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 7.0),
                                              child: Card(
                                                  elevation: 1,
                                                  margin: EdgeInsets.only(
                                                      bottom: 5),
                                                  child: Column(children: [
                                                    Image.network(
                                                      item[0]['sec_1_image'],
                                                      fit: BoxFit.contain,
                                                    ),
                                                    Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 3),
                                                        child: Column(
                                                            children: [
                                                              Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left:
                                                                            13.0,
                                                                        top: 10,
                                                                        right:
                                                                            13),
                                                                    child: Text(
                                                                      item[0][
                                                                          'sec_1_heading'],
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'RMNUEUSEMIBOLD',
                                                                          fontSize: width < 400
                                                                              ? 20
                                                                              : 20,
                                                                          fontWeight: FontWeight
                                                                              .w900,
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                  )),
                                                              Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: 12.0,
                                                                      left: 13,
                                                                      bottom:
                                                                          10,
                                                                      right:
                                                                          10),
                                                                  child: Text(
                                                                    item[0][
                                                                        'sec_1_text'],
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'RMNUEUREGULAR',
                                                                        height:
                                                                            1.3,
                                                                        fontSize:
                                                                            15),
                                                                  ),
                                                                ),
                                                              )
                                                            ])),
                                                  ]))))),
                                ],
                              );
                            }
                          }),

                      SizedBox(
                        height: 50,
                      ),
                      Heading(context, 'FEATURED STYLE BOXES'),
                      FutureBuilder(
                          future: getstylebox.getFeaturedStyleBoxes(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Map<String, dynamic>>>
                                  snapshot) {
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              final item = snapshot.data;
                              if (styleBoxImg.isEmpty) {
                                for (var a = 0; a < item.length; a++) {
                                  styleBoxImg.add(item[a]['image']);
                                }
                              }
                              return Column(
                                children: [
                                  CarouselSlider(
                                    items: styleBoxImg.map((i) {
                                      return Container(
                                        child: GestureDetector(
                                          child: Image.network(i,
                                              fit: BoxFit.fitWidth),
                                          onTap: () {
                                            String id = getId(i, item);
                                            _navigatorPage('boxDetail', id);
                                          },
                                        ),
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 8),
                                      );
                                    }).toList(),
                                    options: CarouselOptions(
                                        initialPage: 1,
                                        enableInfiniteScroll: false,
                                        height: width < 400
                                            ? size * 0.53
                                            : size * 0.55,
                                        onPageChanged: (i, reason) {
                                          changeCurrent(i);
                                        },
                                        // autoPlay: true,
                                        autoPlayCurve: Curves.easeInOut,
                                        enlargeCenterPage: false),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                        map<Widget>(styleBoxImg, (index, url) {
                                      return Container(
                                        width: 10.0,
                                        height: 7.0,
                                        margin: width < 400
                                            ? EdgeInsets.symmetric(
                                                vertical: 0.0, horizontal: 2.0)
                                            : EdgeInsets.symmetric(
                                                vertical: 6.0, horizontal: 2.0),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: _current == index
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      );
                                    }),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              );
                            }
                          }),
                      SizedBox(
                        height: 50,
                      ),

                      Heading(context, 'FEATURED STYLES'),
                      SizedBox(
                        height: 20,
                      ),
                      // Image and Rounded Card
                      FutureBuilder(
                          future: datastyle.getFeaturedStyleList(),
                          // artistService.getArtist(page),

                          builder: (BuildContext context,
                              AsyncSnapshot<List<Map<String, dynamic>>>
                                  snapshot) {
                            if (snapshot.hasData) {
                              // List<ArtistModel> artist = snapshot.data;
                              return GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.only(
                                      left: 0, right: 0, top: 2),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: MediaQuery.of(context)
                                            .size
                                            .width /
                                        (MediaQuery.of(context).size.height /
                                            0.82),
                                  ),
                                  // scrollDirection: Axis.vertical,
                                  itemCount: snapshot.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final item = snapshot.data[index];
                                    return Column(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  right: 20, left: 20.0),
                                              child: Stack(children: [
                                                Image.network(
                                                    item['images_data']
                                                        ['image']),
                                                RoundedCard(
                                                    context,
                                                    0.97,
                                                    0.97,
                                                    item['0']['style_owner'],
                                                    item['0']['likes'],
                                                    item['created_date'],
                                                    item['splyr_logo']),
                                              ]),
                                            ),
                                            // Thome Brown Content
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 30, left: 23, right: 20),
                                              child: Text(
                                                item['0']['style_title'],
                                                style: TextStyle(
                                                    fontFamily:
                                                        'RMNUEUSEMIBOLD',
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 15, left: 23, right: 23),
                                              child: Text(
                                                item['0']['style_description'],
                                                style: TextStyle(
                                                    fontFamily: 'RMNUEUREGULAR',
                                                    fontSize: 16,
                                                    height: 1.5,
                                                    color: Colors.grey[600],
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                          ],
                                        ),
                                        // horizontal Scrolling list
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 270,
                                              child:
                                                  horizontalListStylesProducts(
                                                      context,
                                                      item['0']['style_id']),
                                            ),
                                            // spacing
                                            // SizedBox(
                                            //   height: 25,
                                            // ),
                                          ],
                                        ),
                                      ],
                                    );
                                  });
                            } else if (snapshot.hasError) {
                              print(snapshot.error);
                              print('Sorry');
                            }

                            return Center(child: CircularProgressIndicator());
                          }),
                    ],
                  ),
                )
              : _bottomNavList.elementAt(_selectedIndex),
          bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
        ));
  }
}
