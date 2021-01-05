import 'package:flutter/material.dart';
import 'package:splyxp/widgets/InnerAppBar.dart';
import 'package:splyxp/widgets/carousels.dart';
import 'package:splyxp/widgets/horizontalList.dart';
import 'package:splyxp/widgets/lineHeading.dart';

class Sneakers extends StatefulWidget {
  @override
  _SneakersState createState() => _SneakersState();
}

class _SneakersState extends State<Sneakers> {
  List img = [
    'assets/images/sneakers/list1.jpg',
    'assets/images/sneakers/list2.jpg',
    'assets/images/sneakers/list3.jpg',
    // 'assets/images/list4.jpg'
  ];
  List carouselImg = [
    'assets/images/sneakers/carousel1.jpg',
    'assets/images/sneakers/carousel1.jpg',
    'assets/images/sneakers/carousel1.jpg',
    // 'assets/images/item4.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: Appbar(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: Image.asset(
                  'assets/images/sneakers/sneakers1.jpg',
                ),
              ),
              Padding(
                padding: width < 400
                    ? EdgeInsets.only(top: 20.0, left: 50, right: 30)
                    : EdgeInsets.only(top: 20.0, left: 55, right: 32),
                child: Text(
                    'A curated sneaker selection of new and popular drops. Personalized style discovery and shopping as a service.',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400)),
              ),
              // Featured Style Heading
              Heading(context, 'New Arrivals'),
              SizedBox(height: 370, child: horizontalListWith2(context, img)),
              SizedBox(
                height: 20,
              ),
              CarouselWithDots(
                carouselImg: carouselImg,
              ),
            ],
          ),
        ));
  }
}
