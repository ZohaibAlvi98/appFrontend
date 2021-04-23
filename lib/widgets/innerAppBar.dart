import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splyxp/views/cart/cart.dart';
import '../views/drawer/by-category.dart';
import '../views/drawer/men.dart';
import '../views/drawer/women.dart';
import '../views/drawer/arrivals.dart';
import '../views/requests/request-shopper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splyxp/views/home.dart';
import 'package:splyxp/views/s-plyrs/splyrs-main.dart';
import 'package:splyxp/views/styles/styles-main.dart';
import 'package:splyxp/views/sneakers/sneakers-main.dart';
import 'package:splyxp/views/tv/tv-main.dart';

void _navigatorPage(context, index, auth) {
  // Navigator.of(context).pop(new PageRouteBuilder());
  Navigator.of(context).push(new PageRouteBuilder(
      opaque: true,
      transitionDuration: const Duration(),
      pageBuilder: (BuildContext context, _, __) {
        if (index == 'cart') {
          return Cart();
        } else if (index == 'categories') {
          return ByCategory(authenticated: auth);
        } else if (index == 'men') {
          return Mens(authenticated: auth);
        } else if (index == 'women') {
          return Womens(authenticated: auth);
        } else if (index == 'new') {
          return Arrivals(authenticated: auth);
        } else if (index == 'request') {
          return RequestShopper();
        } else if (index == 'home') {
          return Home(authenticated: auth);
        } else if (index == 'shop') {
          return Splyrs(authenticated: auth);
        } else if (index == 'styles') {
          return Styles(authenticated: auth);
        } else if (index == 'sneakers') {
          return Sneakers(authenticated: auth);
        } else if (index == 'tv') {
          return Tv(authenticated: auth);
        } else {
          return null;
        }
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

Widget Appbar(context) {
  double height =
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

  return AppBar(
    actions: [
      IconButton(
          padding: EdgeInsets.only(right: 20, bottom: 10),
          icon: new Image.asset(
            'assets/images/bag.png',
            height: 30,
          ),
          onPressed: () {
            _navigatorPage(context, 'cart', '');
          })
    ],
    toolbarHeight: 60,
    elevation: 0,
    backgroundColor: Colors.white12,
    automaticallyImplyLeading: false,
    title: Padding(
      padding: const EdgeInsets.only(left: 1.0),
      child: Image.asset(
        'assets/images/home3.png',
        height: height * 40,
        width: 160,
      ),
    ),
  );
}

Widget appbarNew(context) {
  double width = MediaQuery.of(context).size.width;
  double height =
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

  return AppBar(
    leading: Builder(
      builder: (context) => IconButton(
        icon: Image.asset(
          'assets/images/home/burger-menu.png',
          height: height * 0.035,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    ),
    toolbarHeight: 60,
    elevation: 0,
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
  );
}

Widget appbarWithMenu(context) {
  double width = MediaQuery.of(context).size.width;
  double height =
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

  return AppBar(
    leading: Builder(
      builder: (context) => IconButton(
        padding: EdgeInsets.only(left: width * 0.025),
        icon: Image.asset(
          'assets/images/home/burger-menu.png',
          height: height * 0.035,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    ),
    actions: [
      IconButton(
          padding: EdgeInsets.only(right: 20, bottom: 10),
          icon: new Image.asset(
            'assets/images/bag.png',
            height: 30,
          ),
          onPressed: () {
            _navigatorPage(context, 'cart', '');
          })
    ],
    toolbarHeight: 60,
    elevation: 0,
    backgroundColor: Colors.white12,
    automaticallyImplyLeading: false,
    title: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 1.0),
        child: Image.asset(
          'assets/images/home3.png',
          height: height * 40,
          width: 160,
        ),
      ),
    ),
  );
}

Widget innerAppbar(context, list) {
  double height =
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

  return AppBar(
    actions: [
      list != 'SHOPPING BAG (4)' && list != 'REVIEW'
          ? IconButton(
              padding: EdgeInsets.only(right: 20, bottom: 10),
              icon: new Image.asset(
                'assets/images/bag.png',
                height: 30,
              ),
              onPressed: () {
                _navigatorPage(context, 'cart', '');
              })
          : SizedBox()
    ],
    toolbarHeight: list == 'categories' ? 100 : 60,
    elevation: 0,
    backgroundColor: Colors.white12,
    leading: Padding(
      padding: EdgeInsets.only(left: 15.0, top: 2),
      child: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
    ),
    title: list == 'categories'
        ? Text(
            'CATEGORIES',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontFamily: 'RMNUEU'),
          )
        : Text(
            list,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontFamily: 'RMNUEU'),
          ),
    bottom: list == 'categories'
        ? TabBar(
            indicatorColor: Colors.black54,
            tabs: [
              Tab(
                child: Text(
                  'Women',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  'Men',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          )
        : null,
  );
}

Widget drawerInnerAppbar(context, list) {
  double height =
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

  return AppBar(
    actions: [
      IconButton(
          padding: EdgeInsets.only(right: 20, bottom: 10),
          icon: new Image.asset(
            'assets/images/bag.png',
            height: 30,
          ),
          onPressed: () {
            _navigatorPage(context, 'cart', '');
          })
    ],
    elevation: 0,
    backgroundColor: Colors.white12,
    automaticallyImplyLeading: false,
    title: Padding(
      padding: const EdgeInsets.only(left: 1.0),
      child: Image.asset(
        'assets/images/home3.png',
        height: height * 40,
        width: 160,
      ),
    ),
    bottom: list == 'category'
        ? TabBar(
            indicatorColor: Colors.black54,
            tabs: [
              Tab(
                child: Text(
                  'Women',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  'Men',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          )
        : null,
  );
}

Widget dashboardDrawer(context, index) {
  return Drawer(
      child: Column(
    children: [
      Padding(
        padding: EdgeInsets.only(
            top: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top) *
                0.06),
        child: Center(
          child: Image.asset(
            'assets/images/drawerImg.jpg',
            height: 35,
          ),
        ),
      ),
      ListView(
          shrinkWrap: true,
          children: ListTile.divideTiles(
              //          <-- ListTile.divideTiles
              context: context,
              color: Colors.white,
              tiles: [
                index != 'new'
                    ? InkWell(
                        onTap: () {
                          _navigatorPage(context, 'new', '');
                        },
                        child: ListTile(
                          title: Text('NEW ADDITION',
                              style: TextStyle(color: Colors.white)),
                        ),
                      )
                    : null,
                index != 'category'
                    ? InkWell(
                        onTap: () {
                          _navigatorPage(context, 'categories', '');
                        },
                        child: ListTile(
                          title: Text('CATEGORIES',
                              style: TextStyle(color: Colors.white)),
                        ),
                      )
                    : null,
                index != 'men&women'
                    ? InkWell(
                        onTap: () {
                          _navigatorPage(context, 'men', '');
                        },
                        child: ListTile(
                          title: Text('MEN',
                              style: TextStyle(color: Colors.white)),
                        ),
                      )
                    : null,
                index != 'men&women'
                    ? InkWell(
                        onTap: () {
                          _navigatorPage(context, 'women', '');
                        },
                        child: ListTile(
                          title: Text('WOMAN',
                              style: TextStyle(color: Colors.white)),
                        ),
                      )
                    : null,
                InkWell(
                  onTap: () {
                    _navigatorPage(context, 'request', '');
                  },
                  child: ListTile(
                    title: Text('REQUEST TO I-SHOPPER',
                        style: TextStyle(color: Colors.white)),
                  ),
                )
              ]).toList()),
    ],
  ));
}

Widget drawerAppBar(context, index, authenticated) {
  return Drawer(
      child: Container(
    padding: EdgeInsets.only(top: 30.0, left: 15.0),
    color: Colors.white,
    child: ListView(
        shrinkWrap: true,
        children: ListTile.divideTiles(
            //          <-- ListTile.divideTiles
            context: context,
            color: Colors.white,
            tiles: [
              // index != 'home'
              //     ? InkWell(
              //         onTap: () {
              //           _navigatorPage(context, 'home', authenticated);
              //         },
              //         child: DrawerTile(
              //           drawerIcon: FontAwesomeIcons.home,
              //           drawerName: 'Home',
              //         ),
              //       )
              //     : null,
              index != 'shop'
                  ? InkWell(
                      onTap: () {
                        _navigatorPage(context, 'shop', authenticated);
                      },
                      child: DrawerTile(
                        drawerImage: 'assets/images/shop-nav-icon.png',
                        drawerName: 'Shop',
                      ),
                    )
                  : null,
              index != 'styles'
                  ? InkWell(
                      onTap: () {
                        _navigatorPage(context, 'styles', authenticated);
                      },
                      child: DrawerTile(
                        drawerImage: 'assets/images/styles-nav-icon.png',
                        drawerName: 'Styles',
                      ),
                    )
                  : null,
              // index != 'tv'
              //     ? InkWell(
              //         onTap: () {
              //           _navigatorPage(context, 'tv', authenticated);
              //         },
              //         child: DrawerTile(
              //           drawerIcon: FontAwesomeIcons.tv,
              //           drawerName: 'TV',
              //         ),
              //       )
              //     : null,
              index != 'sneakers'
                  ? InkWell(
                      onTap: () {
                        _navigatorPage(context, 'sneakers', authenticated);
                      },
                      child: DrawerTile(
                        drawerImage: 'assets/images/sneakers-nav-icon.png',
                        drawerName: 'Sneakers',
                      ),
                    )
                  : null,
              index != 'new'
                  ? InkWell(
                      onTap: () {
                        _navigatorPage(context, 'new', authenticated);
                      },
                      child: DrawerTile(
                        drawerImage: 'assets/images/new-arrival-nav-icon.png',
                        drawerName: 'New Addition',
                      ),
                    )
                  : null,
              // index != 'category'
              //     ? InkWell(
              //         onTap: () {
              //           _navigatorPage(context, 'categories', authenticated);
              //         },
              //         child: DrawerTile(
              //           drawerIcon: FontAwesomeIcons.buffer,
              //           drawerName: 'Categories',
              //         ),
              //       )
              //     : null,
              // index != 'mens'
              //     ? InkWell(
              //         onTap: () {
              //           _navigatorPage(context, 'men', authenticated);
              //         },
              //         child: DrawerTile(
              //           drawerIcon: FontAwesomeIcons.male,
              //           drawerName: 'Men',
              //         ),
              //       )
              //     : null,
              // index != 'womens'
              //     ? InkWell(
              //         onTap: () {
              //           _navigatorPage(context, 'women', authenticated);
              //         },
              //         child: DrawerTile(
              //           drawerIcon: FontAwesomeIcons.female,
              //           drawerName: 'Women',
              //         ),
              //       )
              //     : null,
              // InkWell(
              //   onTap: () {
              //     _navigatorPage(context, 'request', '');
              //   },
              //   child: DrawerTile(
              //     drawerIcon: FontAwesomeIcons.edit,
              //     drawerName: 'Request to i-Shopper',
              //   ),
              // )
            ]).toList()),
  ));
}

class DrawerTile extends StatelessWidget {
  final String drawerName;
  final String drawerImage;

  DrawerTile({this.drawerName, this.drawerImage});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(drawerImage),
        backgroundColor: Colors.transparent,
        radius: 20.0,
      ),
      title: Padding(
        padding: EdgeInsets.only(top: 9.0),
        child: Text(drawerName,
            style: TextStyle(
              fontFamily: 'RMNUEUREGULAR',
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            )),
      ),
    );
  }
}

Widget appbarWithMenuNew(context) {
  double width = MediaQuery.of(context).size.width;
  double height =
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

  return AppBar(
    leading: Builder(
      builder: (context) => IconButton(
        icon: new Icon(
          Icons.menu,
          color: Colors.black,
          size: width * 0.11,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    ),
    actions: [
      IconButton(
          padding: EdgeInsets.only(right: 20, bottom: 10),
          icon: new Image.asset(
            'assets/images/bag.png',
            height: 30,
          ),
          onPressed: () {
            _navigatorPage(context, 'cart', '');
          })
    ],
    toolbarHeight: 60,
    elevation: 0,
    backgroundColor: Colors.white12,
    automaticallyImplyLeading: false,
    title: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 1.0),
        child: Image.asset(
          'assets/images/home3.png',
          height: height * 40,
          width: 160,
        ),
      ),
    ),
  );
}
