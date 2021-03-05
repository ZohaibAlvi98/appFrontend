import 'package:flutter/material.dart';
import '../../widgets/innerAppBar.dart';
import 'package:splyxp/widgets/navbar.dart';

import '../search/search.dart';
import '../../views/profile.dart';
import '../../views/sply-network.dart';
import 'package:splyxp/views/chatList/chat-main.dart';

class MenWoman extends StatefulWidget {
  @override
  _MenWomanState createState() => _MenWomanState();
}

class _MenWomanState extends State<MenWoman> {
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
    MenWoman(),
    Search(),
    ChatList(),
    SplyNetwork(),
    Profile()
  ];

  List<Widget> containers = [
    SizedBox(
      height: 300,
      child: GridView.builder(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(left: 5, right: 5, top: 0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 2.17,
          ),
          // scrollDirection: Axis.vertical,
          itemCount: 6,
          itemBuilder: (context, index) {
            return list(context, 'men', index);
          }),
    ),
    SizedBox(
      height: 300,
      child: GridView.builder(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(left: 5, right: 5, top: 0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 2.17,
          ),
          // scrollDirection: Axis.vertical,
          itemCount: 6,
          itemBuilder: (context, index) {
            return list(context, 'woman', index);
          }),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: drawerInnerAppbar(context, 'category'),
        body: _selectedIndex == 0
            ? TabBarView(children: containers)
            : _bottomNavList.elementAt(_selectedIndex),
        bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
      ),
    );
  }
}

Widget list(context, check, index) {
  List img1 = [
    'assets/images/splyrs/channels/prod1.jpg',
    'assets/images/splyrs/channels/prod2.jpg',
    'assets/images/splyrs/channels/prod3.jpg',
    'assets/images/splyrs/channels/prod4.jpg',
    'assets/images/splyrs/channels/prod5.jpg',
    'assets/images/splyrs/channels/prod6.jpg'
  ];

  List img2 = [
    'assets/images/splyrs/channels/prod4.jpg',
    'assets/images/splyrs/channels/prod5.jpg',
    'assets/images/splyrs/channels/prod6.jpg',
    'assets/images/splyrs/channels/prod1.jpg',
    'assets/images/splyrs/channels/prod2.jpg',
    'assets/images/splyrs/channels/prod3.jpg',
  ];
  return Column(
    children: [
      Padding(
          padding: index != 0 && index != 1
              ? EdgeInsets.only(left: 7.0, right: 7, top: 8)
              : EdgeInsets.only(left: 7.0, right: 7, top: 4),
          child: check == 'woman'
              ? Image.asset(
                  img1[index],
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  img2[index],
                  fit: BoxFit.cover,
                )),
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(top: 5, left: 10),
          child: Text(
            'S-PLY Supreme Jackets',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(top: 5, left: 10),
          child: Text(
            'Price \$290',
            style: TextStyle(
                fontSize: 15.5,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ],
  );
}
