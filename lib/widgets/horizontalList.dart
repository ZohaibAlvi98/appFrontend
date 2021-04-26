import 'package:flutter/material.dart';
import 'package:splyxp/views/products/product-detail.dart';
import '../services/drawr-services-sneaker.dart';
import '../services/sneakers/sneakers-top-trending.dart';
import '../services/tv/tv-fearured-products.dart';
import '../services/splyrs/splyrs-products.dart';

TrendingSneakers data = TrendingSneakers();
DrawrServices collect = DrawrServices();
FeaturedProducts dataentry = FeaturedProducts();
SplyrsProducts splyrdata = SplyrsProducts();
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

Widget horizontalListWith3(context, img, color) {
  double width = MediaQuery.of(context).size.width;
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    // physics: NeverScrollableScrollPhysics(),
    // shrinkWrap: true,
    itemCount: img.length,
    padding: EdgeInsets.only(right: 20.0, left: 12),
    itemBuilder: (context, index) {
      return Container(
        color: color,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 4),
              child: InkWell(
                onTap: () => _navigatorPage(context),
                child: Card(
                  child: Wrap(children: [
                    Image.asset(
                      img[index],
                      height: 175,
                      // width: imgwidth,
                    ),
                  ]),
                ),
              ),
            ),
            Padding(
              // padding: width < 400
              //     ? EdgeInsets.only(right: 7.0)
              //     : EdgeInsets.only(right: 19.0),
              padding: EdgeInsets.only(top: 3, right: 6, left: 6),
              child: Text(
                'Thome Brown 4 Bar \nJackets',
                style: TextStyle(
                    fontFamily: 'RMNUEUSEMIBOLD',
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              // padding: width < 400
              //     ? EdgeInsets.only(top: 7.0, bottom: 5)
              //     : EdgeInsets.only(top: 7.0, bottom: 5, right: width / 17),
              padding: EdgeInsets.only(top: 3, right: 6, left: 6),
              child: Text(
                'Brand: Thome Brown',
                style: TextStyle(
                    fontFamily: 'RMNUEUREGULAR',
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3, right: 6, left: 6),
              child: Text(
                '\$ 759.00',
                style: TextStyle(
                    fontFamily: 'RMNUEUREGULAR', color: Colors.grey.shade800),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget horizontalListWith2(context, img) {
  double width = MediaQuery.of(context).size.width;
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    // physics: NeverScrollableScrollPhysics(),
    // shrinkWrap: true,
    itemCount: img.length,
    padding: EdgeInsets.only(right: 15.0, left: 18),
    itemBuilder: (context, index) {
      return Column(
        children: [
          Container(
            padding: width < 400
                ? EdgeInsets.only(right: 5)
                : EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () => _navigatorPage(context),
              child: Card(
                child: Wrap(children: [
                  Image.asset(
                    img[index],
                    height: 260,
                    // width: imgwidth,
                  ),
                ]),
              ),
            ),
            color: Colors.white12,
          ),
          Padding(
            padding: width < 400
                ? EdgeInsets.only(top: 10, right: width / 5.1)
                : EdgeInsets.only(top: 10, right: width / 4.5),
            child: Text(
              'AIR JORDAN 1 MID\n\"SISTERHOOD\"',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: width < 400
                ? EdgeInsets.only(right: 160, top: 10)
                : EdgeInsets.only(right: 170, top: 10),
            child: Text(
              '\$ 400.00',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey[500]),
            ),
          ),
        ],
      );
    },
  );
}

Widget sneakerListWith3(context, img, color) {
  double width = MediaQuery.of(context).size.width;

  return ListView.builder(
    scrollDirection: Axis.horizontal,
    // physics: NeverScrollableScrollPhysics(),
    // shrinkWrap: true,
    itemCount: img.length,
    padding: EdgeInsets.only(right: 20.0, left: 12),
    itemBuilder: (context, index) {
      return Container(
        color: color,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 4),
              child: InkWell(
                onTap: () => _navigatorPage(context),
                child: Card(
                  child: Wrap(children: [
                    Image.asset(
                      img[index],
                      height: 175,
                      // width: imgwidth,
                    ),
                  ]),
                ),
              ),
              color: color,
            ),
            Padding(
              // padding: width < 400
              //     ? EdgeInsets.only(right: 15.0)
              //     : EdgeInsets.only(right: 32.0),
              padding: EdgeInsets.only(right: 28),
              child: Text(
                'AIR JORDAN 1 MID\n\"SISTERHOOD\"',
                style: TextStyle(
                    fontFamily: 'RMNUEUSEMIBOLD',
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, right: 87),
              child: Text(
                '\$ 400.00',
                style: TextStyle(fontFamily: 'RMNUEUREGULAR'),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget sneakerListWith4(context) {
  double width = MediaQuery.of(context).size.width;
  return FutureBuilder(
      future: collect.getDrawrProducts("15"),
      builder: (BuildContext context,
          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            // physics: NeverScrollableScrollPhysics(),
            // shrinkWrap: true,

            padding: EdgeInsets.only(right: 20.0, left: 12),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              final item = snapshot.data[index];
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 2, left: 1),
                      child: InkWell(
                        onTap: () => _navigatorPage(context),
                        child: Card(
                          child: Wrap(children: [
                            SizedBox(
                              height: 190,
                              width: 200,
                              child: Image.network(
                                item['images'][0]['src'],
                                fit: BoxFit.cover,
                                // width: imgwidth,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    Padding(
                      // padding: width < 400
                      //     ? EdgeInsets.only(right: 15.0)
                      //     : EdgeInsets.only(right: 32.0),
                      padding: EdgeInsets.only(left: 9, top: 4),
                      // work here
                      child: SizedBox(
                        width: 200,
                        child: Text(
                          item['name'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'RMNUEUSEMIBOLD',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 9, top: 4),
                      child: Text(
                        'Price: \$' + item['price'],
                        style: TextStyle(
                            fontFamily: 'RMNUEUREGULAR',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
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

Widget sneakerListTopTrending(context) {
  double width = MediaQuery.of(context).size.width;
  return FutureBuilder(
      future: data.getTrendingSneakers(),
      builder: (BuildContext context,
          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            // physics: NeverScrollableScrollPhysics(),
            // shrinkWrap: true,

            padding: EdgeInsets.only(right: 20.0, left: 12),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              final item = snapshot.data[index];
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 2, left: 1),
                      child: InkWell(
                        onTap: () => _navigatorPage(context),
                        child: Card(
                          child: Wrap(children: [
                            SizedBox(
                              height: 190,
                              width: 200,
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
                      // padding: width < 400
                      //     ? EdgeInsets.only(right: 15.0)
                      //     : EdgeInsets.only(right: 32.0),
                      padding: EdgeInsets.only(left: 9, top: 4),
                      child: Container(
                        child: SizedBox(
                          width: 200,
                          child: Text(
                            item['product_title'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontFamily: 'RMNUEUSEMIBOLD',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 9, top: 4),
                      child: Text(
                        'Price: \$' + item['price'],
                        style: TextStyle(
                            fontFamily: 'RMNUEUREGULAR',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
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

Widget featuredProductsTv(context) {
  double width = MediaQuery.of(context).size.width;
  return FutureBuilder(
      future: dataentry.getFeaturedTvProducts("154"),
      builder: (BuildContext context,
          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            // physics: NeverScrollableScrollPhysics(),
            // shrinkWrap: true,

            padding: EdgeInsets.only(right: 20.0, left: 12),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              final item = snapshot.data[index];
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 2, left: 1),
                      child: InkWell(
                        onTap: () => _navigatorPage(context),
                        child: Card(
                          child: Wrap(children: [
                            SizedBox(
                              height: 190,
                              width: 175,
                              child: Image.network(
                                item['images'][0]['src'],
                                fit: BoxFit.cover,
                                // width: imgwidth,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    Padding(
                      // padding: width < 400
                      //     ? EdgeInsets.only(right: 15.0)
                      //     : EdgeInsets.only(right: 32.0),
                      padding: EdgeInsets.only(left: 9, top: 4),
                      // work here
                      child: SizedBox(
                        width: 175,
                        child: Text(
                          item['name'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'RMNUEUSEMIBOLD',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 9, top: 4),
                      child: Text(
                        'Price: \$' + item['price'],
                        style: TextStyle(
                            fontFamily: 'RMNUEUREGULAR',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
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

Widget horizontalListFeaturedSplyrs(context, splyrid) {
  double width = MediaQuery.of(context).size.width;
  return FutureBuilder(
      future: splyrdata.getSplyrsProducts(splyrid),
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
                        onTap: () => _navigatorPage(context),
                        child: Card(
                          child: Wrap(children: [
                            SizedBox(
                              height: 190,
                              width: 175,
                              child: Image.network(
                                item['images'][0]['src'],
                                fit: BoxFit.cover,
                                // width: imgwidth,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 6, left: 6, right: 6),
                      child: SizedBox(
                        width: 175,
                        child: Text(
                          item['name'],
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
