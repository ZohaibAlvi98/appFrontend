import 'package:flutter/material.dart';
import 'package:splyxp/widgets/innerAppBar.dart';
import 'package:splyxp/widgets/lineHeading.dart';
import 'package:splyxp/widgets/carousels.dart';
import 'package:splyxp/views/styles/style-detail-featured.dart';
import 'package:splyxp/widgets/horizontalList.dart';
import 'views/search/search.dart';
import 'views/profile.dart';
import 'views/sply-network.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import './services/styles/featured-styles-listing.dart';
import 'package:splyxp/widgets/roundedCard.dart';
import 'package:splyxp/views/styles/style-list-dashboard.dart';
import 'package:splyxp/views/drawer/arrivals.dart';
import 'package:splyxp/views/sply-network.dart';
import 'widgets/navbar.dart';

FeaturedStyleListing stylesListingData = FeaturedStyleListing();

class Dashboard extends StatefulWidget {
  final bool authenticated;
  Dashboard({Key key, this.authenticated}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Add images
  List carouselImg = [
    'assets/images/splyrs/carousel3.jpg',
    'assets/images/splyrs/carousel1.jpg',
    'assets/images/splyrs/carousel2.jpg',

    // 'assets/images/item4.jpg'
  ];

  List subscriptionCarouselImg = [
    'assets/images/splyrs/carousel4.jpg',
    'assets/images/splyrs/carousel1.jpg',
    'assets/images/splyrs/carousel5.jpg'
  ];
  int index = 0;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    if (check == 0) {
      init(appId, authKey, authSecret);
      setState(() {
        check = 1;
      });
    }

    super.initState();
    // DO YOUR STUFF
  }

  String appId = "4451";

  String authKey = "nL5Ba8ywSMu-rGq";

  String authSecret = "vXM9T-QUXdx44pz";

  static int check = 0;

  static List<Widget> _bottomNavList = [
    Dashboard(),
    Search(),
    ChatList(),
    SplyNetwork(),
    Profile()
  ];
  void _navigatorPage(index, id) {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          if (index == 'discoverstyles')
            return StylesDashboard();
          else if (index == 'discoverupdates')
            return Arrivals();
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appbarWithMenu(context),
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor:
                Colors.black, //This will change the drawer background to blue.
            //other styles
          ),
          child: drawerAppBar(context, 'home', widget.authenticated)),
      body: _selectedIndex == 0
          ? SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            color: Colors.black87,
                            height: 320,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 40),
                                  child: Container(
                                    height: 120,
                                    decoration: new BoxDecoration(
                                        border: new Border.all(
                                          color: Colors.white,
                                          width: 4.0,
                                        ),
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2.0,
                                            spreadRadius: 0.0,
                                            offset: Offset(2.2,
                                                2.2), // shadow direction: bottom right
                                          )
                                        ]),
                                    child: Center(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(top: 0, left: 0.0),
                                        child: CircleAvatar(
                                          radius: 80.0,
                                          backgroundImage: AssetImage(
                                              'assets/images/profile/profileDashboard1.jpg'),
                                          backgroundColor: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 25),
                                    child: Text(
                                      'Hello, Mar Simons!',
                                      style: TextStyle(
                                          fontFamily: 'RMNUEU',
                                          fontSize: 22,
                                          color: Colors.white,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 0),
                                    child: Text(
                                      'Customer',
                                      style: TextStyle(
                                          fontFamily: 'RMNUEUREGULAR',
                                          fontSize: 17,
                                          color: Colors.grey[500],
                                          letterSpacing: 1),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Image.asset(
                                      'assets/images/profile/edit-profile-icon.png',
                                      width: 24,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        'Profile',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'RMNUEUREGULAR',
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // _navigatorPage('channel');
                      },
                      child: CarouselWithTextDots(
                        carouselImg: carouselImg,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Heading(context, 'FEATURED STYLES'),
                    SizedBox(
                      height: 20,
                    ),
                    FutureBuilder(
                        future: stylesListingData.getFeaturedStyleList(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Map<String, dynamic>>>
                                snapshot) {
                          if (snapshot.hasData) {
                            return GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding:
                                    EdgeInsets.only(left: 5, right: 5, top: 10),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: width < 400
                                      ? MediaQuery.of(context).size.width /
                                          (MediaQuery.of(context).size.height /
                                              1.49)
                                      : MediaQuery.of(context).size.width /
                                          (MediaQuery.of(context).size.height /
                                              1.17),
                                ),
                                // scrollDirection: Axis.vertical,
                                itemCount: 2,
                                itemBuilder: (BuildContext context, int index) {
                                  final item = snapshot.data[index];
                                  return Column(
                                    children: [
                                      styleFeatured(
                                        context,
                                        item['images_data']['image'],
                                        item['0']['style_owner'],
                                        item['created_date'],
                                        item['splyr_logo'],
                                        item['0']['likes'],
                                        item['0']['style_id'].toString(),
                                      ),
                                    ],
                                  );
                                });
                          } else if (snapshot.hasError) {
                            print(snapshot.error);
                          }
                          return Center(child: CircularProgressIndicator());
                        }),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 0),
                        child: Container(
                          height: 50,
                          width: 220,
                          child: FlatButton(
                            color: Colors.black,
                            // height: 40,
                            onPressed: () {
                              _navigatorPage('discoverstyles', '');
                            },
                            child: Text(
                              'DISCOVER MORE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'RMNUEUREGULAR'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Heading(context, 'RECENT UPDATES'),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 280,
                      child: recentUpdates(context),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 0),
                        child: Container(
                          height: 50,
                          width: 220,
                          child: FlatButton(
                            color: Colors.black,
                            // height: 40,
                            onPressed: () {
                              _navigatorPage('discoverupdates', '');
                            },
                            child: Text(
                              'DISCOVER MORE',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Heading(context, 'EDITORIAL'),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 460,
                      child: RectangularSlider(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 0),
                        child: Container(
                          height: 50,
                          width: 220,
                          child: FlatButton(
                            color: Colors.black,
                            // height: 40,
                            onPressed: () {
                              // _navigatorPage('discovereditorials', '');
                            },
                            child: Text(
                              'DISCOVER MORE',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Heading(context, 'MY SUBSCRIPTIONS'),
                    InkWell(
                      onTap: () {
                        // _navigatorPage('channel');
                      },
                      child: SubscriptionCarouselWithTextDots(
                        carouselImg: subscriptionCarouselImg,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : _bottomNavList.elementAt(_selectedIndex),
      bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
    );
  }
}

Widget styleFeatured(context, img, author, date, logo, likes, styleid) {
  void _navigatorPage(context, styleid) {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          return FeaturedStyleDetail(styleId: styleid, image: img, date: date);
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

  return InkWell(
    onTap: () {
      _navigatorPage(context, styleid);
    },
    child: Container(
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Stack(children: [
        Image.network(
          img,
        ),
        RoundedCardForStyle(context, 2.05, 2.05, author, date, logo, likes),
      ]),
    ),
  );
}
