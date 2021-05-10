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
import 'package:splyxp/widgets/lists.dart';

class Accessories extends StatefulWidget {
  final String gender;
  Accessories({Key key, @required this.gender}) : super(key: key);
  @override
  _AccessoriesState createState() => _AccessoriesState();
}

class _AccessoriesState extends State<Accessories> {
  String getBrand(prodList) {
    for (var a = 0; a < prodList['meta_data'].length; a++) {
      if (prodList['meta_data'][a]['key'] == '_select_brand') {
        return prodList['meta_data'][a]['value'];
      }
    }
  }

  DrawrServices data = DrawrServices();
  void _navigatorPage(context, id) {
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

  getMapList(item) {
    var listMap = <Map>[];
    if (widget.gender == 'Men') {
      for (var a = 0; a < item.data.length; a++) {
        for (var i = 0; i < item.data[a]['categories'].length; i++) {
          if (item.data[a]['categories'][i]['name'] == 'Men') {
            listMap.add(item.data[a]);
          }
        }
      }
      return listMap;
    }
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
              FutureBuilder(
                  future: data.getDrawrProducts("88"),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                    if (snapshot.hasData) {
                      final item = getMapList(snapshot);
                      return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(left: 1, right: 1, top: 20),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 1.1),
                          ),
                          itemCount: item.length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = getMapList(snapshot)[index];
                            final brand = getBrand(item);

                            // if (widget.gender == 'Men') {
                            //   for (var a = 0;
                            //       a < item['categories'].length;
                            //       a++) {
                            //     if (item['categories'][a]['name'] == 'Men') {
                            //       return InkWell(
                            //         onTap: () => _navigatorPage(
                            //             context, item['id'].toString()),
                            //         child: Lists(
                            //           context,
                            //           'men',
                            //           item['images'][0]['src'],
                            //           index,
                            //           item['name'],
                            //           item['price'],
                            //           item['id'].toString(),
                            //           brand,
                            //         ),
                            //       );
                            //     }
                            //     return null;
                            //   }
                            // }
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
            ],
          ),
        ),
      ),
    );
  }
}
