import 'package:flutter/material.dart';
import 'package:splyxp/views/chatList/chat-detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/signup/signup.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';

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
  void _navigatorPage(user, index) {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          if (index % 2 == 0) {
            return ChatDetail(
              user: user,
              userId: 3806210,
            );
          } else {
            return ChatDetail(user: user, userId: 3806880);
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

  String login;
  String pass;
  int id;
  Future<String> getPass() async {
    SharedPreferences _prefs2 = await SharedPreferences.getInstance();

    String pass = _prefs2.getString("pass");

    return pass;
  }

  Future<String> getLogin() async {
    SharedPreferences _prefs2 = await SharedPreferences.getInstance();
    String login = _prefs2.getString("login");

    return login;
  }

  Future<bool> getAuth() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool name = _prefs.getBool("auth");

    return name;
  }

  Future<int> getId() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    int id = _prefs.getInt("id");

    return id;
  }

  bool authenticated;

  Future chat() {
    createSession().then((cubeSession) {
      CubeUser user = CubeUser(
        login: login,
        password: pass,
      );
// CubeUser user = CubeUser(email: "cubeuser@gmail.com", password: "super_sequre_password");
// 'marvi' supersecurepwd
      createSession(user).then((cubeSession) {
        CubeUser aUser = CubeUser(id: id, password: pass);

        CubeChatConnection.instance.login(aUser).then((loggedUser) {
          print('here2');
          print(loggedUser);
          // CubeDialog newDialog =
          //     CubeDialog(CubeDialogType.PRIVATE, occupantsIds: [3806210]);

          // createDialog(newDialog).then((createdDialog) {
          //   print('here');
          //   print(createdDialog);
          //   CubeDialog cubeDialog =
          //       newDialog; // some dialog, which must contains opponent's id in 'occupantsIds'
          //   CubeMessage message = CubeMessage();
          //   message.body = "karak";
          //   message.dateSent = DateTime.now().millisecondsSinceEpoch;
          //   message.markable = true;
          //   message.saveToHistory = true;
          //   print('yo');
          //   print(message);
          //   cubeDialog.occupantsIds = [3806210];
          //   print(cubeDialog);
          //   cubeDialog
          //       .sendMessage(message)
          //       .then((cubeMessage) {})
          //       .catchError((error) {});
          // }).catchError((error) {
          //   print(error);
          // });
        }).catchError((error) {
          print(error);
        });
      }).catchError((error) {
        print(error);
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  void initState() {
    getAuth().then((bool val) async => {
          getId().then((int id) => {
                getLogin().then((String log) => {
                      print(log),
                      getPass()
                          .then((String pass) => {
                                print(pass),
                                setState(() {
                                  this.id = id;
                                  this.login = log;
                                  this.pass = pass;
                                  this.authenticated = val;
                                })
                              })
                          .then((value) => {
                                if (authenticated == true) {chat()}
                              })
                    })
              }) // print(val),
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return authenticated == true
        ? ListView.builder(
            scrollDirection: Axis.vertical,
            // physics: NeverScrollableScrollPhysics(),
            // shrinkWrap: true,
            itemCount: user.length,
            padding: EdgeInsets.only(right: 20.0, left: 5.5),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  _navigatorPage(user[index], index);
                },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Padding(
                          padding: EdgeInsets.only(top: 7, left: 8.0),
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
                ),
              );
            })
        : Signup();
  }
}
