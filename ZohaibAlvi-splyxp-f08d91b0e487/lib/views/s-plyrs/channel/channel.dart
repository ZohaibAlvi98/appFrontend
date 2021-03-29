import 'package:flutter/material.dart';
import 'package:splyxp/widgets/profileTabs.dart';
import 'package:splyxp/widgets/videoList.dart';
import '../../../widgets/innerAppBar.dart';
import 'package:splyxp/views/styles/style-detail.dart';
import 'package:splyxp/widgets/roundedCard.dart';
import '../../sply-network.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/services.dart';

class Channel extends StatefulWidget {
  @override
  _ChannelState createState() => _ChannelState();
}

class _ChannelState extends State<Channel> {
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
        appBar: Appbar(context),
        body: SingleChildScrollView(
          child: Container(
            child: YoutubePlayerControllerProvider(
              controller: _controller,
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
                          padding:
                              EdgeInsets.only(top: width < 400 ? 250 : 270),
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
                        // _navigatorPage();
                      },
                      child: Text(
                        'SUBSCRIBE NOW',
                        style: TextStyle(color: Colors.black, fontSize: 17),
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
                    padding: EdgeInsets.only(left: 15.0, right: 14, bottom: 10),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 14),
                    child: Text(
                      'S-PLY is an online and retail concept store founded in London, with planned locations in Amsterdam, New York and Los Angeles',
                      style: TextStyle(fontSize: 14, height: 1.3),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  story(context),
                  SizedBox(
                    height: width < 400 ? 25 : 30,
                  ),
                  ProfileTabBar(height, _onTapped, 'splyr'),
                  SizedBox(
                    height: 1,
                  ),
                  if (_pageIndex == 0)
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(left: 5, right: 5, top: 10),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.49),
                        ),
                        // scrollDirection: Axis.vertical,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 7.0, right: 7),
                                child: Image.asset(
                                  img[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 5, left: 10),
                                  child: Text(
                                    'S-PLY Supreme Jackets',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 5, left: 10),
                                  child: Text(
                                    'Price \$290',
                                    style: TextStyle(
                                        fontSize: 15.5,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  SizedBox(
                    height: 8,
                  ),
                  if (_pageIndex == 1)
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
                        itemCount: 6,
                        itemBuilder: (context, snapshot) {
                          return Column(
                            children: [
                              style(context, 'assets/images/styles/style3.jpg'),
                              SizedBox(
                                height: 30,
                              ),
                              // style(context, 'assets/images/styles/styles4.jpg'),
                              // SizedBox(
                              //   height: 25,
                              // ),
                              // style(context, 'assets/images/styles/style3.jpg'),
                              // SizedBox(
                              //   height: 25,
                              // ),
                            ],
                          );
                        }),
                  if (_pageIndex == 3)
                    VideoListHorizontal(
                        thumbnail: thumbnail, videoUrl: videoUrl),
                  // Column(
                  //   children: [
                  //     Padding(
                  //       padding: EdgeInsets.only(
                  //           bottom: 20.0, right: 40, left: 40, top: 10),
                  //       child: YoutubePlayerIFrame(
                  //         aspectRatio: 10 / 6,
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.only(
                  //           bottom: 20.0, right: 40, left: 40, top: 10),
                  //       child: YoutubePlayerIFrame(
                  //         aspectRatio: 10 / 6,
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.only(
                  //           bottom: 20.0, right: 40, left: 40, top: 10),
                  //       child: YoutubePlayerIFrame(
                  //         aspectRatio: 10 / 6,
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       height: 5,
                  //     ),
                  //   ],
                  // ),
                  if (_pageIndex == 4)
                    Column(
                      children: [
                        cards(width, 'assets/images/rss/rss1.jpg', context),
                        SizedBox(
                          height: 15,
                        ),
                        cards(width, 'assets/images/rss/rss2.jpg', context),
                        SizedBox(
                          height: 15,
                        ),
                        cards(width, 'assets/images/rss/rss1.jpg', context),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}

Widget style(context, img) {
  void _navigatorPage() {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          return StyleDetail();
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

  print('here');
  return InkWell(
    onTap: () {
      _navigatorPage();
    },
    child: Container(
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Stack(children: [
        Image.asset(
          img,
        ),
        RoundedCardForGrid(context, 2.05, 2.05),
      ]),
    ),
  );
}

Widget story(context) {
  final stories = Expanded(
    child: Padding(
      padding: EdgeInsets.only(top: 5.0),
      child: new ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) => new Stack(
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
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'assets/images/sneakers/list2.jpg',
                              ))),
                      margin: EdgeInsets.symmetric(horizontal: 6),
                    ),
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
                                    fontWeight: FontWeight.bold, fontSize: 16),
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
