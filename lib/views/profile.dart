import 'package:flutter/material.dart';
import '../bottomNav.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List accHeading = ['Personal Info', 'Order Details'];
  List settingsHeading = ['Notifications'];
  List supportHeading = [
    'About',
    'Privacy Policy',
    'FAQ\'s',
    'Terms & Conditions'
  ];

  Future<bool> clear() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.clear();
    return _prefs.commit();
  }

  void _navigatorPage(context, index) {
    // Navigator.of(context).pop(new PageRouteBuilder());
    if (index == 'logout') {
      clear().then((bool value) async => {
            Navigator.of(context).pushReplacement(
                new MaterialPageRoute(builder: (BuildContext context) {
              return new BottomNav();
            }))
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 25),
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundImage:
                        AssetImage('assets/images/profile/profileDemo.png'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Center(
                  heightFactor: 2,
                  child: Text(
                    'Mar Simons',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'RMNUEU'),
                  ),
                ),
                Center(
                  heightFactor: 0.2,
                  child: Text(
                    'mar.simons15@gmail.com',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'RMNUEUREGULAR'),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              mainHeading('MY ACCOUNT', Icon(Icons.person_rounded)),
              list(width, accHeading, 2),
              mainHeading('SETTINGS', Icon(Icons.settings)),
              list(width, settingsHeading, 1),
              mainHeading('SUPPORT', Icon(Icons.people)),
              list(width, supportHeading, 4),
              InkWell(
                onTap: () {
                  _navigatorPage(context, 'logout');
                },
                child: mainHeading(
                    ' Log Out',
                    Transform.rotate(
                        angle: -12.54 / 4, child: Icon(Icons.logout))),
              ),
              SizedBox(
                height: 30,
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget mainHeading(text, Widget img) {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0, top: 18),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          img,
          //  Icon(Icons.person_rounded),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text,
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'RMNUEUSEMIBOLD')),
          ),
        ],
      ),
    ),
  );
}

Widget list(width, heading, length) {
  return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      // shrinkWrap: true,
      itemCount: length,
      padding: EdgeInsets.only(right: 0.0, left: 5, top: 12),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(5.0, .25, 5, 3),
          child: InkWell(
            onTap: () {
              // _navigatorPage(context, heading[index]);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Stack(
                      children: [
                        Text(
                          heading[index],
                          style: TextStyle(
                              fontSize: width < 400 ? 15 : 17,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'RMNUEUREGULAR'),
                        ),
                        Padding(
                          padding: width < 400
                              ? EdgeInsets.only(left: 280, top: 3)
                              : EdgeInsets.only(left: 325, top: 1.2),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  // child: new Divider(
                  //   color: Colors.grey[500],
                  // ),
                ),
              ],
            ),
          ),
        );
      });
}
