import 'package:flutter/material.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import 'package:splyxp/widgets/innerAppBar.dart';
import 'package:splyxp/widgets/navbar.dart';
import 'views/home.dart';
import 'views/search/search.dart';
import 'views/profile.dart';
import 'views/sply-network.dart';
import './views/auth/signup/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './dashboard.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _bottomNavList = [
    Home(),
    Search(),
    ChatList(),
    SplyNetwork(),
    Signup()
  ];
  bool authenticated;
  Future<bool> getAuth() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool name = _prefs.getBool("auth");
    return name;
  }

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

  void check() {
    print(authenticated);
  }

  @override
  Widget build(BuildContext context) {
    check();
    double width = MediaQuery.of(context).size.width;
    return authenticated == null
        ? WillPopScope(
            onWillPop: () async {
              if (_selectedIndex == 0) return true;
              setState(() {
                _selectedIndex = 0;
              });
              return false;
            },
            child: Scaffold(
              appBar: _selectedIndex == 0
                  ? AppBar(
                      leading: Builder(
                        builder: (context) => IconButton(
                          icon: new Icon(
                            Icons.menu,
                            color: Colors.black,
                            size: width * 0.11,
                          ),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                      ),
                      toolbarHeight: 60,
                      elevation: 0,
                      centerTitle: true,
                      backgroundColor: Colors.white12,
                      title: Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Image.asset(
                          'assets/images/home3.png',
                          height: 40,
                        ),
                      ))
                  : Appbar(context),
              drawer: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors
                        .black, //This will change the drawer background to blue.
                    //other styles
                  ),
                  child: _selectedIndex == 0
                      ? drawerAppBar(context, '')
                      : Container()),
              body: _bottomNavList.elementAt(_selectedIndex),
              bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
            ))
        : Dashboard();
  }
}
