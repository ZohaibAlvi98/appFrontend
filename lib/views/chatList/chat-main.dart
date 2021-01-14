import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  List user = [
    'Manager',
    'Volunteer',
    'Designer',
    'Person 1',
    'Person 2',
    'Person 3',
    'Person 4',
    'Person 5'
  ];
  List msg = [
    'Hello!',
    'Available ??',
    'How are you?',
    'Thank you.',
    'Have a great day.. :)',
    'Yo',
    'I need a favor.',
    'Hiii'
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        print('hello');
      },
      child: Container(
          color: Colors.white38,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              // physics: NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              itemCount: user.length,
              padding: EdgeInsets.only(right: 20.0, left: 5.5),
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 8.0),
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage(
                                'assets/images/chatList/default.jpg'),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Stack(
                            children: [
                              Text(
                                user[index],
                                style: TextStyle(
                                    fontSize: width < 400 ? 13 : 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 25),
                                child: Text(
                                  msg[index],
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.w600,
                                      fontSize: width < 400 ? 12 : 15),
                                ),
                              ),
                              Padding(
                                padding: width < 400
                                    ? EdgeInsets.only(left: 200)
                                    : EdgeInsets.only(left: 240),
                                child: Text(
                                  'Yesterday',
                                  style: TextStyle(
                                      fontSize: width < 400 ? 10 : 13),
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                      new Divider(
                        color: Colors.grey[500],
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}
