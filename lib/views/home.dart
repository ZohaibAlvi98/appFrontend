import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import './s-plyrs/splyrs-main.dart';
import './sneakers/sneakers-main.dart';
import './styles/styles-main.dart';
import './tv/tv-main.dart';
import '../widgets/innerAppBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../dashboard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = -1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _navigatorPage();
    });
  }

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

  // static List<Widget> _cardSelected = [Splyrs(), Styles(), Tv(), Sneakers()];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List img = [
      'assets/images/home/home4.png',
      'assets/images/home/home1.png',
      'assets/images/home/home5.png',
      'assets/images/home/home2.png'
    ];
    return authenticated == null
        ? Scaffold(
            body: Column(
              children: [
                Container(
                  child: Stack(
                    children: [
                      Container(
                        child: FittedBox(
                          child: Image.asset(
                            'assets/images/home/home-banner.jpg',
                          ),
                          fit: BoxFit.fill,
                        ),
                        height: 270,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: height * 0.03,
                              right: width * 0.88,
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.menu,
                                color: Colors.black,
                                size: width * 0.07,
                              ),
                              onPressed: () =>
                                  Scaffold.of(context).openDrawer(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: width * 0.03,
                              right: width * 0.6,
                              bottom: height * 0.01,
                            ),
                            child: Image.asset(
                              'assets/images/home/home3.jpg',
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.03, bottom: height * 0.006),
                              child: Text(
                                "Experimental Retail and\nInteractive Shopping Platform.",
                                style: TextStyle(
                                    fontFamily: 'RMNUEUSEMIBOLD',
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: width * 0.03,
                              ),
                              child: Text(
                                "SPLY is a personalized style discovery\nand shopping as service where\nstyle meets fashion",
                                style: TextStyle(
                                    fontFamily: 'RMNUEUREGULAR',
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(left: 30, right: 30, top: 25),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.6),
                    ),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                      onTap: () => _onItemTapped(index),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Image.asset(img[index],
                                fit: BoxFit.fill,
                                // height: 220,
                                width: 173),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // GridView.builder(
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2, childAspectRatio: 0.9
                //       // MediaQuery.of(context).size.width /
                //       //     (MediaQuery.of(context).size.height / 1.59),
                //       ),
                //   itemCount: 4,
                //   itemBuilder: (BuildContext context, int index) =>
                //       GestureDetector(
                //     onTap: () => _onItemTapped(index),
                //     child: Card(
                //       elevation: 0,
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(20)),
                //       child: Column(
                //         children: <Widget>[
                //           Image.asset(img[index], width: 100),
                //         ],
                //       ),
                //     ),
                //   ),
                //   padding: EdgeInsets.only(top: 5),
                // ),
              ],
            ),
          )
        : Dashboard();
  }
}
