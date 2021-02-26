import 'package:flutter/material.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import 'package:splyxp/views/profile.dart';
import 'package:splyxp/views/search/search.dart';
import 'package:splyxp/views/sply-network.dart';
import 'package:splyxp/widgets/horizontalList.dart';
import 'package:splyxp/widgets/innerAppBar.dart';
import 'package:splyxp/widgets/navbar.dart';

class RssDetail extends StatefulWidget {
  @override
  _RssDetailState createState() => _RssDetailState();
}

class _RssDetailState extends State<RssDetail> {
  int index = 0;
  int _selectedIndex = 0;
  int counter = 0;
  void _onItemTapped(int index) {
    if (_selectedIndex == 0 && index == 0) {
      Navigator.of(context).pop();
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _bottomNavList = [
    RssDetail(),
    Search(),
    ChatList(),
    SplyNetwork(),
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
        if (_selectedIndex == 0) return true;
        setState(() {
          _selectedIndex = 0;
        });
        return false;
      },
      child: Scaffold(
        appBar: Appbar(context),
        body: _selectedIndex == 0
            ? SingleChildScrollView(
                child: Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding:
                            EdgeInsets.only(left: 13.5, right: 13.5, top: 10),
                        child: Text(
                          '1017 Alyx 9sm x Stussy - Available Now',
                          style: TextStyle(
                              fontSize: width < 400 ? 25 : 29,
                              fontWeight: FontWeight.w900,
                              color: Colors.black),
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 1.0),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 13, horizontal: 10),
                            width: width * 0.13,
                            height: 50,
                            decoration: new BoxDecoration(
                              border: new Border.all(
                                color: Colors.grey[400],
                                width: 1.0,
                              ),
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: width < 400
                                  ? EdgeInsets.only(left: 6.5, top: 13)
                                  : EdgeInsets.only(left: 8.0, top: 13),
                              child: Text(
                                'End',
                                style: TextStyle(
                                    fontSize: width < 400 ? 16 : 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 5.0, left: .7),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: width < 400
                                        ? EdgeInsets.only(right: 51.5)
                                        : EdgeInsets.only(right: 63.0),
                                    child: Text(
                                      'END.',
                                      style: TextStyle(
                                          fontSize: width < 400 ? 18 : 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 0.0),
                                    child: Text(
                                      'January 22, 2021',
                                      style: TextStyle(
                                          fontSize: width < 400 ? 11 : 14),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 14, left: 14, top: 0),
                      child: Image.asset(
                        'assets/images/rss/rss1.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 14, left: 14, top: 13),
                      child: Text(
                        'Fusing Californian spirit with contemporary utilitarianism, Stüssy and 1017 ALYX 9SM present their latest capsule for SS20.',
                        style: TextStyle(
                            color: Colors.black, fontSize: 18, height: 1.3),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 14, left: 14, top: 13),
                      child: Image.asset(
                        'assets/images/rssDetail/rssDetail2.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 14, left: 14, top: 15),
                      child: Text(
                        'Two unique pillars of contemporary American menswear, 1017 ALYX 9SM and Stüssy, fuse their individual outlooks with their latest capsule collection. A workwear inspired selection from the Californian streetwear stalwarts and the luxury utilitarian outfit, classic design is coupled with exceptional fabric selections and a keen eye for detail to deliver an embodiment of both labels and their progressive attitudes to design.\n\nFeaturing a denim jacket and carpenter pant combination cut from premium cotton courtesy of Italy’s Loro Piana, this collaboration elevates classic style with a touch of subtle elegance and nods to the hard-wearing attributes of traditional workwear. Complete with two jersey long sleeve t-shirts, the duo pays homage to the late, great Bob Marley and his seminal piece, “No Woman, No Cry”. Emblazoned with the lyrics, “in this great future you can’t forget your past…”, the two brands celebrate reggae music and the importance of reflecting on the historical significance of cultural movements.',
                        style: TextStyle(
                            fontSize: 18, color: Colors.black, height: 1.3),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
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
                        child:
                            horizontalListWith3(context, img, Colors.white12)),
                    SizedBox(
                      height: 20,
                    )
                  ],
                )),
              )
            : _bottomNavList.elementAt(_selectedIndex),
        bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
      ),
    );
  }
}
