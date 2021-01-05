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
                    borderRadius: BorderRadius.all(Radius.circular(43)),
                    image: DecorationImage(
                        image: AssetImage(i), fit: BoxFit.fitWidth)),
              );
            }).toList(),
            options: CarouselOptions(
                initialPage: 1,
                enableInfiniteScroll: false,
                height: size * 0.6,
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
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
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
