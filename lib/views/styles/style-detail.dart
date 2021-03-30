import 'package:flutter/material.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import 'package:splyxp/views/products/product-detail.dart';
import 'package:splyxp/widgets/InnerAppBar.dart';
import 'package:splyxp/widgets/cart-item.dart';
import 'package:splyxp/widgets/horizontalList.dart';
import 'package:splyxp/widgets/lineHeading.dart';
import 'package:splyxp/widgets/navbar.dart';
import 'package:splyxp/widgets/roundedCard.dart';
import '../search/search.dart';
import '../../views/profile.dart';
import '../../views/sply-network.dart';

class StyleDetail extends StatefulWidget {
  @override
  _StyleDetailState createState() => _StyleDetailState();
}

class _StyleDetailState extends State<StyleDetail> {
  List img = [
    'assets/images/styles/list1.png',
    'assets/images/styles/list2.png',
    'assets/images/styles/list3.jpg',
    'assets/images/styles/list4.jpg'
  ];
  int index = 0;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    if (_selectedIndex == 0 && index == 0) {
      Navigator.of(context).pop();
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigatorPage() {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          return ProductDetail();
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

  static List<Widget> _bottomNavList = [
    StyleDetail(),
    Search(),
    ChatList(),
    SplyNetwork(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: null,
        child: Scaffold(
          appBar: appbarWithMenu(context),
          drawer: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors
                    .black, //This will change the drawer background to blue.
                //other styles
              ),
              child: drawerAppBar(context, '')),
          body: _selectedIndex == 0
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 20, left: 20),
                        child: Stack(children: [
                          Image.asset('assets/images/styles/style3.jpg'),
                          RoundedCard(context, 0.97, 0.97),
                        ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35, left: 30, right: 30),
                        child: Text(
                          'Thome Brown Winter Clothing Styling By End Clothing',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18, left: 32, right: 30),
                        child: Text(
                          'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
                          style: TextStyle(
                              fontSize: 16,
                              height: 1.5,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () {
                          _navigatorPage();
                        },
                        child: item('assets/images/styleDetail/list1.jpg',
                            width, 'Thome Brown 4 Jacket', false),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          _navigatorPage();
                        },
                        child: item('assets/images/styleDetail/list2.jpg',
                            width, 'Thome Brown 4 Short', false),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          _navigatorPage();
                        },
                        child: item('assets/images/styleDetail/list3.jpg',
                            width, 'Thome Brown 4 Shoe', false),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          _navigatorPage();
                        },
                        child: item('assets/images/styleDetail/list4.jpg',
                            width, 'Thome Brown 4 Shirt', false),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              // Thome Brown Content
              : _bottomNavList.elementAt(_selectedIndex),
          bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
        ));
  }
}
