import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:splyxp/widgets/carousels.dart';
import 'package:splyxp/widgets/dropdown.dart';
import 'package:splyxp/widgets/innerAppBar.dart';
import 'package:splyxp/widgets/navbar.dart';

import '../../views/search.dart';
import '../../views/profile.dart';
import '../../views/sply-network.dart';
import 'package:splyxp/views/chatList/chat-main.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  List carouselImg = [
    'assets/images/productDetail/jacket1.jpg',
    'assets/images/productDetail/jacket2.jpg',
    'assets/images/productDetail/jacket3.jpg',
    'assets/images/productDetail/jacket4.jpg'
  ];

  int index = 0;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    if (_selectedIndex == 0 && index == 0) {
      Navigator.of(context).pop();
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  List<String> _size = ['S', 'M', 'L', 'XL']; // Option 2
  String _selectedsize;

  static List<Widget> _bottomNavList = [
    ProductDetail(),
    Search(),
    ChatList(),
    SplyNetwork(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) return true;
        setState(() {
          _selectedIndex = 0;
        });
        return false;
      },
      child: Scaffold(
        appBar: Appbar(context),
        body: _selectedIndex == 0
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    CarouselWithDots(carouselImg: carouselImg),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thome Brown',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10, left: 20),
                            child: Text(
                              '4 Bar Jacket',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10, left: 20),
                            child: Text('Price  £200',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w700)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 260.0,
                      height: 45.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(color: Colors.blueGrey)),
                      child: Center(
                        child: DropdownButton(
                          // itemHeight: 40,
                          underline: SizedBox.shrink(),
                          iconSize: 30.0,
                          hint: Text(
                            'Please choose a size',
                            style: TextStyle(fontSize: 18),
                          ), // Not necessary for Option 1
                          value: _selectedsize,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedsize = newValue;
                            });
                          },
                          items: _size.map((sizes) {
                            return DropdownMenuItem(
                              child: new Text(sizes),
                              value: sizes,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        height: 55,
                        width: 250,
                        child: FlatButton(
                          color: Colors.black,
                          // height: 40,
                          onPressed: () {},
                          child: Text(
                            'GET NOW',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DropDown(brand: 'Thome Brown', link: ''),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              )
            : _bottomNavList.elementAt(_selectedIndex),
        bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
      ),
    );
  }
}
