import 'package:flutter/material.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import 'package:splyxp/widgets/carousels.dart';
import 'package:splyxp/widgets/navbar.dart';
import 'package:splyxp/widgets/InnerAppBar.dart';
import 'package:splyxp/widgets/lineHeading.dart';
import 'package:splyxp/widgets/horizontalList.dart';
import 'package:splyxp/widgets/videoList.dart';

import '../../views/search.dart';
import '../../views/profile.dart';
import '../../views/sply-network.dart';
import '../../views/home.dart';

class Tv extends StatefulWidget {
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
    Profile()
  ];
  List img = [
    'assets/images/tv/list1.jpg',
    'assets/images/tv/list2.jpg',
    'assets/images/tv/list3.jpg',
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
          appBar: Appbar(context),

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
                          ? EdgeInsets.only(top: 20.0, left: 50, right: 30)
                          : EdgeInsets.only(top: 20.0, left: 55, right: 32),
                      child: Text(
                          'S-ply seemlessly blends interaction and e commerce. Connect yourself to daily shoppables featuring.',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w400)),
                    ),

                    // Featured Style Heading
                    Heading(context, 'FEATURED PRODUCTS'),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        height: 370, child: horizontalListWith2(context, img)),
                    SizedBox(
                      height: 30,
                    ),
                    Heading(context, 'S-PLY TV'),
                    SizedBox(
                        height: 350,
                        child: VideoList(
                            thumbnail: thumbnail, videoUrl: videoUrl)),

                    Text(
                      'OUR SHOWS',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'S-PLY TV ORIGINALS',
                        style: TextStyle(fontSize: 19),
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
