import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'bottomNav.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTime() async {
    return Timer(Duration(milliseconds: 4500), _navigatorPage);
  }

  void _navigatorPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return BottomNav();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
    //for navigate to home page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 300),
            Center(
              child: Image.asset(
                "assets/images/home3.png",
                fit: BoxFit.cover,
                width: 200.0,
              ),
            ),
            SizedBox(height: 50.0),
            Text(
              "Where Style meets fashion",
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 80.0),
          ],
        ),
      ),
    );
  }
}
