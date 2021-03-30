import 'package:flutter/material.dart';
import '../../widgets/innerAppBar.dart';
import 'package:splyxp/widgets/navbar.dart';

import '../search/search.dart';
import '../../views/profile.dart';
import '../../views/sply-network.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import './category-detail/tops.dart';
import '../auth/signup/signup.dart';

class ByCategory extends StatefulWidget {
  final bool authenticated;
  ByCategory({Key key, this.authenticated}) : super(key: key);
  @override
  _ByCategoryState createState() => _ByCategoryState();
}

class _ByCategoryState extends State<ByCategory> {
  int index = 0;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    if (index == 0 && _selectedIndex == 0) {
      Navigator.of(context).pop();
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigatorPage(index) {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          if (index == 'tops')
            return Tops();
          else
            return null;
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

  List img = [
    'assets/images/ByCategories/tops.jpg',
    'assets/images/ByCategories/bottoms.jpg',
    'assets/images/ByCategories/hoodies.jpg',
    'assets/images/ByCategories/sneakers.jpg',
    'assets/images/ByCategories/shoes.jpg',
    'assets/images/ByCategories/coats.jpg',
    'assets/images/ByCategories/shorts.jpg',
    'assets/images/ByCategories/accessories.jpg',
    'assets/images/ByCategories/sweaters.jpg'
  ];

  static List<Widget> _bottomNavList = [
    ByCategory(),
    Search(),
    ChatList(),
    SplyNetwork(),
    Signup()
  ];

  static List<Widget> _bottomNavDashboardList = [
    ByCategory(),
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
        appBar: appbarWithMenu(context),
        drawer: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors
                  .black, //This will change the drawer background to blue.
              //other styles
            ),
            child: _selectedIndex == 0
                ? drawerAppBar(context, 'category', widget.authenticated)
                : Container()),
        body: _selectedIndex == 0
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(left: 5, right: 5, top: 0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        // scrollDirection: Axis.vertical,
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: index != 0 && index != 1
                                ? EdgeInsets.only(left: 7.0, right: 7, top: 10)
                                : EdgeInsets.only(left: 7.0, right: 7, top: 4),
                            child: InkWell(
                              onTap: () {
                                _navigatorPage('tops');
                              },
                              child: Image.asset(
                                img[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              )
            : widget.authenticated == true
                ? _bottomNavDashboardList.elementAt(_selectedIndex)
                : _bottomNavList.elementAt(_selectedIndex),
        bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
      ),
    );
  }
}
