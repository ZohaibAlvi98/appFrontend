import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import './s-plyrs/splyrs-main.dart';
import './sneakers/sneakers-main.dart';
import './styles/styles-main.dart';
import './tv/tv-main.dart';
import '../widgets/innerAppBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../dashboard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = -1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _navigatorPage();
    });
  }

  Future<bool> getAuth() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool name = _prefs.getBool("auth");
    return name;
  }

  bool authenticated;

  @override
  void initState() {
    getAuth().then((bool val) => {
          // print(val),
          setState(() {
            this.authenticated = val;
          })
        });
    super.initState();
  }

  void _navigatorPage() {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
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

  // static List<Widget> _cardSelected = [Splyrs(), Styles(), Tv(), Sneakers()];

  @override
  Widget build(BuildContext context) {
    List img = [
      'assets/images/home/home4.png',
      'assets/images/home/home1.png',
      'assets/images/home/home5.png',
      'assets/images/home/home2.png'
    ];
    return authenticated == null
        ? Scaffold(
            body: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () => _onItemTapped(index),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    children: <Widget>[
                      Image.asset(img[index]),
                    ],
                  ),
                ),
              ),
              padding: EdgeInsets.only(top: 5),
              staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
            ),
          )
        : Dashboard();
  }
}
