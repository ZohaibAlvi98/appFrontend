import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoList extends StatefulWidget {
  final List thumbnail;
  final List videoUrl;
  VideoList({Key key, @required this.thumbnail, @required this.videoUrl})
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
      padding: EdgeInsets.only(right: 20.0, left: 5.5),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, right: 3),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          insetPadding: EdgeInsets.only(left: 8, right: 8),
                          backgroundColor: Colors.black,
                          content: Stack(
                            overflow: Overflow.visible,
                            children: <Widget>[
                              Positioned(
                                right: -30.0,
                                top: -40.0,
                                child: InkResponse(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: CircleAvatar(
                                    maxRadius: 15,
                                    child: Icon(
                                      Icons.close,
                                      size: 18,
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                              ),
                              Container(
                                width: 1000,
                                height: 300,
                                child: FutureBuilder(
                                  future: _initializeVideoPlayerFuture,
                                  builder: (context, snapshot) {
                                    if (_controller == null) {
                                      print('here');
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
                                      aspectRatio:
                                          _controller.value.aspectRatio,
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
                                          errorBuilder:
                                              (context, errorMessage) {
                                            return Center(
                                              child: Text(
                                                errorMessage,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        );
                      });
                },
                child: Card(
                  child: Wrap(children: [
                    Image.asset(
                      widget.thumbnail[index],
                      height: 110,
                      // width: imgwidth,
                    ),
                  ]),
                ),
              ),
              color: Colors.white12,
            ),
            Padding(
              padding: width < 400
                  ? EdgeInsets.only(right: 15.0)
                  : EdgeInsets.only(right: 18.0),
              child: Text(
                'S-PLY Store Items',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
            // Padding(
            //   padding: width < 400
            //       ? EdgeInsets.only(top: 7.0, bottom: 5, right: 15)
            //       : EdgeInsets.only(top: 7.0, bottom: 5, right: 18),
            //   child: Text(
            //     'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document.',
            //     style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w500),
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
