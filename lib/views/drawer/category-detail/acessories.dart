import 'package:flutter/material.dart';
import 'package:splyxp/widgets/innerAppBar.dart';
import 'package:splyxp/views/drawer/men&women.dart';
import '../../../services/drawr-services.dart';

import 'package:splyxp/widgets/navbar.dart';

import '../../search/search.dart';
import '../../profile.dart';
import '../../sply-network.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import '../../auth/signup/signup.dart';
import 'package:splyxp/views/products/product-detail-withapi.dart';

class Accessories extends StatefulWidget {
  @override
  _AccessoriesState createState() => _AccessoriesState();
}

class _AccessoriesState extends State<Accessories> {
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
    Accessories(),
    Search(),
    ChatList(),
    SplyNetwork(),
    Signup()
  ];
  DrawrServices data = DrawrServices();
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
    return Scaffold(
      appBar: innerAppbar(context, 'Accessories'),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // GridView.builder(
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     padding: EdgeInsets.only(left: 5, right: 5, top: 0),
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //       childAspectRatio: width < 400
              //           ? MediaQuery.of(context).size.width /
              //               (MediaQuery.of(context).size.height / 1.49)
              //           : MediaQuery.of(context).size.width /
              //               (MediaQuery.of(context).size.height / 1.45),
              //     ),
              //     // scrollDirection: Axis.vertical,
              //     itemCount: 6,
              //     itemBuilder: (context, index) {
              //       return lists(context, 'woman', index);
              //     })
              FutureBuilder(
                  future: data.getDrawrProducts("88"),
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
                              onTap: () => _navigatorPage(context),
                              child: lists(
                                context,
                                'men',
                                item['images'][0]['src'],
                                index,
                                item['name'],
                                item['price'],
                                item['id'].toString(),
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

Widget lists(context, check, image, index, name, price, id) {
  return Column(
    children: [
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
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'RMNUEUSEMIBOLD'),
            maxLines: 2,
          ),
        ),
      ),
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(top: 5, left: 10),
          child: Text(
            'Price: \$ ' + price,
            style: TextStyle(
                fontSize: 15,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
                fontFamily: 'RMNUEUREGULAR'),
          ),
        ),
      ),
    ],
  );
}
