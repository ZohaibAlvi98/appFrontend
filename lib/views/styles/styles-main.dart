import 'package:flutter/material.dart';

class Styles extends StatefulWidget {
  @override
  _StylesState createState() => _StylesState();
}

class _StylesState extends State<Styles> {
  List img = [
    'assets/images/list1.png',
    'assets/images/list2.png',
    'assets/images/list3.jpg',
    'assets/images/list4.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    double width = MediaQuery.of(context).size.width;
    print(width);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              padding: EdgeInsets.only(right: 20, bottom: 10),
              icon: new Image.asset(
                'assets/images/bag.png',
                height: 30,
              ),
              onPressed: () {})
        ],
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor: Colors.white12,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 1.0),
          child: Image.asset(
            'assets/images/home3.png',
            height: height * 40,
            width: 160,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 20, left: 20),
              // height: MediaQuery.of(context).size.height * 0.7,
              // width: MediaQuery.of(context).size.width * 0.9,
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //   scale: 2.68,
              //   image: AssetImage('assets/images/styles2.png'),
              // )),
              child: Image.asset(
                'assets/images/styles2.png',
              ),
            ),
            Padding(
              padding: width < 400
                  ? EdgeInsets.only(top: 20.0, left: 41)
                  : EdgeInsets.only(top: 20.0, left: 45),
              child: Text(
                  'Personalized style discovery and shopping as a service.\nWhere style meets fashion.',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400)),
            ),
            Row(children: <Widget>[
              SizedBox(
                height: height * 0.15,
              ),
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: Divider(
                      color: Colors.black,
                      height: 36,
                    )),
              ),
              Text(
                "FEATURED STYLES",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                    child: Divider(
                      color: Colors.black,
                      height: 36,
                    )),
              ),
            ]),
            Container(
              padding: EdgeInsets.only(right: 20, left: 20),
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         fit: BoxFit.cover,
              //         image: AssetImage('assets/images/styles4.jpg'))),
              child: Stack(children: [
                Image.asset('assets/images/styles4.jpg'),
                Card(
                  margin: width < 400
                      ? EdgeInsets.fromLTRB(5, width / 0.97, 5, 0)
                      : EdgeInsets.fromLTRB(14, width / 0.97, 14, 0),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey[400], width: 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    height: 70,

                    // width: height / 0.96,
                    // width: 755,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: width * 0.2,
                          height: 50,
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
                                ? EdgeInsets.only(left: 17.0, top: 13)
                                : EdgeInsets.only(left: 22.0, top: 13),
                            child: Text(
                              'End',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                        Padding(
                            padding: width < 400
                                ? EdgeInsets.only(top: 16)
                                : EdgeInsets.only(top: 16),
                            child: Column(
                              children: [
                                Text(
                                  'End Clothing',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Nov 4, 2020           ',
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )),
                        Padding(
                          padding: width < 400
                              ? EdgeInsets.only(left: width * 0.02)
                              : EdgeInsets.only(left: width * 0.08),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  padding: EdgeInsets.only(left: 10),
                                  icon: Icon(Icons.favorite_outline_outlined),
                                  color: Colors.black,
                                  iconSize: 26,
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(Icons.bookmark_border),
                                  color: Colors.black,
                                  iconSize: 26,
                                  onPressed: () {},
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 35, left: 30, right: 30),
              child: Text(
                'Thome Brown Winter Clothing Styling By End Clothing',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18, left: 32, right: 30),
              child: Text(
                'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
                style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // physics: NeverScrollableScrollPhysics(),
                // shrinkWrap: true,
                itemCount: img.length,
                padding: const EdgeInsets.only(right: 20.0, left: 5.5),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Card(
                          child: Wrap(children: [
                            Image.asset(
                              img[index],
                              height: 175,
                            ),
                          ]),
                        ),
                        color: Colors.white12,
                      ),
                      Padding(
                        padding: width < 400
                            ? EdgeInsets.only(right: 15.0)
                            : EdgeInsets.only(right: 18.0),
                        child: Text(
                          'Thome Brown 4 Bar \nJackets',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: width < 400
                            ? EdgeInsets.only(top: 7.0, bottom: 5, right: 15)
                            : EdgeInsets.only(top: 7.0, bottom: 5, right: 18),
                        child: Text(
                          'Brand: Thome Brown',
                          style: TextStyle(
                              fontSize: 12.5, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 85),
                        child: Text('£759.00'),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              color: Colors.grey[100],
              padding: EdgeInsets.only(right: 20, left: 20),
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         fit: BoxFit.cover,
              //         image: AssetImage('assets/images/styles4.jpg'))),
              child: Stack(children: [
                Padding(
                  padding: EdgeInsets.only(top: 35.0, bottom: 35),
                  child: Image.asset('assets/images/style3.jpg'),
                ),
                Card(
                  margin: width < 400
                      ? EdgeInsets.fromLTRB(5, width / 0.9, 5, 0)
                      : EdgeInsets.fromLTRB(14, width / 0.88, 14, 0),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey[400], width: 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    height: 70,

                    // width: height / 0.96,
                    // width: 755,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: width * 0.2,
                          height: 50,
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
                                ? EdgeInsets.only(left: 17.0, top: 13)
                                : EdgeInsets.only(left: 22.0, top: 13),
                            child: Text(
                              'End',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                        Padding(
                            padding: width < 400
                                ? EdgeInsets.only(top: 16)
                                : EdgeInsets.only(top: 16),
                            child: Column(
                              children: [
                                Text(
                                  'End Clothing',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Nov 4, 2020           ',
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )),
                        Padding(
                          padding: width < 400
                              ? EdgeInsets.only(left: width * 0.02)
                              : EdgeInsets.only(left: width * 0.08),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  padding: EdgeInsets.only(left: 10),
                                  icon: Icon(Icons.favorite_outline_outlined),
                                  color: Colors.black,
                                  iconSize: 26,
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(Icons.bookmark_border),
                                  color: Colors.black,
                                  iconSize: 26,
                                  onPressed: () {},
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 35, left: 30, right: 30),
              child: Text(
                'Thome Brown Winter Clothing Styling By End Clothing',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 18, left: 32, right: 30, bottom: 15),
              child: Text(
                'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
                style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
      // child: Column(
      //   children: [
      //     Container(
      //       child: Stack(
      //         children: [
      //           Padding(
      //             padding: EdgeInsets.fromLTRB(25, 3, 25, 0),
      //             child: Image.asset(
      //               'assets/images/styles2.jpg',
      //               height: height * 0.7,
      //             ),
      //           ),
      //           Padding(
      //             padding: EdgeInsets.only(left: 40, top: height * 0.63),
      //             child: Stack(
      //               children: [
      //                 Text(
      //                   'STYLE',
      //                   style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: width * 0.13,
      //                       fontWeight: FontWeight.w600),
      //                 ),
      //                 Padding(
      //                   padding:
      //                       EdgeInsets.only(top: height * 0.07, left: 1),
      //                   child: Text('DISCOVERY',
      //                       style: TextStyle(
      //                           color: Colors.black,
      //                           fontSize: width * 0.13,
      //                           fontWeight: FontWeight.w600)),
      //                 ),
      //                 Padding(
      //                   padding: EdgeInsets.only(top: height * 0.2),
      //                   child: Text(
      //                       'Personalized style discovery and shopping as a service. Where style meets fashion.',
      //                       style: TextStyle(
      //                           fontSize: 20,
      //                           color: Colors.black,
      //                           fontWeight: FontWeight.w400)),
      //                 )
      //               ],
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //     Row(children: <Widget>[
      //       SizedBox(
      //         height: height * 0.2,
      //       ),
      //       Expanded(
      //         child: new Container(
      //             margin: const EdgeInsets.only(left: 10.0, right: 20.0),
      //             child: Divider(
      //               color: Colors.black,
      //               height: 36,
      //             )),
      //       ),
      //       Text("FEATURED STYLES"),
      //       Expanded(
      //         child: new Container(
      //             margin: const EdgeInsets.only(left: 20.0, right: 10.0),
      //             child: Divider(
      //               color: Colors.black,
      //               height: 36,
      //             )),
      //       ),
      //       SizedBox(
      //         height: height * 0.1,
      //       ),
      //       Container(
      //           // child: Image.asset(name),
      //           )
      //     ]),
      //   ],
      // ),
    );
  }
}
