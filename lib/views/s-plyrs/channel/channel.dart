import 'package:flutter/material.dart';
import '../../../widgets/innerAppBar.dart';

class Channel extends StatefulWidget {
  @override
  _ChannelState createState() => _ChannelState();
}

class _ChannelState extends State<Channel> {
  // List<Widget> containers = [
  //   SizedBox(
  //     height: 100,
  //     child: ListView.builder(
  //         scrollDirection: Axis.vertical,
  //         shrinkWrap: true,
  //         itemCount: 12,
  //         physics: AlwaysScrollableScrollPhysics(),
  //         padding: EdgeInsets.only(right: 20.0, left: 7, top: 20),
  //         itemBuilder: (context, index) {
  //           List women = [
  //             'New In',
  //             'Shop By',
  //             'Clothing',
  //             'Bags',
  //             'Jewelry',
  //             'Accessories',
  //             'Item 1',
  //             'Item 2',
  //             'Item 3',
  //             'Item 4',
  //             'Item 5',
  //             'Item 6',
  //           ];
  //           double width = MediaQuery.of(context).size.width;
  //           return Container();
  //         }),
  //   ),
  //   SizedBox(
  //     height: 100,
  //     child: ListView.builder(
  //         scrollDirection: Axis.vertical,
  //         shrinkWrap: true,
  //         itemCount: 12,
  //         physics: AlwaysScrollableScrollPhysics(),
  //         padding: EdgeInsets.only(right: 20.0, left: 7, top: 20),
  //         itemBuilder: (context, index) {
  //           List men = [
  //             'Shop By',
  //             'Clothing',
  //             'Activewear',
  //             'Shoes',
  //             'Sneakers',
  //             'Watches',
  //             'Item 1',
  //             'Item 2',
  //             'Item 3',
  //             'Item 4',
  //             'Item 5',
  //             'Item 6',
  //           ];
  //           double width = MediaQuery.of(context).size.width;
  //           return Container();
  //         }),
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: Appbar(context),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 10, left: 10, top: 5),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/splyrs/channels/main2.jpg',
                        fit: BoxFit.contain,
                      ),
                      Center(
                        heightFactor: 2.12,
                        child: Container(
                          width: width / 2.71,
                          height: width / 3,
                          decoration: new BoxDecoration(
                              border: new Border.all(
                                color: Colors.grey[200],
                                width: 1.0,
                              ),
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(2.2,
                                      2.2), // shadow direction: bottom right
                                )
                              ]),
                          child: Center(
                            child: Text(
                              'S-PLY',
                              style: TextStyle(
                                  fontSize: width < 400 ? 34 : 41,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: width < 400 ? 200 : 225.0),
                          child: Text(
                            'S-PLY STORE',
                            style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: width < 400 ? 250 : 270),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Icon(
                                    Icons.location_pin,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 18.0),
                                  child: Text(
                                    'S-PLY Store, London, United Kingdom',
                                    style: TextStyle(
                                        fontSize: width < 400 ? 13.5 : 15.5),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 0.0),
                                  child: Icon(
                                    Icons.mail_sharp,
                                  ),
                                ),
                                Text(
                                  ' s-plytv@s-plystyle.net',
                                  style: TextStyle(
                                      fontSize: width < 400 ? 13.5 : 15.5),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.black87, width: 1.4)),
                    onPressed: () {
                      // _navigatorPage('request');
                    },
                    child: Text(
                      'SUBSCRIBE NOW',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    color: Colors.white,
                    minWidth: 200,
                    height: 54,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 14, bottom: 10),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 14),
                  child: Text(
                    'S-PLY is an online and retail concept store founded in London, with planned locations in Amsterdam, New York and Los Angeles',
                    style: TextStyle(fontSize: 17, height: 1.3),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                story(context),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}

Widget story(context) {
  final stories = Expanded(
    child: Padding(
      padding: EdgeInsets.only(top: 2.0),
      child: new ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) => new Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 80,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                'assets/images/sneakers/list2.jpg'))),
                    margin: EdgeInsets.symmetric(horizontal: 7),
                  )
                ],
              )),
    ),
  );

  var deviceSize = MediaQuery.of(context).size;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        height: deviceSize.height * 0.2,
        child: Flexible(
            child: new ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) => index == 0
                    ? new SizedBox(
                        height: 180,
                        child: Container(
                          margin: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Stories',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              stories,
                              SizedBox(
                                height: 25,
                              )
                            ],
                          ),
                        ),
                      )
                    : Column())),
      )
    ],
  );
}
