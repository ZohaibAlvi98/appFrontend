import 'package:flutter/material.dart';
import 'package:splyxp/services/home-api.dart';
import 'package:splyxp/views/home.dart';

HomeContent homedata = HomeContent();

class GetHomeData extends StatefulWidget {
  final bool authenticated;
  GetHomeData({Key key, this.authenticated}) : super(key: key);
  @override
  _GetHomeDataState createState() => _GetHomeDataState();
}

class _GetHomeDataState extends State<GetHomeData> {
  getData() async {
    List<Map<String, dynamic>> data = await homedata.getHomeContent();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return Home(
          data: data,
          authenticated: widget.authenticated,
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
