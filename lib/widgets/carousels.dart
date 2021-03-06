import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../services/editorials/editoirals.dart';
import 'package:splyxp/views/rss-detail/rss-detail.dart';

Editorials data = new Editorials();

class CarouselWithDots extends StatefulWidget {
  final List carouselImg;

  CarouselWithDots({Key key, @required this.carouselImg}) : super(key: key);
  @override
  _CarouselWithDotsState createState() => _CarouselWithDotsState();
}

class _CarouselWithDotsState extends State<CarouselWithDots> {
  int _current = 0;
  void changeCurrent(index) {
    setState(() {
      _current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double size = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;

    List<T> map<T>(List list, Function handler) {
      List<T> result = [];
      for (var i = 0; i < list.length; i++) {
        result.add(handler(i, list[i]));
      }
      return result;
    }

    return Column(
      children: [
        CarouselSlider(
            items: widget.carouselImg.map((i) {
              return Container(
                child: Image.network(
                  i,
                  fit: BoxFit.contain,
                  // height: double.infinity,
                  // width: double.infinity,
                ),
              );
            }).toList(),
            options: CarouselOptions(
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: false,
                height: 500,
                onPageChanged: (i, reason) {
                  changeCurrent(i);
                },
                // autoPlay: true,
                autoPlayCurve: Curves.easeInOut,
                enlargeCenterPage: false)),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(widget.carouselImg, (index, url) {
            return Container(
              width: 10.0,
              height: 7.0,
              margin: width < 400
                  ? EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0)
                  : EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index ? Colors.black : Colors.grey,
              ),
            );
          }),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

//copy this class
class CarouselWithTextDots extends StatefulWidget {
  final List carouselImg;

  CarouselWithTextDots({Key key, @required this.carouselImg}) : super(key: key);
  @override
  _CarouselWithTextDotsState createState() => _CarouselWithTextDotsState();
}

class _CarouselWithTextDotsState extends State<CarouselWithTextDots> {
  int _current = 1;
  void changeCurrent(index) {
    setState(() {
      _current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double size = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;

    List<T> map<T>(List list, Function handler) {
      List<T> result = [];
      for (var i = 0; i < list.length; i++) {
        result.add(handler(i, list[i]));
      }
      return result;
    }

    return Column(
      children: [
        CarouselSlider(
            items: widget.carouselImg.map((i) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          image: DecorationImage(
                              image: AssetImage(i), fit: BoxFit.fitWidth)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: width / 1.35, left: 20),
                      child: Stack(
                        children: [
                          Text(
                            'S-PLY STORE',
                            style: TextStyle(
                                fontSize: width < 400 ? 20 : 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 26),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_pin,
                                        color: Colors.white,
                                        size: 12,
                                      ),
                                      Text(
                                        ' S-PLY Store, London, United Kingdom(Uk)',
                                        style: TextStyle(
                                            fontSize: width < 400 ? 8 : 11,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
            options: CarouselOptions(
                initialPage: 1,
                enableInfiniteScroll: false,
                height: width < 400 ? size * 0.57 : size * 0.59,
                onPageChanged: (i, reason) {
                  changeCurrent(i);
                },
                // autoPlay: true,
                autoPlayCurve: Curves.easeInOut,
                enlargeCenterPage: false)),
// work for text
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(widget.carouselImg, (index, url) {
            return Container(
              width: 10.0,
              height: 7.0,
              margin: width < 400
                  ? EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0)
                  : EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index ? Colors.black : Colors.grey,
              ),
            );
          }),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

//Subscription section

class SubscriptionCarouselWithTextDots extends StatefulWidget {
  final List carouselImg;

  SubscriptionCarouselWithTextDots({Key key, @required this.carouselImg})
      : super(key: key);
  @override
  _SubscriptionCarouselWithTextDotsState createState() =>
      _SubscriptionCarouselWithTextDotsState();
}

class _SubscriptionCarouselWithTextDotsState
    extends State<SubscriptionCarouselWithTextDots> {
  int _current = 1;
  void changeCurrent(index) {
    setState(() {
      _current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double size = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;

    List<T> map<T>(List list, Function handler) {
      List<T> result = [];
      for (var i = 0; i < list.length; i++) {
        result.add(handler(i, list[i]));
      }
      return result;
    }

    return Column(
      children: [
        CarouselSlider(
            items: widget.carouselImg.map((i) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          image: DecorationImage(
                              image: AssetImage(i), fit: BoxFit.fitWidth)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: width < 400 ? width / 1.07 : width / 0.99,
                          left: 0),
                      child: Stack(
                        children: [
                          Text(
                            'S-PLY STORE',
                            style: TextStyle(
                                fontSize: width < 400 ? 20 : 24,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 28),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_pin,
                                        color: Colors.black,
                                        size: 12,
                                      ),
                                      Text(
                                        ' S-PLY Store, London, United Kingdom(UK)',
                                        style: TextStyle(
                                            fontSize: width < 400 ? 8 : 11,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.email,
                                        color: Colors.black,
                                        size: 12,
                                      ),
                                      Text(
                                        ' s-plytv@s-plystyle.net',
                                        style: TextStyle(
                                            fontSize: width < 400 ? 8 : 11,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            options: CarouselOptions(
                initialPage: 1,
                enableInfiniteScroll: false,
                height: width < 400 ? size * 0.56 : size * 0.71,
                onPageChanged: (i, reason) {
                  changeCurrent(i);
                },
                // autoPlay: true,
                autoPlayCurve: Curves.easeInOut,
                enlargeCenterPage: false)),
        width < 400 ? SizedBox(height: 50) : SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(widget.carouselImg, (index, url) {
            return Container(
              width: 10.0,
              height: 7.0,
              margin: width < 400
                  ? EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0)
                  : EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index ? Colors.black : Colors.grey,
              ),
            );
          }),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

// Editorial Cards Section
class RectangularSlider extends StatefulWidget {
  @override
  _RectangularSliderState createState() => _RectangularSliderState();
}

class _RectangularSliderState extends State<RectangularSlider> {
  void _navigatorPage(index, postid) {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          return RssDetail(
            postId: postid,
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
    return FutureBuilder(
        future: data.getEditorials(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  final item = snapshot.data[index];
                  return Container(
                    padding:
                        EdgeInsets.only(right: 0, left: 5, top: 0, bottom: 45),
                    width: 315.0,
                    child: InkWell(
                        onTap: () {
                          _navigatorPage(context, item['post_id'].toString());
                        },
                        child: Card(
                          child: Wrap(
                            children: <Widget>[
                              Image.network(item['image']),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 5, left: 10, right: 10),
                                width: width * 0.13,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https:" + item['author_logo']),
                                  ),
                                  border: Border.all(color: Colors.grey),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 20, left: 0.6),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: width < 400
                                            ? EdgeInsets.only(right: 51.5)
                                            : EdgeInsets.only(right: 60.0),
                                        child: Text(
                                          item['author'],
                                          style: TextStyle(
                                              fontSize: width < 400 ? 18 : 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 0),
                                        child: Text(
                                          item['date'],
                                          style: TextStyle(
                                              fontSize: width < 400 ? 11 : 14),
                                        ),
                                      )
                                    ],
                                  )),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 2),
                                child: Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 13.0, right: 13, top: 0),
                                          child: Text(
                                            item['title'],
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: width < 400 ? 20 : 13,
                                                fontFamily: 'RMNUEU',
                                                color: Colors.black),
                                          ),
                                        )),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 7.0,
                                            left: 13,
                                            bottom: 10,
                                            right: 13),
                                        child: Text(
                                          item['short_text'],
                                          maxLines: 3,
                                          style: TextStyle(
                                              height: 1.5,
                                              fontFamily: 'RMNUEUREGULAR'),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  );
                });
          }
        });
  }
}

class CarouselWithBox extends StatefulWidget {
  final List carouselImg;

  CarouselWithBox({Key key, @required this.carouselImg}) : super(key: key);
  @override
  _CarouselWithBoxState createState() => _CarouselWithBoxState();
}

class _CarouselWithBoxState extends State<CarouselWithBox> {
  int _current = 1;
  void changeCurrent(index) {
    setState(() {
      _current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double size = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;

    List<T> map<T>(List list, Function handler) {
      List<T> result = [];
      for (var i = 0; i < list.length; i++) {
        result.add(handler(i, list[i]));
      }

      return result;
    }

    return Column(
      children: [
        CarouselSlider(
            items: widget.carouselImg.map((i) {
              return Container(
                child: GestureDetector(
                  child: Image.network(i, fit: BoxFit.fitWidth),
                  onTap: () {},
                ),
                margin: EdgeInsets.symmetric(horizontal: 8),
                // decoration: BoxDecoration(
                //     // borderRadius: BorderRadius.all(Radius.circular(35)),
                //     image: DecorationImage(
                //         image: NetworkImage(i), fit: BoxFit.fitWidth)),
              );
            }).toList(),
            options: CarouselOptions(
                initialPage: 1,
                enableInfiniteScroll: false,
                height: width < 400 ? size * 0.43 : size * 0.55,
                onPageChanged: (i, reason) {
                  changeCurrent(i);
                },
                // autoPlay: true,
                autoPlayCurve: Curves.easeInOut,
                enlargeCenterPage: false)),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(widget.carouselImg, (index, url) {
            return Container(
              width: 10.0,
              height: 7.0,
              margin: width < 400
                  ? EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0)
                  : EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index ? Colors.black : Colors.grey,
              ),
            );
          }),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
