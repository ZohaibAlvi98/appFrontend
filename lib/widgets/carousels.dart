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
                height: size * 0.55,
                onPageChanged: (i, reason) {
                  changeCurrent(i);
                },
                // autoPlay: true,
                autoPlayCurve: Curves.easeInOut,
                enlargeCenterPage: false)),
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
                height: size * 0.57,
                onPageChanged: (i, reason) {
                  changeCurrent(i);
                },
                // autoPlay: true,
                autoPlayCurve: Curves.easeInOut,
                enlargeCenterPage: false)),
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
