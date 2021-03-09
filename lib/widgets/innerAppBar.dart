import 'package:flutter/material.dart';
import 'package:splyxp/views/cart/cart.dart';
import '../views/drawer/by-category.dart';
import '../views/drawer/men&women.dart';
import '../views/drawer/arrivals.dart';

void _navigatorPage(context, index) {
  // Navigator.of(context).pop(new PageRouteBuilder());
  Navigator.of(context).push(new PageRouteBuilder(
      opaque: true,
      transitionDuration: const Duration(),
      pageBuilder: (BuildContext context, _, __) {
        if (index == 'cart') {
          return Cart();
        } else if (index == 'categories') {
          return ByCategory();
        } else if (index == 'men') {
          return MenWoman(
            page: 'men',
          );
        } else if (index == 'women') {
          return MenWoman(
            page: 'women',
          );
        } else if (index == 'new') {
          return Arrivals();
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
            _navigatorPage(context, 'cart');
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

Widget innerAppbar(context, list) {
  double height =
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

  return AppBar(
    actions: [
      list != 'SHOPPING BAG (4)'
          ? IconButton(
              padding: EdgeInsets.only(right: 20, bottom: 10),
              icon: new Image.asset(
                'assets/images/bag.png',
                height: 30,
              ),
              onPressed: () {
                _navigatorPage(context, 'cart');
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
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
          )
        : Text(
            list,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
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
            _navigatorPage(context, 'cart');
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

Widget drawerAppBar(context) {
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
                InkWell(
                  onTap: () {
                    _navigatorPage(context, 'new');
                  },
                  child: ListTile(
                    title: Text('NEW ADDITION',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _navigatorPage(context, 'categories');
                  },
                  child: ListTile(
                    title: Text('CATEGORIES',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _navigatorPage(context, 'men');
                  },
                  child: ListTile(
                    title: Text('MEN', style: TextStyle(color: Colors.white)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _navigatorPage(context, 'women');
                  },
                  child: ListTile(
                    title: Text('WOMAN', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ]).toList()),
    ],
  ));
}
