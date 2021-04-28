import 'package:flutter/material.dart';
import 'package:splyxp/widgets/carousels.dart';
import 'package:splyxp/widgets/dropdown.dart';
import 'package:splyxp/widgets/innerAppBar.dart';
import 'package:splyxp/widgets/navbar.dart';
import '../search/search.dart';
import '../../views/sply-network.dart';
import 'package:splyxp/views/chatList/chat-main.dart';
import '../auth/signup/signup.dart';
import '../../services/prdocut-detail-api.dart';
import 'package:html/parser.dart';

class ProductDetailStyleBox extends StatefulWidget {
  final String prodId;
  ProductDetailStyleBox({Key key, @required this.prodId}) : super(key: key);
  @override
  _ProductDetailStyleBoxState createState() => _ProductDetailStyleBoxState();
}

class _ProductDetailStyleBoxState extends State<ProductDetailStyleBox> {
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

  List<String> _qty = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  String _selectedQty;

  static List<Widget> _bottomNavList = [
    ProductDetailStyleBox(
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
                    print(snapshot);
                    for (var a = 0; a < item['images'].length; a++) {
                      carouselImg.add(item['images'][a]['src']);
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
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 13, right: 13),
                                    child: Text(
                                      item['name'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'RMNUEUSEMIBOLD'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 20),
                                  child: Center(
                                    child: Text(
                                      '',
                                      // item['categories'][3]['name'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'RMNUEUREGULAR'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 20),
                                  child: Center(
                                    child: Text(
                                      'Price:  \$' + item['price'],
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
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 230.0,
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
                                  'Select Quantity',
                                  style: TextStyle(fontSize: 18),
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
                            vendorId: null,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    );
                  }
                })
            : _bottomNavList.elementAt(_selectedIndex),
        bottomNavigationBar: Navbar(_onItemTapped, _selectedIndex),
      ),
    );
  }
}
