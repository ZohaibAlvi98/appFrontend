import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  final Function _onItemTapped;
  int _selectedIndex = 0;
  Navbar(this._onItemTapped, this._selectedIndex);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  void _onItemsTapped(int index) {
    this.widget._onItemTapped(index);
    setState(() {
      this.widget._selectedIndex = index;
    });
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      'assets/images/home/homeIcon.png',
                      height: 23,
                    ),
                    icon: new Image.asset(
                      'assets/images/home/homeIconInactive.png',
                      height: 23,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    activeIcon: Image.asset(
                      'assets/images/home/searchIcon.png',
                      height: 23,
                    ),
                    icon: Image.asset(
                      'assets/images/home/searchIconInactive.png',
                      height: 23,
                    ),
                    label: 'Search'),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(top: 3.0),
                      child: Image.asset(
                        'assets/images/home/homeIconLogo.png',
                        height: 35,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon: Image.asset(
                      'assets/images/home/networkIcon.png',
                      height: 23,
                    ),
                    icon: Image.asset(
                      'assets/images/home/networkIconInactive.png',
                      height: 23,
                    ),
                    label: 'SPLY RSS'),
                BottomNavigationBarItem(
                    activeIcon: Image.asset(
                      'assets/images/home/profileIcon.png',
                      height: 20,
                    ),
                    icon: Image.asset(
                      'assets/images/home/profileIconInactive.png',
                      height: 20,
                    ),
                    label: 'Profile'),
              ],
              currentIndex: this.widget._selectedIndex,
              selectedLabelStyle: TextStyle(),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey[500],
              iconSize: 30,
              onTap: _onItemsTapped,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
            )));
  }
}
