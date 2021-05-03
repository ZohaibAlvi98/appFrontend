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
import '../../services/splyrs/splyr-style-detail.dart';

SplyrStyleDetail styledetaildata = SplyrStyleDetail();

class StyleDetail extends StatefulWidget {
  final String styleId;
  StyleDetail({Key key, @required this.styleId}) : super(key: key);
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
    StyleDetail(
      styleId: null,
    ),
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
              child: drawerAppBar(context, '', false)),
          body: _selectedIndex == 0
              ? FutureBuilder(
                  future: styledetaildata.getSplyrStyleDetail(widget.styleId),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      final item = snapshot.data[index];

                      print(snapshot);
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 20, left: 20),
                              child: Stack(children: [
                                Image.network(item['cover_image']),
                                RoundedCardDetail(
                                    context,
                                    0.97,
                                    0.97,
                                    item['splyr_name'],
                                    item['likes'],
                                    item['created_at']),
                              ]),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 30, left: 23, right: 20),
                              child: Text(
                                item['title'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 15, left: 23, right: 23),
                              child: Text(
                                item['description'],
                                style: TextStyle(
                                    fontFamily: 'RMNUEUREGULAR',
                                    fontSize: 16,
                                    height: 1.5,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 270,
                                  child: horizontalListStylesProductsSplyrs(
                                      context, item['linked_products']),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      );
                    }
                  })
              // Thome Brown Content
              : _bottomNavList.elementAt(_selectedIndex),
          bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
        ));
  }
}
