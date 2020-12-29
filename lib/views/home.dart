import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import './s-plyrs/splyrs-main.dart';
import './sneakers/sneakers-main.dart';
import './styles/styles-main.dart';
import './tv/tv-main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = -1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            if (_selectedIndex == 0) {
              return Splyrs();
            } else if (_selectedIndex == 1) {
              return Styles();
            } else if (_selectedIndex == 2) {
              return Tv();
            } else if (_selectedIndex == 3) {
              return Sneakers();
            }
          },
        ),
      );
    });
  }

  void _navigatorPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          if (_selectedIndex == 0) {
            return Splyrs();
          } else if (_selectedIndex == 1) {
            return Styles();
          } else if (_selectedIndex == 2) {
            return Tv();
          } else if (_selectedIndex == 3) {
            return Sneakers();
          }
        },
      ),
    );
  }

  static List<Widget> _cardSelected = [Splyrs(), Styles(), Tv(), Sneakers()];

  @override
  Widget build(BuildContext context) {
    // final appBar = AppBar(
    //   backgroundColor: Colors.white,
    //   title: Center(
    //     child: Text(
    //       'S-PLY XP',
    //       style: TextStyle(
    //           color: Colors.black, fontSize: 28, fontWeight: FontWeight.w700),
    //     ),
    //   ),
    // );
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double width = MediaQuery.of(context).size.width;
    List img = [
      'assets/images/home4.png',
      'assets/images/home1.png',
      'assets/images/home5.png',
      'assets/images/home2.png'
    ];
    return Scaffold(
        body: Stack(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 45),
            child: Image.asset(
              'assets/images/home3.png',
              height: 40,
            ),
          ),
        ],
      ),
      StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () => _onItemTapped(index),
          child: Card(
            child: Column(
              children: <Widget>[
                Image.asset(img[index]),
              ],
            ),
          ),
        ),
        padding: EdgeInsets.only(top: 100),
        staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
      ),
    ]));
  }
}
