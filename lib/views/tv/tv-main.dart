import 'package:flutter/material.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import 'package:splyxp/widgets/carousels.dart';
import 'package:splyxp/widgets/navbar.dart';
import 'package:splyxp/widgets/InnerAppBar.dart';
import 'package:splyxp/widgets/lineHeading.dart';
import 'package:splyxp/widgets/horizontalList.dart';
import 'package:splyxp/widgets/videoList.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../search/search.dart';
import '../../views/profile.dart';
import '../../views/sply-network.dart';
import '../auth/signup/signup.dart';
import '../../services/tv/featured-shows-listing.dart';
import '../../services/tv/tv-general-content.dart';
import 'package:splyxp/services/tv/get_supply_tv_listing.dart';
import 'package:splyxp/views/tv/tv_show_detail.dart';

TVContent tvdata = TVContent();
TVListingContent tvlisting = TVListingContent();

ShowsListing getShow = ShowsListing();

class Tv extends StatefulWidget {
  final bool authenticated;
  Tv({Key key, this.authenticated}) : super(key: key);
  @override
  _TvState createState() => _TvState();
}

class _TvState extends State<Tv> {
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
    Tv(),
    Search(),
    ChatList(),
    SplyNetwork(),
    Signup()
  ];
  List img = [
    'assets/images/sneakers/list4.jpg',
    'assets/images/sneakers/list2.jpg',
    'assets/images/sneakers/list1.jpg',
    'assets/images/sneakers/list3.jpg',
  ];
  List thumbnail = [];
  List videoUrl = [];
  List carouselImg = [];
  List videoTitle = [];
  // void _navigatorPage(index, id) {
  //   // Navigator.of(context).pop(new PageRouteBuilder());
  //   Navigator.of(context).push(new PageRouteBuilder(
  //       opaque: true,
  //       transitionDuration: const Duration(),
  //       pageBuilder: (BuildContext context, _, __) {
  //         if (index == 'styleDetail') {
  //           return null();
  //         } else if (index == 'boxDetail') {
  //           return null();
  //         } else {
  //           return null();
  //         }
  //       },
  //       transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
  //         return new SlideTransition(
  //           child: child,
  //           position: new Tween<Offset>(
  //             begin: const Offset(1.0, 0.0),
  //             end: Offset.zero,
  //           ).animate(animation),
  //         );
  //       }));
  // }

  String getId(imgUrl, styleList) {
    for (var a = 0; a < styleList.length; a++) {
      if (styleList[a]['image_gif'] == imgUrl) {
        return styleList[a]['post_id'].toString();
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
                canvasColor: Colors.black,
              ),
              child: drawerAppBar(context, 'tv', widget.authenticated)),
          body: _selectedIndex == 0
              ? SingleChildScrollView(
                  child: Column(
                  children: [
                    FutureBuilder(
                      future: tvdata.getTVContent(),
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
                                        top: 20.0, left: 55, right: 32),
                                child: Text(item[0]['subtext'],
                                    style: TextStyle(
                                        fontFamily: 'RMNUEUREGULAR',
                                        fontSize: 20,
                                        height: 1.3,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    // Featured Style Heading
                    Heading2(context, 'FEATURED PRODUCTS'),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(height: 270, child: featuredProductsTv(context)),
                    SizedBox(
                      height: 30,
                    ),
                    Heading(context, 'S-PLY TV'),
                    FutureBuilder(
                      future: tvlisting.getTVContent(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          final item = snapshot.data;
                          for (var a = 0; a < item.length; a++) {
                            thumbnail.add(item[a]['video_cover_image']);
                          }
                          for (var a = 0; a < item.length; a++) {
                            videoUrl.add(item[a]['video_resource_uri']);
                          }
                          for (var a = 0; a < item.length; a++) {
                            videoTitle.add(item[a]['video_title']);
                          }
                          return SizedBox(
                            height: width < 400 ? 230 : 240,
                            child: VideoList(
                              thumbnail: thumbnail,
                              videoUrl: videoUrl,
                              videoTitle: videoTitle,
                            ),
                          );
                        }
                      },
                    ),
                    Heading(context, 'OUR SHOWS'),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        'S-PLY TV ORIGINALS',
                        style: TextStyle(
                            fontFamily: 'RMNUEUREGULAR', fontSize: 19),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FutureBuilder(
                        future: getShow.getShowsListing(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Map<String, dynamic>>>
                                snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            final item = snapshot.data;
                            if (carouselImg.isEmpty) {
                              for (var a = 0; a < item.length; a++) {
                                carouselImg.add(item[a]['image_gif']);
                              }
                            }
                            return Column(
                              children: [
                                CarouselSlider(
                                  items: carouselImg.map((i) {
                                    return Container(
                                      child: GestureDetector(
                                        child: Image.network(i,
                                            fit: BoxFit.fitHeight),
                                        onTap: () {
                                          String id = getId(i, item);
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return TvShowsDetail(
                                              prodId: id,
                                            );
                                          }));
                                        },
                                      ),
                                      margin:
                                          EdgeInsets.only(left: 10, right: 10),
                                    );
                                  }).toList(),
                                  options: CarouselOptions(
                                      initialPage: 1,
                                      enableInfiniteScroll: false,
                                      height: width < 400
                                          ? size * 0.70
                                          : size * 0.73,
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
                                      map<Widget>(carouselImg, (index, url) {
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

                    // CarouselWithDots(
                    //   carouselImg: carouselImg,
                    // ),
                  ],
                ))
              : _bottomNavList.elementAt(_selectedIndex),
          bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
        ));
  }
}
