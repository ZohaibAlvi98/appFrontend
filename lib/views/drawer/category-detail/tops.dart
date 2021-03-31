import 'package:flutter/material.dart';
import 'package:splyxp/widgets/innerAppBar.dart';
import 'package:splyxp/views/drawer/men&women.dart';

import 'package:splyxp/widgets/navbar.dart';

import '../../search/search.dart';
import '../../profile.dart';
import '../../sply-network.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import '../../auth/signup/signup.dart';

class Tops extends StatefulWidget {
  @override
  _TopsState createState() => _TopsState();
}

class _TopsState extends State<Tops> {
  int index = 0;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    if (index == 0 && _selectedIndex == 0) {
      Navigator.of(context).pop();
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _bottomNavList = [
    Tops(),
    Search(),
    ChatList(),
    SplyNetwork(),
    Signup()
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: innerAppbar(context, 'TOPS'),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(left: 5, right: 5, top: 0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: width < 400
                        ? MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.49)
                        : MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.45),
                  ),
                  // scrollDirection: Axis.vertical,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return lists(context, 'woman', index);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
