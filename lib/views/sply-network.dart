import 'package:flutter/material.dart';
import 'package:splyxp/views/rss-detail/rss-detail.dart';
import '../services/editorials/editoirals.dart';

class SplyNetwork extends StatefulWidget {
  @override
  _SplyNetworkState createState() => _SplyNetworkState();
}

Editorials data = new Editorials();

class _SplyNetworkState extends State<SplyNetwork> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            // cards(width, 'assets/images/rss/rss1.jpg', context),
            FutureBuilder(
                future: data.getEditorials(),
                // artistService.getArtist(page),

                builder: (BuildContext context,
                    AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                  if (snapshot.hasData) {
                    // List<ArtistModel> artist = snapshot.data;
                    return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(left: 0, right: 0, top: 0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.7),
                        ),
                        // scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = snapshot.data[index];
                          return editirialscards(
                            width,
                            context,
                            // 'men',
                            item['image'],
                            index,
                            item['title'],
                            item['date'],
                            item['author'],
                            item['author_logo'],
                            item['short_text'],
                          );
                        });
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    print('Sorry');
                  }
                  return Center(child: CircularProgressIndicator());
                }),
            SizedBox(
              height: 15,
            ),
            // cards(width, 'assets/images/rss/rss2.jpg', context),
            // SizedBox(
            //   height: 15,
            // ),
            // cards(width, 'assets/images/rss/rss1.jpg', context),
          ],
        ),
      ),
    );
  }
}

Widget cards(width, img, context) {
  void _navigatorPage(index) {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          return RssDetail();
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

  return Container(
      padding: EdgeInsets.only(right: 15, left: 15, top: 0),
      child: InkWell(
        onTap: () {
          _navigatorPage(context);
        },
        child: Padding(
          padding: EdgeInsets.only(bottom: 7.0),
          child: Card(
            elevation: 1,
            margin: EdgeInsets.only(bottom: 5),
            child: Column(
              children: [
                Image.asset(
                  img,
                  fit: BoxFit.contain,
                ),
                Align(
                  // alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        width: width * 0.13,
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
                              ? EdgeInsets.only(left: 6.5, top: 13)
                              : EdgeInsets.only(left: 8.0, top: 13),
                          child: Text(
                            'End',
                            style: TextStyle(
                                fontSize: width < 400 ? 16 : 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 5.0, left: .7),
                          child: Column(
                            children: [
                              Padding(
                                padding: width < 400
                                    ? EdgeInsets.only(right: 51.5)
                                    : EdgeInsets.only(right: 63.0),
                                child: Text(
                                  'END.',
                                  style: TextStyle(
                                      fontSize: width < 400 ? 18 : 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 0.0),
                                child: Text(
                                  '',
                                  style: TextStyle(
                                      fontSize: width < 400 ? 11 : 14),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 3),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 13.0),
                            child: Text(
                              '1017 Alyx 9sm x Stussy - Available Now',
                              style: TextStyle(
                                  fontSize: width < 400 ? 22 : 25,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                          )),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 7.0, left: 13, bottom: 10, right: 10),
                          child: Text(
                            'Lorem ipsum is a placeholder text commonly used to demonstrate the visual document...',
                            style: TextStyle(height: 1.3),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
}

Widget editirialscards(
    width, context, image, index, title, date, author, authorlogo, shorttext) {
  void _navigatorPage(index) {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          return RssDetail();
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

  final logo = "https:" + authorlogo;
  return Container(
      padding: EdgeInsets.only(right: 15, left: 15, top: 2),
      child: InkWell(
        onTap: () {
          _navigatorPage(context);
        },
        child: Padding(
          padding: EdgeInsets.only(bottom: 7.0),
          child: Card(
            elevation: 2,
            margin: EdgeInsets.only(bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  image,
                  fit: BoxFit.contain,
                ),
                Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      width: width * 0.13,
                      height: 60,
                      // decoration: new BoxDecoration(
                      //   border: new Border.all(
                      //     color: Colors.grey[400],
                      //     width: 1.0,
                      //   ),
                      //   color: Colors.white,
                      //   shape: BoxShape.circle,
                      // ),
                      child: Padding(
                        padding: width < 400
                            ? EdgeInsets.only(left: 6.5, top: 10)
                            : EdgeInsets.only(left: 3.0, top: 1),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(logo),
                          radius: 30,
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 5.0, left: .7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: width < 400
                                  ? EdgeInsets.only(right: 51.5)
                                  : EdgeInsets.only(right: 63.0),
                              child: Text(
                                author,
                                style: TextStyle(
                                    fontSize: width < 400 ? 18 : 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 1.0),
                              child: Text(
                                date,
                                style:
                                    TextStyle(fontSize: width < 400 ? 11 : 14),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 3),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 13.0, right: 13),
                            child: Text(
                              title,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: width < 400 ? 22 : 20,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                          )),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 7.0, left: 13, bottom: 10, right: 13),
                          child: Text(
                            shorttext,
                            maxLines: 2,
                            style: TextStyle(height: 1),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
}
