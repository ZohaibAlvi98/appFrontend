import 'package:flutter/material.dart';
import '../../services/drawr-services.dart';
import 'package:splyxp/widgets/innerAppBar.dart';
import 'package:splyxp/widgets/navbar.dart';
import '../../views/search/search.dart';
import '../../views/profile.dart';
import '../../views/sply-network.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import '../auth/signup/signup.dart';
import 'package:splyxp/views/products/product-detail-withapi.dart';
import '../../services/sneakers/mens-sneakers.dart';

class SneakersMens extends StatefulWidget {
  final bool authenticated;
  SneakersMens({Key key, this.authenticated}) : super(key: key);
  @override
  _SneakersMensState createState() => _SneakersMensState();
}

class _SneakersMensState extends State<SneakersMens> {
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
    SneakersMens(),
    Search(),
    ChatList(),
    SplyNetwork(),
    Signup()
  ];

  // static List<Widget> _bottomNavDashboardList = [
  //   Arrivals(),
  //   Search(),
  //   ChatList(),
  //   SplyNetwork(),
  //   Profile()
  // ];
  MensWomensSneakers data = MensWomensSneakers();
  List img = [
    'assets/images/splyrs/channels/prod1.jpg',
    'assets/images/splyrs/channels/prod2.jpg',
    'assets/images/splyrs/channels/prod3.jpg',
    'assets/images/splyrs/channels/prod4.jpg',
    'assets/images/splyrs/channels/prod5.jpg',
    'assets/images/splyrs/channels/prod6.jpg'
  ];
  void _navigatorPage(context) {
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // return WillPopScope(
    //   onWillPop: () async {
    //     // if (_selectedIndex == 0) return true;
    //     // setState(() {
    //     //   _selectedIndex = 0;
    //     // });
    //     // return false;
    //   },
    // );
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
            child: drawerAppBar(context, 'new', widget.authenticated)),
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
                              'assets/images/sneakers/sneakers-mens-cover.jpg',
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 20, top: width / 4.6),
                              // child: Text(
                              //   'NEW ARRIVALS',
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
                                    fontFamily: 'RMNUEUREGULAR',
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                              color: Colors.white,
                              minWidth: 140,
                              height: 45,
                            ),
                          ),
                        ],
                      ),
                      FutureBuilder(
                          future: data.getMensWomensSneakers("138"),
                          // artistService.getArtist(page),

                          builder: (BuildContext context,
                              AsyncSnapshot<List<Map<String, dynamic>>>
                                  snapshot) {
                            if (snapshot.hasData) {
                              // List<ArtistModel> artist = snapshot.data;
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
                                            1.22),
                                  ),
                                  // scrollDirection: Axis.vertical,
                                  itemCount: snapshot.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final item = snapshot.data[index];

                                    return InkWell(
                                      onTap: () => _navigatorPage(context),
                                      child: lists(
                                        context,
                                        'men',
                                        item['images'][0]['src'],
                                        index,
                                        item['name'],
                                        item['price'],
                                        item['id'].toString(),
                                        // item['meta_data'
                                        //         .contains("_select_brand")]
                                        //     ['value'],
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
            : _bottomNavList.elementAt(_selectedIndex),
        bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
      ),
    );
  }
}

Widget lists(context, check, image, index, name, price, id) {
  return Column(
    children: [
      // Align(
      //   alignment: Alignment.topLeft,
      //   child: Padding(
      //     padding: EdgeInsets.only(top: 5, left: 10),
      //     child: Text(
      //       metadata,
      //       style: TextStyle(
      //           fontSize: 15.5,
      //           color: Colors.grey[600],
      //           fontWeight: FontWeight.bold),
      //     ),
      //   ),
      // ),
      Padding(
          padding: index != 0 && index != 1
              ? EdgeInsets.only(left: 7.0, right: 7, top: 8)
              : EdgeInsets.only(left: 7.0, right: 7, top: 4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          )),
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(top: 5, left: 10, right: 10),
          child: Text(
            name,
            style: TextStyle(
                fontFamily: 'RMNUEUSEMIBOLD',
                fontSize: 16,
                fontWeight: FontWeight.bold),
            maxLines: 2,
          ),
        ),
      ),
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(top: 5, left: 10),
          child: Text(
            'Price: \$' + price,
            style: TextStyle(
                fontFamily: 'RMNUEUREGULAR',
                fontSize: 15,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ],
  );
}