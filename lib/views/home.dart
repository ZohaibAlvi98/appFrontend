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
import 'package:splyxp/views/auth/signup/signup.dart';
import 'package:splyxp/views/search/search.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import 'package:splyxp/views/sply-network.dart';
import 'package:splyxp/widgets/navbar.dart';

HomeContent homedata = HomeContent();

class Home extends StatefulWidget {
  final bool authenticated;
  final List<Map<String, dynamic>> data;
  Home({Key key, this.authenticated, this.data}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = -1;
  String sec1Heading;
  String sec1Text;
  String sec1img;
  String sec2Heading;
  String sec2Text;
  String sec2img;
  String sec3Heading;
  String sec3Text;
  String sec3img;
  String sec4Heading;
  String sec4Text;
  String sec4img;

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
    getData();
    super.initState();
  }

  getData() {
    setState(() {
      sec1Heading = widget.data[0]['sec_1_heading'];
      sec1Text = widget.data[0]['sec_1_text'];
      sec1img = widget.data[0]['sec_1_image'];
      sec2Heading = widget.data[0]['sec_2_heading'];
      sec2Text = widget.data[0]['sec_2_text'];
      sec2img = widget.data[0]['sec_2_image'];
      sec3Heading = widget.data[0]['sec_3_heading'];
      sec3Text = widget.data[0]['sec_3_text'];
      sec3img = widget.data[0]['sec_3_image'];
      sec4Heading = widget.data[0]['sec_4_heading'];
      sec4Text = widget.data[0]['sec_4_text'];
      sec4img = widget.data[0]['sec_4_image'];
    });
  }

  int _selectedIndexNav = 0;
  void _onItemTapped(int index) {
    if (_selectedIndexNav == 0 && index == 0) {
      Navigator.of(context).pop();
    }
    setState(() {
      _selectedIndexNav = index;
    });
  }

  static List<Widget> _bottomNavList = [
    Home(),
    Search(),
    ChatList(),
    SplyNetwork(),
    Signup()
  ];

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
        ? WillPopScope(
            onWillPop: () async {
              if (_selectedIndex == 0) return true;
              setState(() {
                _selectedIndex = 0;
              });
              return false;
            },
            child: SafeArea(
              child: Scaffold(
                appBar: appbarNew(context),
                drawer: Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: Colors.black,
                    ),
                    child: drawerAppBar(context, 'home', widget.authenticated)),
                backgroundColor: Colors.white,
                bottomNavigationBar: Navbar(_onItemTapped, _selectedIndexNav),
                body: _selectedIndexNav == 0
                    ? Column(
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
                          Column(
                            children: [
                              HomeScreenButtonTextPicture(
                                boldText: sec1Heading,
                                infotext: sec1Text,
                                imgPath: sec1img,
                                onPressed: () {
                                  setState(() {
                                    _selectedIndex = 0;
                                  });
                                  _navigatorPage();
                                },
                              ),
                              HomeScreenButtonPictureText(
                                boldText: sec2Heading,
                                infotext: sec2Text,
                                imgPath: sec2img,
                                onPressed: () {
                                  setState(() {
                                    _selectedIndex = 1;
                                  });
                                  _navigatorPage();
                                },
                              ),
                              HomeScreenButtonTextPicture(
                                boldText: sec3Heading,
                                infotext: sec3Text,
                                imgPath: sec3img,
                                onPressed: () {
                                  setState(() {
                                    _selectedIndex = 2;
                                  });
                                  _navigatorPage();
                                },
                              ),
                              HomeScreenButtonPictureText(
                                boldText: sec4Heading,
                                infotext: sec4Text,
                                imgPath: sec4img,
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
                      )
                    : _bottomNavList.elementAt(_selectedIndexNav),
              ),
            ),
          )
        : Dashboard();
  }
}
