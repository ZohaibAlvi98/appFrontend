import 'package:flutter/material.dart';
import 'package:splyxp/widgets/innerAppBar.dart';

class ChatDetail extends StatefulWidget {
  final String user;
  ChatDetail({Key key, @required this.user}) : super(key: key);
  @override
  _ChatDetailState createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 310),
            child: new Material(
              shape: new CircleBorder(),
            ),
          ),
        ],
        title: Text(widget.user),
      ),
      body: Center(
        child: Text('hello'),
      ),
    );
  }
}
