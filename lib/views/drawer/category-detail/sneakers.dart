import 'package:flutter/material.dart';
import 'package:splyxp/widgets/innerAppBar.dart';
import 'package:splyxp/views/drawer/men&women.dart';
import '../../../services/drawr-services-sneakers-all.dart';

import 'package:splyxp/widgets/navbar.dart';

import '../../search/search.dart';
import '../../profile.dart';
import '../../sply-network.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import '../../auth/signup/signup.dart';
import 'package:splyxp/views/products/product-sneaker-detail.dart';
import 'package:splyxp/widgets/lists.dart';

class Sneakers extends StatefulWidget {
  @override
  _SneakersState createState() => _SneakersState();
}

class _SneakersState extends State<Sneakers> {
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

  static List<Widget> _bottomNavList = [
    Sneakers(),
    Search(),
    ChatList(),
    SplyNetwork(),
    Signup()
  ];
  DrawrServices data = DrawrServices();
  void _navigatorPage(context, id) {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          return ProductDetailSneaker(
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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: innerAppbar(context, 'Sneakers'),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              FutureBuilder(
                  future: data.getDrawrProducts("15"),
                  // artistService.getArtist(page),

                  builder: (BuildContext context,
                      AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                    if (snapshot.hasData) {
                      // List<ArtistModel> artist = snapshot.data;
                      return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(left: 1, right: 1, top: 20),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 1.22),
                          ),
                          // scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = snapshot.data[index];

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
                                'brand',
                              ),
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
        ),
      ),
    );
  }
}
