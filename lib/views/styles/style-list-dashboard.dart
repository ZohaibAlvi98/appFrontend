import 'package:flutter/material.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import 'package:splyxp/widgets/InnerAppBar.dart';
import 'package:splyxp/widgets/horizontalList.dart';
import 'package:splyxp/widgets/lineHeading.dart';
import 'package:splyxp/widgets/navbar.dart';
import 'package:splyxp/widgets/roundedCard.dart';
import '../search/search.dart';
import '../../views/sply-network.dart';
import '../auth/signup/signup.dart';
import '../../services/styles/featured-style-boxes.dart';
import '../../services/styles/styles-general-content.dart';
import '../../services/styles/featured-styles-listing.dart';

FeaturedStyleListing datastyle = FeaturedStyleListing();

class StylesDashboard extends StatefulWidget {
  final bool authenticated;
  StylesDashboard({Key key, this.authenticated}) : super(key: key);
  @override
  _StylesDashboardState createState() => _StylesDashboardState();
}

class _StylesDashboardState extends State<StylesDashboard> {
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
    StylesDashboard(),
    Search(),
    ChatList(),
    SplyNetwork(),
    Signup()
  ];

  // void _navigatorPage(index, id) {
  //   // Navigator.of(context).pop(new PageRouteBuilder());
  //   Navigator.of(context).push(new PageRouteBuilder(
  //       opaque: true,
  //       transitionDuration: const Duration(),
  //       pageBuilder: (BuildContext context, _, __) {
  //         if (index == 'styleDetail') {
  //           return StyleDetail(
  //             styleId: null,
  //           );
  //         } else if (index == 'boxDetail') {
  //           return ProductDetailStyleBox(
  //             prodId: id,
  //           );
  //         } else {
  //           return StylistChannel();
  //         }
  //       },
  //       transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
  //         return new SlideTransition(
  //           child: child,
  //           position: new Tween<Offset>(
  //             begin: const Offset(1.0, 0.0),
  //             end: Offset.zero,
  //           ).animate(animation),
  //         );
  //       }));
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double size = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;

    return WillPopScope(
        onWillPop: () async {
          if (_selectedIndex == 0) return true;
          setState(() {
            _selectedIndex = 0;
          });
          return false;
        },
        child: Scaffold(
          // App bar
          appBar: appbarWithMenu(context),
          drawer: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors
                    .black, //This will change the drawer background to blue.
                //other styles
              ),
              child: drawerAppBar(context, 'styles', widget.authenticated)),
          body: _selectedIndex == 0
              ? SingleChildScrollView(
                  // key: new PageStorageKey('feed'),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),

                      Heading(context, 'FEATURED STYLES'),
                      SizedBox(
                        height: 20,
                      ),
                      // Image and Rounded Card
                      FutureBuilder(
                          future: datastyle.getFeaturedStyleList(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Map<String, dynamic>>>
                                  snapshot) {
                            if (snapshot.hasData) {
                              return GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.only(
                                      left: 0, right: 0, top: 2),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: MediaQuery.of(context)
                                            .size
                                            .width /
                                        (MediaQuery.of(context).size.height /
                                            0.82),
                                  ),
                                  // scrollDirection: Axis.vertical,
                                  itemCount: snapshot.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final item = snapshot.data[index];
                                    return Column(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  right: 20, left: 20.0),
                                              child: Stack(children: [
                                                Image.network(
                                                    item['images_data']
                                                        ['image']),
                                                RoundedCard(
                                                    context,
                                                    0.97,
                                                    0.97,
                                                    item['0']['style_owner'],
                                                    item['0']['likes'],
                                                    item['created_date'],
                                                    item['splyr_logo']),
                                              ]),
                                            ),
                                            // Thome Brown Content
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 30, left: 23, right: 20),
                                              child: Text(
                                                item['0']['style_title'],
                                                style: TextStyle(
                                                    fontFamily:
                                                        'RMNUEUSEMIBOLD',
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 15, left: 23, right: 23),
                                              child: Text(
                                                item['0']['style_description'],
                                                style: TextStyle(
                                                    fontFamily: 'RMNUEUREGULAR',
                                                    fontSize: 16,
                                                    height: 1.5,
                                                    color: Colors.grey[600],
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                          ],
                                        ),
                                        // horizontal Scrolling list
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 270,
                                              child:
                                                  horizontalListStylesProducts(
                                                      context,
                                                      item['0']['style_id']),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  });
                            } else if (snapshot.hasError) {
                              print(snapshot.error);
                              print('Sorry');
                            }
                            return Center(child: CircularProgressIndicator());
                          }),
                    ],
                  ),
                )
              : _bottomNavList.elementAt(_selectedIndex),
          bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
        ));
  }
}
