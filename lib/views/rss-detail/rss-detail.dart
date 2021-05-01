import 'package:flutter/material.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import 'package:splyxp/views/profile.dart';
import 'package:splyxp/views/search/search.dart';
import 'package:splyxp/views/sply-network.dart';
import 'package:splyxp/widgets/horizontalList.dart';
import 'package:splyxp/widgets/innerAppBar.dart';
import 'package:splyxp/widgets/navbar.dart';
import '../home.dart';
import '../../services/editorials/editorials-detail.dart';
import 'package:html/parser.dart';
import '../../services/editorials/editorial-product-listing.dart';
import 'package:splyxp/views/products/product-detail-withapi.dart';

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

EditorialProducts eprod = EditorialProducts();
EditorialsDetail editorialdata = EditorialsDetail();

class RssDetail extends StatefulWidget {
  final String postId;
  RssDetail({Key key, @required this.postId}) : super(key: key);
  @override
  _RssDetailState createState() => _RssDetailState();
}

class _RssDetailState extends State<RssDetail> {
  int index = 3;
  int _selectedIndex = 3;
  int counter = 0;
  void _onItemTapped(int index) {
    if (_selectedIndex == 3 && index == 3) {
      Navigator.of(context).pop();
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _bottomNavList = [
    Home(),
    Search(),
    ChatList(),
    RssDetail(
      postId: null,
    ),
    Profile()
  ];

  List img = [
    'assets/images/rssDetail/list1.jpg',
    'assets/images/rssDetail/list2.jpg',
    'assets/images/rssDetail/list3.jpg',
    // 'assets/images/styles/list4.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 3) return true;
        setState(() {
          _selectedIndex = 3;
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
            child: drawerAppBar(context, '', false)),
        body: _selectedIndex == 3
            ? SingleChildScrollView(
                child: Container(
                    child: FutureBuilder(
                        future:
                            editorialdata.getEditorialsDetail(widget.postId),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Map<String, dynamic>>>
                                snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            final item = snapshot.data;
                            print(snapshot);
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(
                                        left: 13.5, right: 13.5, top: 10),
                                    child: Text(
                                      item[0]['title'],
                                      style: TextStyle(
                                          fontSize: width < 400 ? 25 : 25,
                                          fontFamily: 'RMNUEU',
                                          color: Colors.black),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 1.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 5, left: 10, right: 10),
                                        width: width * 0.10,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: NetworkImage("https:" +
                                                item[0]['author_logo']),
                                          ),
                                          border:
                                              Border.all(color: Colors.grey),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 5.0, left: .7),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: width < 400
                                                    ? EdgeInsets.only(
                                                        right: 51.5)
                                                    : EdgeInsets.only(
                                                        right: 63.0),
                                                child: Text(
                                                  item[0]['author'],
                                                  style: TextStyle(
                                                      fontSize:
                                                          width < 400 ? 18 : 20,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 0.0),
                                                child: Text(
                                                  item[0]['date'],
                                                  style: TextStyle(
                                                      fontSize: width < 400
                                                          ? 11
                                                          : 14),
                                                ),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 14, left: 14, top: 0),
                                  child: Image.network(
                                    item[0]['image'],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 14, left: 14, top: 13),
                                  child: Text(
                                    item[0]['short_text'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        height: 1.5),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 14, left: 14, top: 15),
                                  child: Text(
                                    parse(item[0]['content'])
                                        .documentElement
                                        .text,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        height: 1.5),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Center(
                                    child: Container(
                                      height: 40,
                                      width: 180,
                                      child: FlatButton(
                                        color: Colors.black,
                                        // height: 40,
                                        onPressed: () {},
                                        child: Text(
                                          'SHOP NOW',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                SizedBox(
                                    height: 270,
                                    child: horizontalListEditorialsProducts(
                                        context,
                                        item[0]['post_id'].toString())),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            );
                          }
                        })),
              )
            : _bottomNavList.elementAt(_selectedIndex),
        bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
      ),
    );
  }
}

Widget horizontalListEditorialsProducts(context, postid) {
  double width = MediaQuery.of(context).size.width;
  return FutureBuilder(
      future: eprod.getEditorialProducts(postid),
      builder: (BuildContext context,
          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(right: 20.0, left: 12),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              final item = snapshot.data[index];
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 2, left: 1),
                      child: InkWell(
                        onTap: () => _navigatorPage(
                            context, item['product_id'].toString()),
                        child: Card(
                          child: Wrap(children: [
                            SizedBox(
                              height: 190,
                              width: 175,
                              child: Image.network(
                                item['image'],
                                fit: BoxFit.cover,
                                // width: imgwidth,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: SizedBox(
                        width: 175,
                        child: Text(
                          item['product_title'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'RMNUEUSEMIBOLD',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        '\$' + item['price'],
                        style: TextStyle(
                          fontFamily: 'RMNUEUREGULAR',
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      });
}
