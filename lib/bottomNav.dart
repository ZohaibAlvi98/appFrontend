import 'package:flutter/material.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import 'package:splyxp/widgets/navbar.dart';
import 'views/home.dart';
import 'views/search.dart';
import 'views/profile.dart';
import 'views/sply-network.dart';

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
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (_selectedIndex == 0) return true;
          setState(() {
            _selectedIndex = 0;
          });
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
              toolbarHeight: 60,
              elevation: 0,
              backgroundColor: Colors.white12,
              title: Center(
                child: Image.asset(
                  'assets/images/home3.png',
                  height: 40,
                ),
              )),
          body: _bottomNavList.elementAt(_selectedIndex),
          bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
        ));
  }
}
