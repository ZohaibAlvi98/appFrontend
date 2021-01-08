import 'package:flutter/material.dart';
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
    Home(),
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
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
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
                          return Image.asset(gridImg[a]);
                        }

                        a++;
                        return Image.asset(gridImg[a]);
                      }

                      return Container(
                        child: Center(child: Text('hello karak')),
                      );
                    },
                  ),
                ]))
              : _bottomNavList.elementAt(_selectedIndex),
          bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
        ));
  }
}
