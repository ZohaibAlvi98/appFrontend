import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 's-plyrs/splyrs-main.dart';
import 'sneakers/sneakers-main.dart';
import 'styles/styles-main.dart';
import 'tv/tv-main.dart';
import '../widgets/innerAppBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../dashboard.dart';
import 'package:splyxp/widgets/homescreenpicturetext.dart';
import 'package:splyxp/widgets/homescreentextpicture.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = -1;

  Future<bool> getAuth() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool name = _prefs.getBool("auth");
    return name;
  }

  bool authenticated;

  @override
  void initState() {
    getAuth().then((bool val) => {
          // print(val),
          setState(() {
            this.authenticated = val;
          })
        });
    super.initState();
  }

  void _navigatorPage() {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          if (_selectedIndex == 0) {
            return Splyrs();
          } else if (_selectedIndex == 1) {
            return Styles();
          } else if (_selectedIndex == 2) {
            return Tv();
          } else if (_selectedIndex == 3) {
            return Sneakers();
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
    double height = MediaQuery.of(context).size.height;

    return authenticated == null
        ? SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.015,
                    ),
                    child: IconButton(
                      icon: Image.asset(
                        'assets/images/home/burger-menu.png',
                        height: height * 0.03,
                      ),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                  Center(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/home/homelogo.png',
                            height: height * 0.055,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Experiential Retail and \nInteractive Shopping Platform.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'RMNUEUREGULAR',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  Column(
                    children: [
                      HomeScreenButtonTextPicture(
                        boldText: 'SHOP',
                        infotext: 'Tap to shop from our\nSPLYR Directory',
                        imgPath: 'assets/images/home/shophome.jpg',
                        onPressed: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                          _navigatorPage();
                        },
                      ),
                      HomeScreenButtonPictureText(
                        boldText: 'STYLES',
                        infotext:
                            'Tap to see our collection\nof Featured Styles',
                        imgPath: 'assets/images/home/styleshome.jpg',
                        onPressed: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                          _navigatorPage();
                        },
                      ),
                      HomeScreenButtonTextPicture(
                        boldText: 'TV',
                        infotext:
                            'Tap to view our SPLYR\nChannels and Broadcasts',
                        imgPath: 'assets/images/home/tvhome.jpg',
                        onPressed: () {
                          setState(() {
                            _selectedIndex = 2;
                          });
                          _navigatorPage();
                        },
                      ),
                      HomeScreenButtonPictureText(
                        boldText: 'SNEAKERS',
                        infotext:
                            'Tap to view our latest\ncollection of sneakers',
                        imgPath: 'assets/images/home/sneakershome.jpg',
                        onPressed: () {
                          setState(() {
                            _selectedIndex = 3;
                          });
                          _navigatorPage();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : Dashboard();
  }
}
