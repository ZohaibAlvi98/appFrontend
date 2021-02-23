import 'package:flutter/material.dart';
import 'package:splyxp/views/cart/cart.dart';

void _navigatorPage(context) {
  // Navigator.of(context).pop(new PageRouteBuilder());
  Navigator.of(context).push(new PageRouteBuilder(
      opaque: true,
      transitionDuration: const Duration(),
      pageBuilder: (BuildContext context, _, __) {
        return Cart();
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
            _navigatorPage(context);
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
      IconButton(
          padding: EdgeInsets.only(right: 20, bottom: 10),
          icon: new Image.asset(
            'assets/images/bag.png',
            height: 30,
          ),
          onPressed: () {
            _navigatorPage(context);
          })
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
