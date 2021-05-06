import 'package:flutter/material.dart';
import 'package:splyxp/widgets/innerAppBar.dart';
import 'package:splyxp/widgets/navbar.dart';
import 'package:splyxp/views/search/search.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import 'package:splyxp/views/sply-network.dart';
import 'package:splyxp/views/auth/signup/signup.dart';
import 'package:splyxp/services/tv/getshowsdetail.dart';
import 'package:splyxp/services/tv/getepisodeslist.dart';
import 'package:splyxp/services/tv/getepisodedetail.dart';
import 'package:splyxp/widgets/lineHeading.dart';
import 'package:splyxp/widgets/videoList.dart';

TVEpisodeDetail episodeDetail = TVEpisodeDetail();
TVshowEpisodes showEpisodes = TVshowEpisodes();
TVshowContent showContent = TVshowContent();

class TvShowsDetail extends StatefulWidget {
  final String prodId;
  TvShowsDetail({Key key, @required this.prodId}) : super(key: key);
  @override
  _TvShowsDetailState createState() => _TvShowsDetailState();
}

class _TvShowsDetailState extends State<TvShowsDetail> {
  int index = 0;
  int _selectedIndex = 0;
  List episodesId = [];
  void _onItemTapped(int index) {
    if (_selectedIndex == 0 && index == 0) {
      Navigator.of(context).pop();
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _bottomNavList = [
    TvShowsDetail(
      prodId: null,
    ),
    Search(),
    ChatList(),
    SplyNetwork(),
    Signup()
  ];

  Future<List<Map<String, dynamic>>> getEpisodesData(ids) async {
    var episodes = <Map<String, dynamic>>[];
    for (var a = 0; a < ids.length; a++) {
      List<Map<String, dynamic>> episodeData =
          await episodeDetail.getTVContent(ids[a]);
      episodes.add({
        'video': episodeData[0]['episode_video'],
        'date': episodeData[0]['episode_date'],
        'thumbnail': episodeData[0]['image'],
        'title': episodeData[0]['title']
      });
    }
    return episodes;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) return true;
        setState(() {
          _selectedIndex = 0;
        });
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appbarWithMenu(context),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor:
                Colors.black, //This will change the drawer background to blue.
            //other styles
          ),
          child: drawerAppBar(context, '', false),
        ),
        body: _selectedIndex == 0
            ? FutureBuilder(
                future: showContent.getTVContent(widget.prodId),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    final item = snapshot.data;
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  width: width * 0.10,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image:
                                          NetworkImage(item[0]['author_logo']),
                                    ),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: .7),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: width < 400
                                            ? EdgeInsets.only(right: 51.5)
                                            : EdgeInsets.only(right: 63.0),
                                        child: Text(
                                          item[0]['author'],
                                          style: TextStyle(
                                              fontSize: width < 400 ? 21 : 25,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 0.0),
                                        child: Text(
                                          item[0]['date'],
                                          style: TextStyle(
                                              fontSize: width < 400 ? 11 : 14),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 10, bottom: 15),
                            child: Text(
                              item[0]['title'],
                              style: TextStyle(
                                  fontSize: 30,
                                  // fontWeight: FontWeight.w600,
                                  fontFamily: 'RMNUEU'),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(right: 14, left: 14, top: 10),
                            child: Image.network(
                              item[0]['image_gif'],
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(right: 14, left: 14, top: 15),
                            child: Text(
                              item[0]['content'],
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  height: 1.5),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Heading(context, 'Episodes'),
                          SizedBox(
                            height: 35,
                          ),
                          FutureBuilder(
                            future: showEpisodes
                                .getTVContent(item[0]['post_id'].toString()),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<Map<String, dynamic>>>
                                    snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else {
                                final item = snapshot.data;
                                for (var a = 0; a < item.length; a++) {
                                  episodesId.add(item[a]['post_id']);
                                }
                                return FutureBuilder(
                                  future: getEpisodesData(episodesId),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<List<Map<String, dynamic>>>
                                          snapshot) {
                                    if (!snapshot.hasData) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    } else {
                                      final item = snapshot.data;
                                      List thumbs = [];
                                      List videoUrls = [];
                                      List videoTitles = [];
                                      List date = [];
                                      for (var a = 0; a < item.length; a++) {
                                        thumbs.add(item[a]['thumbnail']);
                                      }
                                      for (var a = 0; a < item.length; a++) {
                                        videoUrls.add(item[a]['video']);
                                      }
                                      for (var a = 0; a < item.length; a++) {
                                        videoTitles.add(item[a]['title']);
                                      }
                                      for (var a = 0; a < item.length; a++) {
                                        date.add(item[a]['date']);
                                      }
                                      return SizedBox(
                                        height: 270,
                                        child: VideoListHorizontal(
                                          thumbnail: thumbs,
                                          videoUrl: videoUrls,
                                          videoTitle: videoTitles,
                                          date: date,
                                        ),
                                      );
                                    }
                                  },
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
              )
            : _bottomNavList.elementAt(_selectedIndex),
        bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
      ),
    );
  }
}
