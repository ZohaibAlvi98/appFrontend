import 'package:flutter/material.dart';
import 'package:splyxp/views/chatList/chat-detail.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  void _navigatorPage(user) {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          return ChatDetail(user: user);
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new SlideTransition(
            child: child,
            position: new Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
          );
        }));
  }

  List heading = ['Designers', 'Categories'];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.0, left: 15),
            child: Text(
              'SEARCH',
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.w900, letterSpacing: 1),
            ),
          ),
          Container(
            width: 450,
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 40),
            child: new TextField(
              cursorColor: Colors.black,
              decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[600],
                ),
                filled: true,
                fillColor: Colors.grey[300],
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: '  Search Products, Design & etc',
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
              ),
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
              padding: EdgeInsets.only(right: 20.0, left: 5.5),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _navigatorPage(heading[index]);
                  },
                  child: Container(
                    height: 60,
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
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
                                        fontSize: width < 400 ? 18 : 21,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Padding(
                                    padding: width < 400
                                        ? EdgeInsets.only(left: 200)
                                        : EdgeInsets.only(left: 330),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                          new Divider(
                            color: Colors.grey[500],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
