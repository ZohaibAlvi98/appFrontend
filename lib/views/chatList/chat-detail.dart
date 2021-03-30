import 'package:flutter/material.dart';
import 'package:splyxp/widgets/innerAppBar.dart';
import 'dart:math' as math;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io';
import 'package:connectycube_sdk/connectycube_sdk.dart';

class ChatDetail extends StatefulWidget {
  final String user;
  final int userId;

  ChatDetail({Key key, @required this.user, @required this.userId})
      : super(key: key);
  @override
  _ChatDetailState createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String error = 'Error';

  chooseImage() {
    print('here');
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.gallery);
    });
    setStatus('');
  }

  chooseCamera() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.camera);
    });
    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  // @override
  // void initState() {
  //   CubeDialog newDialog =
  //       CubeDialog(CubeDialogType.PRIVATE, occupantsIds: [widget.userId]);

  //   createDialog(newDialog).then((createdDialog) {
  //     print('here');
  //     print(createdDialog);
  //     CubeDialog cubeDialog =
  //         newDialog; // some dialog, which must contains opponent's id in 'occupantsIds'
  //     CubeMessage message = CubeMessage();
  //     message.body = "lo bhaee";
  //     message.dateSent = DateTime.now().millisecondsSinceEpoch;
  //     message.markable = true;
  //     message.saveToHistory = true;
  //     print('yo');
  //     print(message);
  //     cubeDialog.occupantsIds = [widget.userId];
  //     print(cubeDialog);
  //     cubeDialog
  //         .sendMessage(message)
  //         .then((cubeMessage) {})
  //         .catchError((error) {});
  //   }).catchError((error) {
  //     print(error);
  //   });
  //   super.initState();
  // }

  @override
  void initState() {
    getMessagesList();
    super.initState();
  }

  Stream chatmessages;

  Widget chatMessagesList() {
    return Container();
  }

  Future send(text) {
    CubeDialog newDialog =
        CubeDialog(CubeDialogType.PRIVATE, occupantsIds: [widget.userId]);

    createDialog(newDialog).then((createdDialog) {
      print('here');
      print(createdDialog);
      CubeDialog cubeDialog =
          newDialog; // some dialog, which must contains opponent's id in 'occupantsIds'
      CubeMessage message = CubeMessage();
      message.body = text;
      message.dateSent = DateTime.now().millisecondsSinceEpoch;
      message.markable = true;
      message.saveToHistory = true;
      print('yo');
      print(message);
      cubeDialog.occupantsIds = [widget.userId];
      print(cubeDialog);
      cubeDialog
          .sendMessage(message)
          .then((cubeMessage) {})
          .catchError((error) {});
    }).catchError((error) {
      print(error);
    });
  }

  Future getMessagesList() {
    String dialogId = "605dc985ca8bf45e84921d0c";
    print('yayy2');
    GetMessagesParameters params = GetMessagesParameters();
    params.limit = 100;
    params.filters = [RequestFilter("", "date_sent", QueryRule.GT, 1583402980)];
    params.markAsRead = true;
    params.sorter = RequestSorter(OrderType.DESC, "", "date_sent");

    getMessages(dialogId, params.getRequestParameters()).then((pagedResult) {
      print('yayy');
      // print(pagedResult.items[0].body);

      (pagedResult.items as List)
          .map((e) => {
                setState(() {
                  chatmessages = e.body;
                })
              })
          .toList();
    }).catchError((error) {});
  }

  final TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          title: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 6, left: 0.0),
                child: CircleAvatar(
                  radius: 22.0,
                  backgroundImage:
                      AssetImage('assets/images/chatList/default.jpg'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.user,
                  style: TextStyle(color: Colors.black87),
                ),
              )
            ],
          ),
        ),
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/chatDetail/background.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: [
              Expanded(child: Container()),
              Container(
                child:
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8, bottom: 4),
                    child: Material(
                      elevation: 1.5,
                      borderRadius: BorderRadius.circular(25),
                      child: Stack(
                        children: [
                          TextField(
                            controller: text,
                            decoration: InputDecoration(
                                hintText: 'Type a message',
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding:
                                    EdgeInsets.only(top: 6.0, left: 20),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide.none,
                                )),
                            minLines: 1,
                            maxLines: 10,
                          ),
                          Positioned(
                            right: 40,
                            child: Transform.rotate(
                              angle: -math.pi / 1.5,
                              child: IconButton(
                                icon: Icon(
                                  Icons.attachment,
                                  color: Colors.grey[800],
                                ),
                                onPressed: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  print('hello');
                                  chooseImage();
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            right: 5,
                            child: IconButton(
                              icon: Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.grey[800],
                              ),
                              onPressed: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                print('hello');
                                chooseCamera();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 3.0, right: 6),
                    child: Container(
                      height: 50,
                      child: FloatingActionButton(
                        // color: Colors.green,
                        backgroundColor: Colors.green,
                        onPressed: () {},
                        shape: CircleBorder(),
                        child: IconButton(
                          icon: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            print(text.text);
                            await send(text.text);
                            text.text = '';
                          },
                        ),
                      ),
                    ),
                  )
                ]),
              )
            ],
          ),
        )));
  }
}
