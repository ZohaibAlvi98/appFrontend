import 'package:flutter/material.dart';
import 'main.dart';
import 'views/home.dart';
import 'views/search.dart';
import 'views/profile.dart';
import 'views/sply-network.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
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
    return Scaffold(
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
            const Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.black54,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(icon: Icon(Icons.circle), label: 'S'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.wifi), label: 'S-PLY RSS'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Profile'),
            ],
            currentIndex: _selectedIndex,
            selectedLabelStyle: TextStyle(),
            selectedItemColor: Colors.amber[800],
            unselectedItemColor: Colors.white,
            iconSize: 30,
            onTap: _onItemTapped,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
