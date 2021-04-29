import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/services.dart';
import 'package:html/parser.dart';

class DropDown extends StatefulWidget {
  final String link;
  final String description;
  final String vendor;
  // final String description;
  DropDown({
    Key key,
    @required this.link,
    @required this.description,
    @required this.vendor,
    store,
  }) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  final url = 'https://www.youtube.com/watch?v=sR-PCwu9SBw&feature=youtu.be';

  YoutubePlayerController _controller;

  void _runYoutubePlayer() {
    _controller = YoutubePlayerController(
        initialVideoId: 'sR-PCwu9SBw',
        params: YoutubePlayerParams(
          showControls: true,
          showFullscreenButton: true,
          desktopMode: true,
          privacyEnhanced: true,
        ));

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

  // @override
  // void _dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  final list2 = [
    'Description',
    // 'Video',
    'Vendor',
    'Sizing',
    'Shipping & returns'
  ];

  final list = new List.generate(1, (i) => "item");

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return YoutubePlayerControllerProvider(
      controller: _controller,
      // player: YoutubePlayer(controller: _controller),
      // builder: (context, player) {

      child: Container(
        padding: EdgeInsets.only(left: 13, right: 13, top: 5),
        child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: list2.length,
          itemBuilder: (context, i) => Column(
            children: [
              ExpansionTile(
                title: new Text(
                  list2[i],
                  style: TextStyle(
                      fontFamily: 'RMNUEUSEMIBOLD',
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                children: list
                    .map(
                      (val) => new ListTile(
                        title: i == 0
                            ? Text(
                                widget.description,
                                style: TextStyle(height: 1.8),
                              )
                            // : i == 1
                            //     ? Padding(
                            //         padding: EdgeInsets.only(
                            //             bottom: 15.0),
                            //         child: YoutubePlayerIFrame(
                            //           aspectRatio: 10 / 9,
                            //         ),
                            //       )
                            : i == 1
                                ? Column(
                                    children: [
                                      Text(
                                        widget.vendor,
                                        style: TextStyle(
                                            fontSize: width < 400 ? 18 : 20,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Container(
                                          height: 45,
                                          width: 250,
                                          child: FlatButton(
                                            color: Colors.black,
                                            // height: 45,
                                            // minWidth: 23,
                                            onPressed: () {},
                                            child: FittedBox(
                                              fit: BoxFit.cover,
                                              child: Text(
                                                'More Products from ${widget.vendor}',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : i == 2
                                    ? Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Shoe Size Chart',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Image.asset(
                                                'assets/images/productDetail/size1.jpg'),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      )
                                    : Text(
                                        'For more information about return please click here.\n',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                      ),
                    )
                    .toList(),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
    // });
  }
}
