import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWithDots extends StatefulWidget {
  final List carouselImg;

  CarouselWithDots({Key key, @required this.carouselImg}) : super(key: key);
  @override
  _CarouselWithDotsState createState() => _CarouselWithDotsState();
}

class _CarouselWithDotsState extends State<CarouselWithDots> {
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
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.all(Radius.circular(35)),
                    image: DecorationImage(
                        image: AssetImage(i), fit: BoxFit.fitWidth)),
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
                      padding: EdgeInsets.only(top: 270, left: 20),
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
                                  // Padding(
                                  //   padding: width < 400
                                  //       ? EdgeInsets.only(
                                  //           top: 6, left: 7, right: 5)
                                  //       : EdgeInsets.only(
                                  //           top: 10, left: 7, right: 5),
                                  //   child: Text(
                                  //     'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document.',
                                  //     style: TextStyle(
                                  //         fontSize:
                                  //             width < 400 ? 9 : 13,
                                  //         color: Colors.grey[600],
                                  //         fontWeight: FontWeight.w800,
                                  //         height: 1.15),
                                  //   ),
                                  // )
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
                      padding: EdgeInsets.only(top: width / 1.08, left: 0),
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
                              padding: EdgeInsets.only(top: 32),
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
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Container EditorialImages(String imageVal) {
      return Container(
        padding: EdgeInsets.only(right: 8, left: 9, top: 0),
        width: 420.0,
        child: Card(
          child: Wrap(
            children: <Widget>[
              Image.asset(imageVal),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: width * 0.13,
                height: 60,
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
                      ? EdgeInsets.only(left: 6.5, top: 18)
                      : EdgeInsets.only(left: 10.0, top: 18),
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
                  padding: EdgeInsets.only(top: 20, left: 0.6),
                  child: Column(
                    children: [
                      Padding(
                        padding: width < 400
                            ? EdgeInsets.only(right: 51.5)
                            : EdgeInsets.only(right: 60.0),
                        child: Text(
                          'END.',
                          style: TextStyle(
                              fontSize: width < 400 ? 18 : 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Text(
                          'January 22, 2021',
                          style: TextStyle(fontSize: width < 400 ? 11 : 14),
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
                          padding: EdgeInsets.only(left: 13.0),
                          child: Text(
                            '1017 Alyx 9sm x Stussy - Available Now',
                            style: TextStyle(
                                fontSize: width < 400 ? 22 : 25,
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          ),
                        )),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 7.0, left: 13, bottom: 10, right: 10),
                        child: Text(
                          'Lorem ipsum is a placeholder text commonly used to demonstrate the visual document...',
                          style: TextStyle(height: 1.3),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          EditorialImages('assets/images/rss/rss2.jpg'),
          EditorialImages('assets/images/rss/rss1.jpg'),
          EditorialImages('assets/images/rss/rss3.jpg'),
        ],
      ),
    );
  }
}
