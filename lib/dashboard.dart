import 'package:flutter/material.dart';
import 'package:splyxp/widgets/innerAppBar.dart';
import 'package:splyxp/widgets/lineHeading.dart';
import 'package:splyxp/widgets/carousels.dart';
import './views/vendor-channel/stylist-channel.dart';
import 'package:splyxp/widgets/horizontalList.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Add images
  List carouselImg = [
    'assets/images/splyrs/carousel1.jpg',
    'assets/images/splyrs/carousel1.jpg',
    'assets/images/splyrs/carousel1.jpg',
    // 'assets/images/item4.jpg'
  ];
  List img = [
    'assets/images/styles/list1.png',
    'assets/images/styles/list2.png',
    'assets/images/styles/list3.jpg',
    'assets/images/styles/list4.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: appbarWithMenu(context),
        drawer: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors
                  .black, //This will change the drawer background to blue.
              //other styles
            ),
            child: drawerAppBar(context, '')),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    // _navigatorPage('channel');
                  },
                  child: CarouselWithTextDots(
                    carouselImg: carouselImg,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Heading(context, 'FEATURED STYLES'),
                SizedBox(
                  height: 20,
                ),
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(left: 5, right: 5, top: 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: width < 400
                          ? MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.49)
                          : MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.17),
                    ),
                    // scrollDirection: Axis.vertical,
                    itemCount: 2,
                    itemBuilder: (context, snapshot) {
                      return Column(
                        children: [
                          style(context, 'assets/images/styles/style3.jpg'),
                        ],
                      );
                    }),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 0),
                    child: Container(
                      height: 50,
                      width: 220,
                      child: FlatButton(
                        color: Colors.black,
                        // height: 40,
                        onPressed: () {
                          // _navigatorPage(true);
                        },
                        child: Text(
                          'DISCOVER MORE',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Heading(context, 'RECENT UPDATES'),
                SizedBox(
                  height: 270,
                  child: horizontalListWith3(context, img, Colors.white12),
                ),
                SizedBox(
                  height: 20,
                ),
                Heading(context, 'SUBSCRIPTION'),
                InkWell(
                  onTap: () {
                    // _navigatorPage('channel');
                  },
                  child: CarouselWithTextDots(
                    carouselImg: carouselImg,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
