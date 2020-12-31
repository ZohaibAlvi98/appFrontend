import 'package:flutter/material.dart';

class Styles extends StatefulWidget {
  @override
  _StylesState createState() => _StylesState();
}

class _StylesState extends State<Styles> {
  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              padding: EdgeInsets.only(right: 10, bottom: 10),
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
                size: 30,
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
                // height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        // fit: BoxFit.contain,
                        scale: 2.68,
                        image: AssetImage('assets/images/styles2.jpg'))),
                child: Container(
                    padding: EdgeInsets.only(
                        left: 50,
                        top: MediaQuery.of(context).size.height * 0.43),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('\n\nSTYLE',
                            style: TextStyle(
                                fontSize: 60,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ))),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text(
                    'DISCOVERY',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 50),
              child: Text(
                  'Personalized style discovery and shopping as a service. Where style meets fashion.',
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
              Text("FEATURED STYLES"),
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
              height: MediaQuery.of(context).size.height * 1.2,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/styles4.jpg'))),
            ),
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey[400], width: 1),
                borderRadius: BorderRadius.circular(80),
              ),
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 90,
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
                        padding: EdgeInsets.only(left: 25.0, top: 15),
                        child: Text(
                          'End',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        child: Column(
                          children: [
                            Text(
                              'End Clothing',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text('10 may 2020')
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.07),
                      child: Row(children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.favorite_outline_outlined),
                          color: Colors.grey[400],
                          iconSize: 30,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.bookmark_border),
                          color: Colors.grey[400],
                          iconSize: 30,
                          onPressed: () {},
                        ),
                      ]),
                    )
                  ],
                ),
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
