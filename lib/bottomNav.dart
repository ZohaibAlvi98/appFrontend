import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:collection';
import 'views/home.dart';
import 'views/search.dart';
import 'views/profile.dart';
import 'views/sply-network.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  ListQueue<int> _navigationQueue = ListQueue();
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
    Home(),
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
          // bottomNavigationBar: BottomNavigationBar(
          //     items: const <BottomNavigationBarItem>[
          //       BottomNavigationBarItem(
          //         icon: Icon(Icons.home),
          //         label: 'Home',
          //       ),
          //       BottomNavigationBarItem(
          //         icon: Icon(Icons.search),
          //         label: 'Search',
          //       ),
          //       BottomNavigationBarItem(
          //         icon: Icon(Icons.shopping_cart_outlined),
          //         label: 'Cart',
          //       ),
          //     ],
          //     currentIndex: _selectedIndex,
          //     selectedItemColor: Colors.amber[800],
          //     onTap: _onItemTapped),
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(bottom: 3, left: 20, right: 20),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                const Radius.circular(40.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.black87,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      activeIcon: new Image.asset(
                        'assets/images/homeIcon.png',
                        height: 23,
                      ),
                      icon: new Image.asset(
                        'assets/images/homeIconInactive.png',
                        height: 23,
                      ),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      activeIcon: Image.asset(
                        'assets/images/searchIcon.png',
                        height: 23,
                      ),
                      icon: Image.asset(
                        'assets/images/searchIconInactive.png',
                        height: 23,
                      ),
                      label: 'Search'),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(top: 3.0),
                        child: Image.asset(
                          'assets/images/homeIconLogo.png',
                          height: 35,
                        ),
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      activeIcon: Image.asset(
                        'assets/images/networkIcon.png',
                        height: 23,
                      ),
                      icon: Image.asset(
                        'assets/images/networkIconInactive.png',
                        height: 23,
                      ),
                      label: 'SPLY RSS'),
                  BottomNavigationBarItem(
                      activeIcon: Image.asset(
                        'assets/images/profileIcon.png',
                        height: 20,
                      ),
                      icon: Image.asset(
                        'assets/images/profileIconInactive.png',
                        height: 20,
                      ),
                      label: 'Profile'),
                ],
                currentIndex: _selectedIndex,
                selectedLabelStyle: TextStyle(),
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey[500],
                iconSize: 30,
                onTap: _onItemTapped,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
              ),
            ),
          ),
        ));
  }
}
