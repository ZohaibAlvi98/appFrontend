import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:video_player/video_player.dart';

class VideoList extends StatefulWidget {
  final List thumbnail;
  final List videoUrl;
  final List videoTitle;
  VideoList(
      {Key key,
      @required this.thumbnail,
      @required this.videoUrl,
      @required this.videoTitle})
      : super(key: key);
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  // @override
  // void initState() {
  //   _controller = VideoPlayerController.network(
  //       "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
  //   //_controller = VideoPlayerController.asset("videos/sample_video.mp4");
  //   _initializeVideoPlayerFuture = _controller.initialize();
  //   _controller.setLooping(true);
  //   _controller.setVolume(1.0);
  //   super.initState();
  // }

  void _initController(String link) {
    _controller = VideoPlayerController.network(link);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      // physics: NeverScrollableScrollPhysics(),
      // shrinkWrap: true,
      itemCount: widget.thumbnail.length,
      padding: width < 400
          ? EdgeInsets.only(right: 2, left: 5)
          : EdgeInsets.only(right: 20.0, left: 5.5),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, right: 3),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        insetPadding: EdgeInsets.only(left: 3, right: 2),
                        backgroundColor: Colors.black,
                        actions: [
                          Stack(
                            overflow: Overflow.visible,
                            children: [
                              Positioned(
                                child: MaterialButton(
                                  height: 25,
                                  color: Colors.red,
                                  shape: CircleBorder(),
                                  child: Icon(
                                    Icons.close,
                                    size: 14,
                                  ),
                                  onPressed: () {
                                    if (_controller == null) {
                                    } else {
                                      if (_controller.value.isPlaying ||
                                          _controller.value.isBuffering ||
                                          _controller.value.isLooping) {
                                        _controller.pause();
                                      }
                                    }
                                    // setState(() {
                                    //   _controller = null;
                                    // });

                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 1000,
                            height: 250,
                            child: FutureBuilder(
                              future: _initializeVideoPlayerFuture,
                              builder: (context, snapshot) {
                                if (_controller == null) {
                                  // If there was no controller, just create a new one
                                  _initController(widget.videoUrl[index]);
                                } else {
                                  final oldController = _controller;

                                  // Registering a callback for the end of next frame
                                  // to dispose of an old controller
                                  // (which won't be used anymore after calling setState)
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) async {
                                    await oldController.dispose();

                                    // Initing new controller
                                    // _initController(
                                    //     'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
                                  });

                                  // Making sure that controller is not used by setting it to null

                                  setState(() {
                                    _controller = null;
                                  });
                                }
                                return AspectRatio(
                                  aspectRatio: _controller.value.aspectRatio,
                                  child: Chewie(
                                    // key: new PageStorageKey(widget.url),
                                    controller: ChewieController(
                                      allowFullScreen: true,
                                      allowPlaybackSpeedChanging: false,
                                      videoPlayerController: _controller,
                                      aspectRatio: 3 / 2,
                                      // Prepare the video to be played and display the first frame
                                      autoInitialize: true,
                                      looping: false,
                                      autoPlay: false,
                                      // Errors can occur for example when trying to play a video
                                      // from a non-existent URL
                                      errorBuilder: (context, errorMessage) {
                                        return Center(
                                          child: Text(
                                            errorMessage,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                        // content: Stack(
                        //   overflow: Overflow.visible,
                        //   children: <Widget>[
                        //     Positioned(
                        //       right: -30.0,
                        //       top: -40.0,
                        //       child: InkResponse(
                        //         onTap: () {
                        //           final oldController = _controller;

                        //           // Registering a callback for the end of next frame
                        //           // to dispose of an old controller
                        //           // (which won't be used anymore after calling setState)
                        //           WidgetsBinding.instance
                        //               .addPostFrameCallback((_) async {
                        //             await oldController.dispose();

                        //             // Initing new controller
                        //             // _initController(
                        //             //     'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
                        //           });
                        //           setState(() {
                        //             _controller = null;
                        //           });
                        //           Navigator.of(context).pop();
                        //         },
                        //         child: CircleAvatar(
                        //           maxRadius: 15,
                        //           child: Icon(
                        //             Icons.close,
                        //             size: 18,
                        //           ),
                        //           backgroundColor: Colors.red,
                        //         ),
                        //       ),
                        //     ),
                      );
                    },
                  );
                },
                child: Card(
                  child: Wrap(children: [
                    Image.network(
                      widget.thumbnail[index],
                      height: width < 400 ? 90 : 110,
                      // width: imgwidth,
                    ),
                  ]),
                ),
              ),
              color: Colors.white12,
            ),
            Padding(
              padding: width < 400
                  ? EdgeInsets.only(top: 5, right: 5, left: 5)
                  : EdgeInsets.only(top: 6, right: 5, left: 5),
              child: SizedBox(
                width: 150.0,
                child: Text(
                  widget.videoTitle[index],
                  style: TextStyle(
                      fontFamily: 'RMNUEUSEMIBOLD',
                      fontSize: width < 400 ? 12 : 15,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  // overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
            Padding(
              padding: width < 400
                  ? EdgeInsets.only(top: 7.0, bottom: 5)
                  : EdgeInsets.only(top: 10.0, bottom: 5, left: 5),
              child: Text(''
                  // 'Lorem ipsum is a placeholder\n text commonly used to\n demonstrate the visual form of \n a document.',
                  // style: TextStyle(
                  //     fontSize: width < 400 ? 8 : 12,
                  //     fontWeight: FontWeight.w800,
                  //     height: width < 400 ? 1.15 : 1.3),
                  ),
            ),
          ],
        );
      },
    );
  }
}

class VideoListHorizontal extends StatefulWidget {
  final List thumbnail;
  final List videoUrl;
  final List videoTitle;
  final List date;
  VideoListHorizontal(
      {Key key,
      @required this.thumbnail,
      @required this.videoUrl,
      @required this.videoTitle,
      @required this.date})
      : super(key: key);
  @override
  _VideoListHorizontalState createState() => _VideoListHorizontalState();
}

class _VideoListHorizontalState extends State<VideoListHorizontal> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  // @override
  // void initState() {
  //   _controller = VideoPlayerController.network(
  //       "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
  //   //_controller = VideoPlayerController.asset("videos/sample_video.mp4");
  //   _initializeVideoPlayerFuture = _controller.initialize();
  //   _controller.setLooping(true);
  //   _controller.setVolume(1.0);
  //   super.initState();
  // }

  void _initController(String link) {
    _controller = VideoPlayerController.network(link);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      scrollDirection: Axis.horizontal,
      // physics: NeverScrollableScrollPhysics(),
      // shrinkWrap: true,
      itemCount: widget.thumbnail.length,
      padding: width < 400
          ? EdgeInsets.only(right: 2, left: 5)
          : EdgeInsets.only(right: 10.0, left: 5.5),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, right: 3),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        insetPadding: EdgeInsets.only(left: 3, right: 2),
                        backgroundColor: Colors.black,
                        actions: [
                          Stack(
                            overflow: Overflow.visible,
                            children: [
                              Positioned(
                                child: MaterialButton(
                                  height: 25,
                                  color: Colors.red,
                                  shape: CircleBorder(),
                                  child: Icon(
                                    Icons.close,
                                    size: 14,
                                  ),
                                  onPressed: () {
                                    if (_controller == null) {
                                    } else {
                                      if (_controller.value.isPlaying ||
                                          _controller.value.isBuffering ||
                                          _controller.value.isLooping) {
                                        _controller.pause();
                                      }
                                    }
                                    // setState(() {
                                    //   _controller = null;
                                    // });

                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 1000,
                            height: 250,
                            child: FutureBuilder(
                              future: _initializeVideoPlayerFuture,
                              builder: (context, snapshot) {
                                if (_controller == null) {
                                  // If there was no controller, just create a new one
                                  _initController(widget.videoUrl[index]);
                                } else {
                                  final oldController = _controller;

                                  // Registering a callback for the end of next frame
                                  // to dispose of an old controller
                                  // (which won't be used anymore after calling setState)
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) async {
                                    await oldController.dispose();

                                    // Initing new controller
                                    // _initController(
                                    //     'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
                                  });

                                  // Making sure that controller is not used by setting it to null

                                  setState(() {
                                    _controller = null;
                                  });
                                }
                                return AspectRatio(
                                  aspectRatio: _controller.value.aspectRatio,
                                  child: Chewie(
                                    // key: new PageStorageKey(widget.url),
                                    controller: ChewieController(
                                      allowFullScreen: true,
                                      allowPlaybackSpeedChanging: false,
                                      videoPlayerController: _controller,
                                      aspectRatio: 3 / 2,
                                      // Prepare the video to be played and display the first frame
                                      autoInitialize: true,
                                      looping: false,
                                      autoPlay: false,
                                      // Errors can occur for example when trying to play a video
                                      // from a non-existent URL
                                      errorBuilder: (context, errorMessage) {
                                        return Center(
                                          child: Text(
                                            errorMessage,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Card(
                  elevation: 0,
                  child: Wrap(children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, right: 18, bottom: 2, top: 5),
                      child: Image.network(
                        widget.thumbnail[index],
                        fit: BoxFit.contain,
                        height: width < 400 ? 170 : 220,
                        // width: imgwidth,
                      ),
                    ),
                  ]),
                ),
              ),
              color: Colors.white12,
            ),
            Padding(
              padding: width < 400
                  ? EdgeInsets.only(top: 5, right: 5, left: 20)
                  : EdgeInsets.only(top: 6, right: 5, left: 20),
              child: SizedBox(
                width: 150.0,
                child: Text(
                  widget.videoTitle[index],
                  style: TextStyle(
                      fontFamily: 'RMNUEUSEMIBOLD',
                      fontSize: width < 400 ? 13 : 16,
                      fontWeight: FontWeight.bold),
                  // textAlign: TextAlign.center,
                  // overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
            Padding(
              padding: width < 400
                  ? EdgeInsets.only(right: 5, left: 20)
                  : EdgeInsets.only(right: 5, left: 20),
              child: SizedBox(
                width: 150.0,
                child: Text(
                  widget.date[index],
                  style: TextStyle(
                    fontFamily: 'RMNUEUSEMIBOLD',
                    fontSize: width < 400 ? 11 : 14,
                    color: Colors.grey,
                  ),
                  // textAlign: TextAlign.center,
                  // overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        );
      },
    );
  }
}
