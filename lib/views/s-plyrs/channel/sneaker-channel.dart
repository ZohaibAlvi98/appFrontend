import 'package:flutter/material.dart';
import 'package:splyxp/widgets/profileTabs.dart';
import 'package:splyxp/widgets/videoList.dart';
import '../../../widgets/innerAppBar.dart';
import 'package:splyxp/views/styles/style-detail.dart';
import 'package:splyxp/widgets/roundedCard.dart';
import '../../sply-network.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/services.dart';
import '../../../services/splyrs/sneakers-splyr-channel.dart';
import '../../../services/splyrs/splyrs-products.dart';
import 'package:splyxp/views/products/product-sneaker-detail.dart';
import '../../../services/splyrs/splyrs-products.dart';
import '../../../services/splyrs/splyr-logo&back.dart';
import '../../../services/splyrs/splyrs-stories.dart';
import '../../../services/splyrs/splyrs-styles.dart';
import '../../../services/splyrs/splyr-editorials.dart';
import 'package:splyxp/widgets/lists.dart';
import '../../../services/splyrs/sneaker-splyr-all-products.dart';

SplyrEditorials editorialdata = SplyrEditorials();
VendorStyles styledata = VendorStyles();
Stories storydata = Stories();
SneakerSplyrsChannel data = SneakerSplyrsChannel();
SplyrsProducts getdata = SplyrsProducts();
SneakerSplyrsAllProducts returndata = SneakerSplyrsAllProducts();
LogoAndBanner getlogoandbanner = LogoAndBanner();

class SneakerChannel extends StatefulWidget {
  final String splyrId;
  SneakerChannel({Key key, @required this.splyrId}) : super(key: key);
  @override
  _SneakerChannelState createState() => _SneakerChannelState();
}

class _SneakerChannelState extends State<SneakerChannel> {
  int _pageIndex = 0;
  double height = 46;
  void _onTapped(int value) {
    print(value);
    setState(() {
      _pageIndex = value;
    });
  }

