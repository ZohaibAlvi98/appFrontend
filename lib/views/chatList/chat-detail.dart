import 'package:flutter/material.dart';
import 'package:splyxp/widgets/innerAppBar.dart';
import 'dart:math' as math;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io';

class ChatDetail extends StatefulWidget {
  final String user;
  ChatDetail({Key key, @required this.user}) : super(key: key);
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
            child: Column(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/chatDetail/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
              // color: Colors.grey[200],
            )),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/chatDetail/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8, bottom: 4),
                  child: Material(
                    elevation: 1.5,
                    borderRadius: BorderRadius.circular(25),
                    child: Stack(
                      children: [
                        TextField(
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
                              FocusScope.of(context).requestFocus(FocusNode());
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
                        onPressed: () {},
                      ),
                    ),
                  ),
                )
              ]),
            )
          ],
        )));
  }
}
