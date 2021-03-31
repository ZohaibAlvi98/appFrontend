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
    Profile()
  ];

  static List<Widget> _bottomNavDashboardList = [
    Dashboard(),
    Search(),
    ChatList(),
    SplyNetwork(),
    Profile()
  ];

  bool authenticated;
  String login;
  String pass;
  int id;
  Future<String> getPass() async {
    SharedPreferences _prefs2 = await SharedPreferences.getInstance();

    String pass = _prefs2.getString("pass");

    return pass;
  }

  Future<String> getLogin() async {
    SharedPreferences _prefs2 = await SharedPreferences.getInstance();
    String login = _prefs2.getString("login");

    return login;
  }

  Future<bool> getAuth() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool name = _prefs.getBool("auth");

    return name;
  }

  Future<int> getId() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    int id = _prefs.getInt("id");

    return id;
  }

  Future<bool> clear() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.clear();
    return _prefs.commit();
  }

  @override
  void initState() {
    // clear().then((bool value) async => {
    getAuth().then((bool val) async => {
          getId().then((int id) => {
                getLogin().then((String log) => {
                      print(log),
                      getPass().then((String pass) => {
                            print(pass),
                            setState(() {
                              this.id = id;
                              this.login = log;
                              this.pass = pass;
                              this.authenticated = val;
                            })
                          })
                    })
              }), // print(val),
          // })
        });
    super.initState();
  }

  void check() {
    print(authenticated);
    print(login);
    print('login');
    print(pass);
    print(id);
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
              appBar: appbarWithMenu(context),
              drawer: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors
                        .black, //This will change the drawer background to blue.
                    //other styles
                  ),
                  child: drawerAppBar(context, '')),
              body: _bottomNavList.elementAt(_selectedIndex),
              bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
            ))
        : Scaffold(
            appBar: appbarWithMenu(context),
            drawer: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors
                      .black, //This will change the drawer background to blue.
                  //other styles
                ),
                child: drawerAppBar(context, '')),
            body: _bottomNavDashboardList.elementAt(_selectedIndex),
            bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
          );
  }
}
