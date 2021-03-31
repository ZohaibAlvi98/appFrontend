import 'package:flutter/material.dart';
import 'package:splyxp/views/drawer/men&women.dart';
import 'package:splyxp/widgets/innerAppBar.dart';
import 'package:splyxp/widgets/navbar.dart';
import '../../views/search/search.dart';
import '../../views/profile.dart';
import '../../views/sply-network.dart';
import 'package:splyxp/views/chatList/chat-main.dart';

class Womens extends StatefulWidget {
  @override
  _WomensState createState() => _WomensState();
}

class _WomensState extends State<Womens> {
  int index = 0;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _bottomNavList = [
    Womens(),
    Search(),
    ChatList(),
    SplyNetwork(),
    Profile()
  ];

  List img = [
    'assets/images/splyrs/channels/prod1.jpg',
    'assets/images/splyrs/channels/prod2.jpg',
    'assets/images/splyrs/channels/prod3.jpg',
    'assets/images/splyrs/channels/prod4.jpg',
    'assets/images/splyrs/channels/prod5.jpg',
    'assets/images/splyrs/channels/prod6.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                ? drawerAppBar(context, 'womens')
                : Container()),
        body: _selectedIndex == 0
            ? SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/images/womans/cover1.jpg',
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 40, top: width / 4.6),
                              // child: Text(
                              //   '',
                              //   style: TextStyle(
                              //       fontSize: width < 400 ? 23 : 30,
                              //       fontWeight: FontWeight.w900,
                              //       letterSpacing: 1.1),
                              // ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 10.0, top: 20, right: 10),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(
                                      color: Colors.black87, width: 1.4)),
                              onPressed: () {
                                // _navigatorPage();
                              },
                              child: Text(
                                'FILTER',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              color: Colors.white,
                              minWidth: 140,
                              height: 45,
                            ),
                          ),
                        ],
                      ),
                      GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(left: 1, right: 1, top: 20),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 1.49),
                          ),
                          // scrollDirection: Axis.vertical,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return lists(context, 'men', index);
                          }),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              )
            : _bottomNavList.elementAt(_selectedIndex),
        bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
      ),
    );
  }
}