  List thumbnail = [
    'assets/images/tv/v1.png',
    'assets/images/tv/v2.png',
    'assets/images/tv/v3.png',
    'assets/images/tv/v4.png'
  ];
  List videoUrl = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'
  ];

  // void _navigatorPage() {
  //   // Navigator.of(context).pop(new PageRouteBuilder());
  //   Navigator.of(context).push(new PageRouteBuilder(
  //       opaque: true,
  //       transitionDuration: const Duration(),
  //       pageBuilder: (BuildContext context, _, __) {
  //         return MenWoman();
  //       },
  //       transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
  //         return new SlideTransition(
  //           child: child,
  //           position: new Tween<Offset>(
  //             begin: const Offset(1.0, 0.0),
  //             end: Offset.zero,
  //           ).animate(animation),
  //         );
  //       }));
  // }

  List img = [
    'assets/images/splyrs/channels/prod1.jpg',
    'assets/images/splyrs/channels/prod2.jpg',
    'assets/images/splyrs/channels/prod3.jpg',
    'assets/images/splyrs/channels/prod4.jpg',
    'assets/images/splyrs/channels/prod5.jpg',
    'assets/images/splyrs/channels/prod6.jpg'
  ];

  String getBrand(prodList) {
    for (var a = 0; a < prodList['meta_data'].length; a++) {
      if (prodList['meta_data'][a]['key'] == '_select_brand') {
        return prodList['meta_data'][a]['value'];
      }
    }
  }

  final url = 'https://www.youtube.com/watch?v=sR-PCwu9SBw&feature=youtu.be';

  YoutubePlayerController _controller;

  void _runYoutubePlayer() {
    _controller = YoutubePlayerController(
        initialVideoId: 'sR-PCwu9SBw',
        params: YoutubePlayerParams(
          autoPlay: false,
          showControls: true,
          showFullscreenButton: true,
          desktopMode: true,
          privacyEnhanced: true,
        ));
    print(_controller.value);
    // YoutubePlayer.convertUrlToId(url),
    // flags: YoutubePlayerFlags(
    //     enableCaption: false, isLive: false, autoPlay: false));
  }

  void _navigatorPage(context, id) {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          return ProductDetailSneaker(
            prodId: id,
          );
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

  @override
  void initState() {
    _runYoutubePlayer();
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    };
    _controller.onExitFullscreen = () {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      Future.delayed(const Duration(seconds: 1), () {
        _controller.play();
      });
      Future.delayed(const Duration(seconds: 5), () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      });
    };
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

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
            child: drawerAppBar(context, '', false)),
        body: FutureBuilder(
            future: data.getSneakerSplyrChannel(widget.splyrId),
            builder: (BuildContext context,
                AsyncSnapshot<Map<String, dynamic>> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                final item = snapshot.data;
                print(snapshot);

                return SingleChildScrollView(
                  child: Container(
                    child: YoutubePlayerControllerProvider(
                      controller: _controller,
                      child: Column(
                        children: [
                          Container(
                            padding:
                                EdgeInsets.only(right: 10, left: 10, top: 5),
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
                                        item['shop']['title'].toUpperCase(),
                                        style: TextStyle(
                                            fontSize: width < 400 ? 18 : 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.2),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: width < 400 ? 220 : 240),
                                    child: Text(
                                      item['shop']['title'].toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 27,
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 1,
                                          fontFamily: 'RMNUEU'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: width < 400 ? 250 : 270),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.0),
                                            child: Icon(
                                              Icons.location_pin,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 18.0),
                                            child: Text(
                                              item['shop']['title'] +
                                                  ', ' +
                                                  item['address']['country'],
                                              style: TextStyle(
                                                  fontFamily: 'RMNUEUREGULAR',
                                                  fontSize: width < 400
                                                      ? 13.5
                                                      : 15.5),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 0.0),
                                            child: Icon(
                                              Icons.mail_sharp,
                                            ),
                                          ),
                                          Text(
                                            ' ' + item['email'],
                                            style: TextStyle(
                                                fontFamily: 'RMNUEUREGULAR',
                                                fontSize:
                                                    width < 400 ? 13.5 : 15.5),
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
                                  side: BorderSide(
                                      color: Colors.black87, width: 1.4)),
                              onPressed: () {
                                // _navigatorPage();
                              },
                              child: Text(
                                'SUBSCRIBE NOW',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17),
                              ),
                              color: Colors.white,
                              minWidth: 160,
                              height: 45,
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 14, bottom: 10),
                            child: Divider(
                              thickness: 2,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 14),
                            child: Text(
                              item['shop']['description'],
                              style: TextStyle(fontSize: 14, height: 1.3),
                            ),
                          ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // story(context),
                          // SizedBox(
                          //   height: width < 400 ? 25 : 30,
                          // ),
                          ProfileTabBar(height, _onTapped, 'splyr'),
                          SizedBox(
                            height: 1,
                          ),
                          if (_pageIndex == 0)
                            FutureBuilder(
                                future: returndata
                                    .getSplyrsSneakersProducts(widget.splyrId),
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<Map<String, dynamic>>>
                                        snapshot) {
                                  if (snapshot.hasData) {
                                    // List<ArtistModel> artist = snapshot.data;
                                    return GridView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.only(
                                            left: 1, right: 1, top: 20),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio:
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  (MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      1.1),
                                        ),
                                        // scrollDirection: Axis.vertical,
                                        itemCount: snapshot.data.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final item = snapshot.data[index];
                                          final brand = getBrand(item);
                                          return InkWell(
                                            onTap: () => _navigatorPage(
                                                context, item['id'].toString()),
                                            child: Lists(
                                              context,
                                              'men',
                                              item['images'][0]['src'],
                                              index,
                                              item['name'],
                                              item['price'],
                                              item['id'].toString(),
                                              brand,
                                            ),
                                          );
                                        });
                                  } else if (snapshot.hasError) {
                                    print(snapshot.error);
                                    print('Sorry');
                                  }

                                  return Center(
                                      child: CircularProgressIndicator());
                                }),
                          SizedBox(
                            height: 8,
                          ),
                          if (_pageIndex == 1)
                            FutureBuilder(
                                future:
                                    styledata.getVendorStyles(widget.splyrId),
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<Map<String, dynamic>>>
                                        snapshot) {
                                  if (snapshot.hasData) {
                                    return GridView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.only(
                                            left: 5, right: 5, top: 10),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: width < 400
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  (MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      1.42)
                                              : MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  (MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      1.17),
                                        ),
                                        itemCount: snapshot.data.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final item = snapshot.data[index];
                                          return Column(
                                            children: [
                                              style(
                                                  context,
                                                  item['cover_image'],
                                                  item['title'],
                                                  item['created_at'],
                                                  item['splyr_name'],
                                                  item['id'].toString()),
                                              SizedBox(
                                                height: 30,
                                              ),
                                            ],
                                          );
                                        });
                                  } else if (snapshot.hasError) {
                                    print(snapshot.error);
                                    print('Sorry');
                                  }

                                  return Center(
                                      child: CircularProgressIndicator());
                                }),
                          if (_pageIndex == 3)
                            VideoListHorizontal(
                                thumbnail: thumbnail, videoUrl: videoUrl),
                          if (_pageIndex == 4)
                            FutureBuilder(
                                future: editorialdata
                                    .getSplyrEditorials(widget.splyrId),
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<Map<String, dynamic>>>
                                        snapshot) {
                                  if (snapshot.hasData) {
                                    return GridView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.only(
                                          left: 0, right: 0, top: 0),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        childAspectRatio:
                                            MediaQuery.of(context).size.width /
                                                (MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    1.7),
                                      ),
                                      itemCount: snapshot.data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final item = snapshot.data[index];
                                        return Column(
                                          children: [
                                            editirialscards(
                                                width,
                                                context,
                                                item['image'],
                                                index,
                                                item['title'],
                                                item['date'],
                                                item['author'],
                                                item['author_logo'],
                                                item['short_text'],
                                                item['post_id'].toString()),
                                            SizedBox(
                                              height: 15,
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else if (snapshot.hasError) {
                                    print(snapshot.error);
                                    print('Sorry');
                                  }

                                  return Center(
                                      child: CircularProgressIndicator());
                                }),
                        ],
                      ),
                    ),
                  ),
                );
              }
            }));
  }

  Widget style(context, img, styleTitle, styleDate, styleBrand, styleId) {
    void _navigatorPage() {
      // Navigator.of(context).pop(new PageRouteBuilder());
      Navigator.of(context).push(new PageRouteBuilder(
          opaque: true,
          transitionDuration: const Duration(),
          pageBuilder: (BuildContext context, _, __) {
            return StyleDetail(
              styleId: styleId,
            );
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
          }));
    }

    return InkWell(
      onTap: () {
        _navigatorPage();
      },
      child: Container(
        padding: EdgeInsets.only(right: 10, left: 10),
        child: Stack(children: [
          Image.network(
            img,
          ),
          RoundedCardForGrid(
              context, 2.05, 2.05, styleTitle, styleDate, styleBrand),
        ]),
      ),
    );
  }

  Widget story(context) {
    final stories = Expanded(
        child: FutureBuilder(
            future: storydata.getStories(widget.splyrId),
            builder: (BuildContext context,
                AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(right: 20.0, left: 12),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = snapshot.data[index];
                      return Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            margin: index != 0
                                ? EdgeInsets.symmetric(horizontal: 6)
                                : EdgeInsets.only(right: 6),
                            width: 85,
                            height: 120,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.redAccent,
                                width: 2,
                                style: BorderStyle.solid,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              width: 80,
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey[500],
                                    style: BorderStyle.solid,
                                  ),
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(
                                        item['cover_image'],
                                      ))),
                              margin: EdgeInsets.symmetric(horizontal: 6),
                            ),
                          ),
                        ],
                      );
                    });
              }
            }));

    var deviceSize = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: deviceSize.height * 0.2,
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
                              height: 35,
                            )
                          ],
                        ),
                      ),
                    )
                  : Column()),
        )
      ],
    );
  }
}
