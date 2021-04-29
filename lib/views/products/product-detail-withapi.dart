import 'package:flutter/material.dart';
import 'package:splyxp/widgets/carousels.dart';
import 'package:splyxp/widgets/dropdown.dart';
import 'package:splyxp/widgets/innerAppBar.dart';
import 'package:splyxp/widgets/navbar.dart';
import '../search/search.dart';
import '../../views/profile.dart';
import '../../views/sply-network.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import '../auth/signup/signup.dart';
import '../../services/prdocut-detail-api.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';

class ProductDetail extends StatefulWidget {
  final String prodId;
  ProductDetail({Key key, @required this.prodId}) : super(key: key);
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  List carouselImg = [];

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

  String getBrand(prodList) {
    for (var a = 0; a < prodList['meta_data'].length; a++) {
      if (prodList['meta_data'][a]['key'] == '_select_brand') {
        return prodList['meta_data'][a]['value'];
      }
    }
  }

  List<String> _size = ['S', 'M', 'L', 'XL']; // Option 2

  String _selectedsize;

  List<String> _qty = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  String _selectedQty;

  List<String> _color = ['Black', 'Blue', 'Red'];
  String _selectedColor;

  static List<Widget> _bottomNavList = [
    ProductDetail(
      prodId: null,
    ),
    Search(),
    ChatList(),
    SplyNetwork(),
    Signup()
  ];
  DrawrProducts data = DrawrProducts();
  @override
  void initState() {
    super.initState();
  }

  void getImages(var item) {
    for (var a = 0; a < item['images'].length; a++) {
      carouselImg.add(item['images'][a]['src']);
    }
  }

  final f = NumberFormat('#,###,###.##');
  @override
  Widget build(BuildContext contexts) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) return true;
        setState(() {
          _selectedIndex = 0;
        });
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appbarWithMenu(context),
        drawer: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors
                  .black, //This will change the drawer background to blue.
              //other styles
            ),
            child: drawerAppBar(context, '', false)),
        body: _selectedIndex == 0
            ? FutureBuilder(
                future: data.getProducts(widget.prodId),
                builder: (BuildContext context,
                    AsyncSnapshot<Map<String, dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    final item = snapshot.data;
                    final brand = getBrand(item);
                    print(snapshot);
                    if (carouselImg.isEmpty) {
                      for (var a = 0; a < item['images'].length; a++) {
                        carouselImg.add(item['images'][a]['src']);
                      }
                    }
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          CarouselWithDots(carouselImg: carouselImg),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    brand,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'RMNUEUREGULAR'),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 40, right: 40, top: 10),
                                    child: Text(
                                      item['name'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'RMNUEUSEMIBOLD'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Center(
                                    child: Text(
                                      '\$' +
                                          f.format(num.tryParse(item['price'])),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'RMNUEUREGULAR'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: 300.0,
                            height: 45.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border:
                                  Border.all(color: Colors.black, width: 0.5),
                            ),
                            child: DropdownButton(
                              isExpanded: true,
                              icon: Icon(Icons.keyboard_arrow_down_sharp),
                              // itemHeight: 40,
                              underline: SizedBox.shrink(),
                              iconSize: 28.0,
                              hint: Text(
                                '   Select Size',
                                style: TextStyle(fontSize: 16),
                              ), // Not necessary for Option 1
                              value: _selectedsize,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedsize = newValue;
                                });
                              },
                              items: item['attributes'][0]['options']
                                  .map<DropdownMenuItem<String>>((sizes) {
                                return DropdownMenuItem<String>(
                                  child: new Text(sizes),
                                  value: sizes,
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 300.0,
                            height: 45.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border:
                                  Border.all(color: Colors.black, width: 0.5),
                            ),
                            child: DropdownButton(
                              isExpanded: true,
                              icon: Icon(Icons.keyboard_arrow_down_sharp),
                              // itemHeight: 40,
                              underline: SizedBox.shrink(),
                              iconSize: 28.0,
                              hint: Text(
                                '   Select Color',
                                style: TextStyle(fontSize: 16),
                              ), // Not necessary for Option 1
                              value: _selectedColor,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedColor = newValue;
                                });
                              },
                              items: item['attributes'][1]['options']
                                  .map<DropdownMenuItem<String>>((sizes) {
                                return DropdownMenuItem<String>(
                                  child: new Text(sizes),
                                  value: sizes,
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 300.0,
                            height: 45.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border:
                                  Border.all(color: Colors.black, width: 0.5),
                            ),
                            child: DropdownButton(
                              isExpanded: true,
                              icon: Icon(Icons.keyboard_arrow_down_sharp),
                              // itemHeight: 40,
                              underline: SizedBox.shrink(),
                              iconSize: 28.0,
                              hint: Text(
                                '   Select Qty',
                                style: TextStyle(fontSize: 16),
                              ), // Not necessary for Option 1
                              value: _selectedQty,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedQty = newValue;
                                });
                              },
                              items: _qty.map((sizes) {
                                return DropdownMenuItem(
                                  child: new Text(sizes),
                                  value: sizes,
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              height: 55,
                              width: 230,
                              child: FlatButton(
                                color: Colors.black,
                                // height: 40,
                                onPressed: () {},
                                child: Text(
                                  'GET NOW',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DropDown(
                            link: '',
                            description:
                                parse(item['description']).documentElement.text,
                            vendor: item['store_name'],
                            vendorId: item['vendor'].toString(),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    );
                  }
                },
              )
            : _bottomNavList.elementAt(_selectedIndex),
        bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
      ),
    );
  }
}
