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
import '../services/home-api.dart';

HomeContent homedata = HomeContent();

class Home extends StatefulWidget {
  final bool authenticated;
  Home({Key key, this.authenticated}) : super(key: key);
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

  bool authenticatedLogin;

  @override
  void initState() {
    getAuth().then((bool val) => {
          // print(val),
          setState(() {
            this.authenticatedLogin = val;
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

    return authenticatedLogin == null
        ? SafeArea(
            child: Scaffold(
              appBar: appbarNew(context),
              drawer: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.black,
                  ),
                  child: drawerAppBar(context, 'home', widget.authenticated)),
              backgroundColor: Colors.white,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                                // fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  FutureBuilder(
                    future: homedata.getHomeContent(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        final item = snapshot.data;
                        print(snapshot);
                        return Column(
                          children: [
                            HomeScreenButtonTextPicture(
                              boldText: item[0]['sec_1_heading'],
                              infotext: item[0]['sec_1_text'],
                              imgPath: item[0]['sec_1_image'],
                              onPressed: () {
                                setState(() {
                                  _selectedIndex = 0;
                                });
                                _navigatorPage();
                              },
                            ),
                            HomeScreenButtonPictureText(
                              boldText: item[0]['sec_2_heading'],
                              infotext: item[0]['sec_2_text'],
                              imgPath: item[0]['sec_2_image'],
                              onPressed: () {
                                setState(() {
                                  _selectedIndex = 1;
                                });
                                _navigatorPage();
                              },
                            ),
                            HomeScreenButtonTextPicture(
                              boldText: item[0]['sec_3_heading'],
                              infotext: item[0]['sec_3_text'],
                              imgPath: item[0]['sec_3_image'],
                              onPressed: () {
                                setState(() {
                                  _selectedIndex = 2;
                                });
                                _navigatorPage();
                              },
                            ),
                            HomeScreenButtonPictureText(
                              boldText: item[0]['sec_4_heading'],
                              infotext: item[0]['sec_4_text'],
                              imgPath: item[0]['sec_4_image'],
                              onPressed: () {
                                setState(() {
                                  _selectedIndex = 3;
                                });
                                _navigatorPage();
                              },
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          )
        : Dashboard();
  }
}
