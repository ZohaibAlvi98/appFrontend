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
    'ABC Shop Owner',
    'Stylist',
    'Person 1',
    'Person 2',
    'Person 3'
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
  List chatDp = [
    'assets/images/chatList/chat7.jpg',
    'assets/images/chatList/chat5.jpg',
    'assets/images/chatList/chat6.png',
    'assets/images/chatList/chat9.jpg',
    'assets/images/chatList/chat10.jpg',
    'assets/images/chatList/chat4.jpg',
    'assets/images/chatList/chat8.jpg',
    'assets/images/chatList/chat5.jpg'
  ];

  refresh() {
    setState(() {
//all the reload processes
    });
  }

  void _navigatorPage(user, chatDp, index) {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          if (index == 3806210) {
            return ChatDetail(
              user: 'Manager',
              userId: 3806210,
              chatDp: 'assets/images/chatList/chat7.jpg',
              refresh: refresh,
            );
          } else {
            return ChatDetail(
              user: 'Volunteer',
              userId: 3806880,
              chatDp: 'assets/images/chatList/chat5.jpg',
              refresh: refresh,
            );
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

  Future<PagedResult<CubeDialog>> lastMessage() async {
    PagedResult<CubeDialog> result;
    result = await getDialogs();
    return result;
  }

  bool authenticated;
  bool isReady = false;
  bool done = false;
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
        setState(() {
          this.isReady = true;
        });
        CubeChatConnection.instance.login(aUser).then((loggedUser) {
          print('here2');
          print(loggedUser);
          setState(() {
            this.isReady = true;
          });

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
                      getPass()
                          .then((String pass) => {
                                print('here karak be'),
                                if (pass != null)
                                  {
                                    setState(() {
                                      this.id = id;
                                      this.login = log;
                                      this.pass = pass;
                                      this.authenticated = val;
                                    })
                                  }
                                else
                                  {
                                    print('here'),
                                    setState(() {
                                      this.authenticated = false;
                                    })
                                  }
                              })
                          .then((value) => {
                                setState(() {
                                  this.done = true;
                                }),
                                if (authenticated == true)
                                  {chat(), lastMessage()}
                              })
                    })
              }) // print(val),
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(authenticated);
    double width = MediaQuery.of(context).size.width;
    return authenticated == true && isReady && done
        ? FutureBuilder(
            future: lastMessage(),
            builder:
                (context, AsyncSnapshot<PagedResult<CubeDialog>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    // physics: NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    itemCount: snapshot.data.items.length,
                    padding: EdgeInsets.only(right: 20.0, left: 5.5),
                    itemBuilder: (context, index) {
                      final lstMsg = snapshot.data.items[index].lastMessage;
                      final id = snapshot.data.items[index].occupantsIds[0];
                      final time =
                          snapshot.data.items[index].lastMessageDateSent;
                      return InkWell(
                        onTap: () {
                          _navigatorPage(user[index], chatDp[index], id);
                        },
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 9, left: 8.0, bottom: 9),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 3,
                                            color: Colors.grey[500],
                                            spreadRadius: 1.3)
                                      ],
                                    ),
                                    child: CircleAvatar(
                                      radius: 32,
                                      backgroundImage: AssetImage(id == 3806210
                                          ? 'assets/images/chatList/chat7.jpg'
                                          : 'assets/images/chatList/chat5.jpg'),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15, top: 2),
                                  child: Stack(
                                    children: [
                                      Text(
                                        id == 3806210 ? 'Manager' : 'Volunteer',
                                        style: TextStyle(
                                            fontSize: width < 400 ? 14 : 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 26.5),
                                        child: Text(
                                          lstMsg,
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontWeight: FontWeight.w600,
                                              fontSize: width < 400 ? 12 : 15),
                                        ),
                                      ),
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
                    });
              }

              return Center(child: CircularProgressIndicator());
            },
          )
        : authenticated == false
            ? Signup()
            : Center(child: CircularProgressIndicator());
  }
}
