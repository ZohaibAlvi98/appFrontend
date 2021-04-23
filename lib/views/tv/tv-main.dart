import 'package:flutter/material.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import 'package:splyxp/widgets/carousels.dart';
import 'package:splyxp/widgets/navbar.dart';
import 'package:splyxp/widgets/InnerAppBar.dart';
import 'package:splyxp/widgets/lineHeading.dart';
import 'package:splyxp/widgets/horizontalList.dart';
import 'package:splyxp/widgets/videoList.dart';

import '../search/search.dart';
import '../../views/profile.dart';
import '../../views/sply-network.dart';
import '../auth/signup/signup.dart';

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
  List thumbnail = [
    'assets/images/tv/v1.png',
    'assets/images/tv/v2.png',
    'assets/images/tv/v3.png',
    'assets/images/tv/v4.png'
  ];
  List videoUrl = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'
  ];
  List carouselImg = [
    'assets/images/tv/showCarousel1.jpg',
    'assets/images/tv/showCarousel1.jpg',
    'assets/images/tv/showCarousel1.jpg',
    // 'assets/images/item4.jpg'
  ];
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
                canvasColor: Colors.black,
              ),
              child: drawerAppBar(context, 'tv', widget.authenticated)),
          body: _selectedIndex == 0
              ? SingleChildScrollView(
                  child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 20, left: 20),
                      child: Image.asset(
                        'assets/images/tv/main.jpg',
                      ),
                    ),
                    Padding(
                      padding: width < 400
                          ? EdgeInsets.only(top: 20.0, left: 50, right: 15)
                          : EdgeInsets.only(top: 20.0, left: 55, right: 32),
                      child: Text(
                          'S-PLY seemlessly blends interaction and e commerce. Connect yourself to daily shoppables featuring.',
                          style: TextStyle(
                              fontFamily: 'RMNUEUREGULAR',
                              fontSize: 20,
                              height: 1.3,
                              color: Colors.black,
                              fontWeight: FontWeight.w400)),
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
                    SizedBox(
                        height: width < 400 ? 230 : 240,
                        child: VideoList(
                            thumbnail: thumbnail, videoUrl: videoUrl)),

                    Heading(context, 'OUR SHOWS'),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        'S-PLY TV ORIGINALS',
                        style: TextStyle(
                            fontFamily: 'RMNUEUREGULAR', fontSize: 19),
                      ),
                    ),
                    CarouselWithDots(
                      carouselImg: carouselImg,
                    ),
                  ],
                ))
              : _bottomNavList.elementAt(_selectedIndex),
          bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
        ));
  }
}
