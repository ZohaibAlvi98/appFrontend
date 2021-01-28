import 'package:flutter/material.dart';
import 'package:splyxp/widgets/innerAppBar.dart';

class Designer extends StatefulWidget {
  @override
  _DesignerState createState() => _DesignerState();
}

class _DesignerState extends State<Designer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: innerAppbar(context, 'designer'),
      body: Text(''),
    );
  }
}
