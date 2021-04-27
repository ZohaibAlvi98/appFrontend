import 'package:flutter/material.dart';
import 'package:splyxp/views/drawer/men&women.dart';
import 'package:splyxp/widgets/innerAppBar.dart';
import 'package:splyxp/widgets/navbar.dart';
import '../../views/search/search.dart';
import '../../views/profile.dart';
import '../../views/sply-network.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import '../auth/signup/signup.dart';
import 'package:splyxp/views/products/product-detail-withapi.dart';
import '../../services/drawr-services.dart';
import 'package:intl/intl.dart';
import 'package:splyxp/widgets/lists.dart';
import 'package:splyxp/widgets/lineHeading.dart';

class Mens extends StatefulWidget {
  final bool authenticated;
  Mens({Key key, this.authenticated}) : super(key: key);
  @override
  _MensState createState() => _MensState();
}

class _MensState extends State<Mens> {
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

  static List<Widget> _bottomNavList = [
    Mens(),
    Search(),
    ChatList(),
    SplyNetwork(),
    Signup()
  ];

  List img = [
    'assets/images/splyrs/channels/prod3.jpg',
    'assets/images/splyrs/channels/prod2.jpg',
    'assets/images/splyrs/channels/prod1.jpg',
    'assets/images/splyrs/channels/prod4.jpg',
    'assets/images/splyrs/channels/prod5.jpg',
    'assets/images/splyrs/channels/prod6.jpg'
  ];
  DrawrServices data = DrawrServices();

  static List<Widget> _bottomNavDashboardList = [
    Mens(),
    Search(),
    ChatList(),
    SplyNetwork(),
    Profile()
  ];

  String getBrand(prodList) {
    for (var a = 0; a < prodList['meta_data'].length; a++) {
      if (prodList['meta_data'][a]['key'] == '_select_brand') {
        return prodList['meta_data'][a]['value'];
      }
    }
  }

  void _navigatorPage(context, id) {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          return ProductDetail(
            prodId: id,
          );
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
    print(widget.authenticated);
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
              canvasColor: Colors.black,
            ),
            child: _selectedIndex == 0
                ? drawerAppBar(context, 'mens', widget.authenticated)
                : Container()),
        body: _selectedIndex == 0
            ? SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Heading(context, 'MEN\'S COLLECTION'),
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
                      FutureBuilder(
                          future: data.getDrawrProducts("112"),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Map<String, dynamic>>>
                                  snapshot) {
                            if (snapshot.hasData) {
                              return GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.only(
                                      left: 1, right: 1, top: 20),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: MediaQuery.of(context)
                                            .size
                                            .width /
                                        (MediaQuery.of(context).size.height /
                                            1.1),
                                  ),
                                  itemCount: snapshot.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final item = snapshot.data[index];
                                    final brand = getBrand(item);
                                    return InkWell(
                                      onTap: () => _navigatorPage(
                                          context, item['id'].toString()),
                                      child: Lists(
                                        context,
                                        'men',
                                        item['images'][0]['src'],
                                        index,
                                        item['name'],
                                        item['price'],
                                        item['id'].toString(),
                                        brand,
                                      ),
                                    );
                                  });
                            } else if (snapshot.hasError) {
                              print(snapshot.error);
                              print('Sorry');
                            }
                            return Center(child: CircularProgressIndicator());
                          }),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
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
