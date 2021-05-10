import 'package:flutter/material.dart';
import 'package:splyxp/widgets/innerAppBar.dart';
import 'package:splyxp/services/search/search_byBrands.dart';
import 'package:splyxp/views/search/brand_products.dart';

SearchByBrands brandSearch = SearchByBrands();

class ByBrand extends StatefulWidget {
  @override
  _ByBrandState createState() => _ByBrandState();
}

class _ByBrandState extends State<ByBrand> {
  getBrandsOf({item, letter}) {
    var letterList = <Map>[];
    for (var a = 0; a < item.length; a++) {
      if (item[a]['brand_name'].startsWith(letter)) {
        letterList.add(item[a]);
      }
    }
    return letterList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWithMenu(context),
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor:
                Colors.black, //This will change the drawer background to blue.
            //other styles
          ),
          child: drawerAppBar(context, '', false)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                'Brands',
                style: TextStyle(
                    fontFamily: 'RMNUEU',
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1),
              ),
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 26,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(right: 20.0, left: 7, top: 10),
                itemBuilder: (context, index) {
                  List aplhabets = [
                    'A',
                    'B',
                    'C',
                    'D',
                    'E',
                    'F',
                    'G',
                    'H',
                    'I',
                    'J',
                    'K',
                    'L',
                    'M',
                    'N',
                    'O',
                    'P',
                    'Q',
                    'R',
                    'S',
                    'T',
                    'U',
                    'V',
                    'W',
                    'X',
                    'Y',
                    'Z',
                  ];
                  double width = MediaQuery.of(context).size.width;
                  return list(context, aplhabets, index, width);
                }),
          ],
        ),
      ),
    );
  }

  Widget list(context, headings, index, width) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(3.0, 3, 3, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              headings[index],
              style: TextStyle(
                  fontSize: width < 400 ? 20 : 25, fontWeight: FontWeight.w500),
            ),
          ),
          FutureBuilder(
            future: brandSearch.getBrands(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasData) {
                final item = getBrandsOf(
                  item: snapshot.data,
                  letter: headings[index],
                );
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: item.length,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(right: 20.0, left: 7, top: 10),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          new PageRouteBuilder(
                            opaque: true,
                            transitionDuration: const Duration(),
                            pageBuilder: (BuildContext context, _, __) {
                              return BrandProducts(
                                brandId: item[index]['id'].toString(),
                                brandname: item[index]['brand_name'],
                              );
                            },
                            transitionsBuilder: (_, Animation<double> animation,
                                __, Widget child) {
                              return new SlideTransition(
                                child: child,
                                position: new Tween<Offset>(
                                  begin: const Offset(1.0, 0.0),
                                  end: Offset.zero,
                                ).animate(animation),
                              );
                            },
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Row(children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 5),
                              child: Stack(
                                children: [
                                  Text(
                                    item[index]['brand_name'],
                                    style: TextStyle(
                                        fontSize: width < 400 ? 15 : 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Padding(
                                    padding: width < 400
                                        ? EdgeInsets.only(left: 291, top: 3)
                                        : EdgeInsets.only(left: 343, top: 1.2),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                          Padding(
                            padding: EdgeInsets.only(top: 1),
                            child: new Divider(
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
          // Row(children: [
          //   Padding(
          //     padding: EdgeInsets.only(left: 15),
          //     child: Stack(
          //       children: [
          //         Text(
          //           headings[index],
          //           style: TextStyle(
          //               fontSize: width < 400 ? 15 : 17,
          //               fontWeight: FontWeight.w500),
          //         ),
          //         Padding(
          //           padding: width < 400
          //               ? EdgeInsets.only(left: 291, top: 3)
          //               : EdgeInsets.only(left: 343, top: 1.2),
          //           child: Icon(
          //             Icons.arrow_forward_ios,
          //             size: 16,
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ]),
          // Padding(
          //   padding: EdgeInsets.only(top: 6),
          //   child: new Divider(
          //     color: Colors.grey[500],
          //   ),
          // ),
        ],
      ),
    );
  }
}
// onTap: () {
//           Navigator.of(context).push(
//             new PageRouteBuilder(
//               opaque: true,
//               transitionDuration: const Duration(),
//               pageBuilder: (BuildContext context, _, __) {
//                 return;
//               },
//               transitionsBuilder:
//                   (_, Animation<double> animation, __, Widget child) {
//                 return new SlideTransition(
//                   child: child,
//                   position: new Tween<Offset>(
//                     begin: const Offset(1.0, 0.0),
//                     end: Offset.zero,
//                   ).animate(animation),
//                 );
//               },
//             ),
//           );
//         }
