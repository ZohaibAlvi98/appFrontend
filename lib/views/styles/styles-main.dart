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
              height: height * 0.4,
              width: 160,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 3, 25, 0),
                      child: Image.asset(
                        'assets/images/styles2.jpg',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, top: height * 0.64),
                      child: Stack(
                        children: [
                          Text(
                            'STYLE',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.13,
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: height * 0.07, left: 1),
                            child: Text('DISCOVERY',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.13,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: height * 0.2),
                            child: Text(
                                'Personalized style discovery and shopping as a service. Where style meets fashion.',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(children: <Widget>[
                SizedBox(
                  height: height * 0.2,
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
                SizedBox(
                  height: height * 0.1,
                ),
                Container(
                    // child: Image.asset(name),
                    )
              ]),
            ],
          ),
        ));
  }
}
