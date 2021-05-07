import 'package:flutter/material.dart';
import 'package:splyxp/views/search/categories/categories.dart';

class ByGender extends StatefulWidget {
  @override
  _ByGenderState createState() => _ByGenderState();
}

class _ByGenderState extends State<ByGender> {
  List heading = ['Men', 'Women'];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Text(
              'SEARCH BY ',
              style: TextStyle(
                  fontFamily: 'RMNUEU',
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            // physics: NeverScrollableScrollPhysics(),
            // shrinkWrap: true,
            itemCount: 2,
            padding: EdgeInsets.only(right: 20.0, left: 7),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 10, 5, 8),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      new PageRouteBuilder(
                        opaque: true,
                        transitionDuration: const Duration(),
                        pageBuilder: (BuildContext context, _, __) {
                          return Categories(gender: heading[index]);
                        },
                        transitionsBuilder:
                            (_, Animation<double> animation, __, Widget child) {
                          return new SlideTransition(
                            child: child,
                            position: new Tween<Offset>(
                              begin: const Offset(1.0, 0.0),
                              end: Offset.zero,
                            ).animate(animation),
                          );
                        },
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Stack(
                            children: [
                              Text(
                                heading[index],
                                style: TextStyle(
                                    fontFamily: 'RMNUEUSEMIBOLD',
                                    fontSize: width < 400 ? 18 : 21,
                                    fontWeight: FontWeight.w700),
                              ),
                              Padding(
                                padding: width < 400
                                    ? EdgeInsets.only(left: 291, top: 3)
                                    : EdgeInsets.only(left: 343, top: 1.2),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: new Divider(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
