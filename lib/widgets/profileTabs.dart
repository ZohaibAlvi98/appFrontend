import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';

class ProfileTabBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  // final ValueChanged<int> onTap;
  final Function _onTapped;
  ProfileTabBar(
    this.height,
    this._onTapped,
  );

  @override
  _ProfileTabBarState createState() => _ProfileTabBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _ProfileTabBarState extends State<ProfileTabBar> {
  bool isPost = true;
  bool isStyle = false;
  bool isTv = false;
  bool isRss = false;

  final Color _selectedColor = Colors.black;
  final Color _unSelectedColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: widget.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
              child: Container(
                color: Colors.white12,
                width: _screenWidth / 4,
                height: widget.height,
                child: Stack(
                  children: <Widget>[
                    Align(
                      child: Icon(
                        Icons.grid_on_rounded,
                        color: isPost ? _selectedColor : _unSelectedColor,
                      ),
                    ),
                    isPost
                        ? Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 2,
                              color: Colors.black,
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
              onTap: () {
                if (!isPost) {
                  setState(() {
                    setFlags(tabName: 'post');
                    widget._onTapped(0);
                  });
                }
              }),
          GestureDetector(
            child: Container(
              color: Colors.white12,
              width: _screenWidth / 4,
              height: widget.height,
              child: Stack(
                children: <Widget>[
                  Align(
                    child: Icon(
                      Icons.style_outlined,
                      color: isStyle ? _selectedColor : _unSelectedColor,
                    ),
                  ),
                  isStyle
                      ? Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 2,
                            color: Colors.black,
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
            onTap: () {
              if (!isStyle) {
                setState(() {
                  setFlags(tabName: 'style');
                  widget._onTapped(1);
                });
              }
            },
          ),
          GestureDetector(
            child: Container(
              color: Colors.white12,
              width: _screenWidth / 4,
              height: widget.height,
              child: Stack(
                children: <Widget>[
                  Align(
                    child: Icon(
                      Icons.ondemand_video_sharp,
                      color: isTv ? _selectedColor : _unSelectedColor,
                    ),
                  ),
                  isTv
                      ? Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 2,
                            color: Colors.black,
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
            onTap: () {
              if (!isTv) {
                setState(() {
                  setFlags(tabName: 'tv');
                  widget._onTapped(2);
                });
              }
            },
          ),
          GestureDetector(
            child: Container(
              color: Colors.white12,
              width: _screenWidth / 4,
              height: widget.height,
              child: Stack(
                children: <Widget>[
                  Align(
                    child: Icon(
                      Icons.sticky_note_2_outlined,
                      color: isRss ? _selectedColor : _unSelectedColor,
                    ),
                  ),
                  isRss
                      ? Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 2,
                            color: Colors.black,
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
            onTap: () {
              if (!isRss) {
                setState(() {
                  setFlags(tabName: 'rss');
                  widget._onTapped(3);
                });
              }
            },
          ),
        ],
      ),
    );
  }

  setFlags({String tabName}) {
    switch (tabName) {
      case 'post':
        isTv = false;
        isStyle = false;
        isRss = false;
        isPost = true;
        break;
      case 'style':
        isStyle = true;
        isTv = false;
        isRss = false;
        isPost = false;
        break;
      case 'tv':
        isTv = true;
        isStyle = false;
        isRss = false;
        isPost = false;
        break;

      case 'rss':
        isStyle = false;
        isTv = false;
        isRss = true;
        isPost = false;
        break;
    }
  }
}
