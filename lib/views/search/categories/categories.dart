import 'package:flutter/material.dart';
import 'package:splyxp/widgets/innerAppBar.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: innerAppbar(context, 'categories'),
        body: Text(''),
      ),
    );
  }
}
