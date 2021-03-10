import 'package:flutter/material.dart';
import '../../widgets/innerAppBar.dart';
import 'package:splyxp/widgets/navbar.dart';

import '../search/search.dart';
import '../../views/profile.dart';
import '../../views/sply-network.dart';
import 'package:splyxp/views/chatList/chat-main.dart';

class MenWoman extends StatefulWidget {
  final String page;

  MenWoman({Key key, @required this.page}) : super(key: key);
  @override
  _MenWomanState createState() => _MenWomanState();
}

class _MenWomanState extends State<MenWoman> {
  int index = 0;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    print(index);

    if (index == 0 && _selectedIndex == 0) {
      Navigator.of(context).pop();
    }
    setState(() {
      _selectedIndex = index;
    });
    print(_selectedIndex);
  }

  static String checkPage;

  @override
  void initState() {
    super.initState();
    checkPage = widget.page;
  }

  static List<Widget> _bottomNavList = [
    MenWoman(page: checkPage),
    Search(),
    ChatList(),
    SplyNetwork(),
    Profile()
  ];

  List<Widget> containers = [
    SizedBox(
      height: 300,
      child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          scrollDirection: Axis.vertical,
          itemCount: 1,
          itemBuilder: (context, snapshot) {
            double width = MediaQuery.of(context).size.width;
            return GridView.builder(
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
                  return lists(context, 'men', index);
                });
          }),
    ),
    SizedBox(
      height: 300,
      child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          scrollDirection: Axis.vertical,
          itemCount: 1,
          itemBuilder: (context, snapshot) {
            double width = MediaQuery.of(context).size.width;
            return GridView.builder(
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
                });
          }),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return _selectedIndex == 0
        ? DefaultTabController(
            initialIndex: checkPage == 'men' ? 1 : 0,
            length: 2,
            child: WillPopScope(
              onWillPop: () async {
                if (_selectedIndex == 0) return true;
                setState(() {
                  _selectedIndex = 0;
                });
                return false;
              },
              child: Scaffold(
                appBar: drawerInnerAppbar(context, 'category'),
                body: TabBarView(children: containers),
                bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
              ),
            ),
          )
        : WillPopScope(
            onWillPop: () async {
              if (_selectedIndex == 0) return true;
              setState(() {
                _selectedIndex = 0;
              });
              return false;
            },
            child: Scaffold(
              appBar: drawerInnerAppbar(context, ''),
              body: _bottomNavList.elementAt(_selectedIndex),
              bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
            ),
          );
  }
}

Widget lists(context, check, index) {
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
