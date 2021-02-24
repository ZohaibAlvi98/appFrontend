import 'package:flutter/material.dart';
import 'package:splyxp/widgets/innerAppBar.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  // var arr = [4];
  // List<String> a = new List<String>(5);
  List<String> _size = ['S', 'M', 'L', 'XL'];
  List<String> _size2 = ['S', 'M', 'L', 'XL'];
  List<String> _size3 = ['S', 'M', 'L', 'XL'];
  List<String> _size4 = ['S', 'M', 'L', 'XL'];

  List<String> _qty = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  List<String> _qty2 = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9'
  ]; // Option 2
  List<String> _qty3 = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9'
  ]; // Option 2
  List<String> _qty4 = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9'
  ]; // Option 2
  // Option 2
  // Option 2
  String _selectedsize;
  String _selectedsize2;
  String _selectedsize3;
  String _selectedsize4;

  String _selectedQty;
  String _selectedQty2;
  String _selectedQty3;
  String _selectedQty4;

  // void variable() {
  //   for (var i = 0; i < arr.length; i++) {
  //     print([i]);
  //     a.add('s');
  //   }
  //   print(a);
  // }

  // Widget dropdown(dropD) {
  //   return Container(
  //     width: 100.0,
  //     height: 48.0,
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(25.0),
  //         border: Border.all(color: Colors.blueGrey)),
  //     child: Center(
  //       child: DropdownButton(
  //         // itemHeight: 40,
  //         underline: SizedBox.shrink(),
  //         iconSize: 28.0,
  //         hint: Text(
  //           dropD == 'size' ? 'Size' : 'Qty',
  //           style: TextStyle(fontSize: 16),
  //         ), // Not necessary for Option 1
  //         value: dropD == 'size'
  //             ? _selectedsize
  //             : dropD != 'qty'
  //                 ? _selectedsize2
  //                 : _selectedQty,
  //         onChanged: (newValue) {
  //           dropD == 'size'
  //               ? setState(() {
  //                   _selectedsize = newValue;
  //                 })
  //               : dropD == 'size2'
  //                   ? setState(() {
  //                       _selectedsize2 = newValue;
  //                     })
  //                   : dropD == 'size3'
  //                       ? setState(() {
  //                           _selectedsize3 = newValue;
  //                         })
  //                       : dropD == 'size4'
  //                           ? setState(() {
  //                               _selectedsize4 = newValue;
  //                             })
  //                           : dropD == 'qty'
  //                               ? setState(() {
  //                                   _selectedQty = newValue;
  //                                 })
  //                               : dropD == 'qty2'
  //                                   ? setState(() {
  //                                       _selectedQty2 = newValue;
  //                                     })
  //                                   : dropD == 'qty3'
  //                                       ? setState(() {
  //                                           _selectedQty3 = newValue;
  //                                         })
  //                                       : setState(() {
  //                                           _selectedQty4 = newValue;
  //                                         });
  //         },
  //         items: dropD == 'size'
  //             ? _size.map((sizes) {
  //                 return DropdownMenuItem(
  //                   child: new Text(sizes),
  //                   value: sizes,
  //                 );
  //               }).toList()
  //             : dropD != 'qty'
  //                 ? _size.map((sizes) {
  //                     return DropdownMenuItem(
  //                       child: new Text(sizes),
  //                       value: sizes,
  //                     );
  //                   }).toList()
  //                 : _qty.map((sizes) {
  //                     return DropdownMenuItem(
  //                       child: new Text(sizes),
  //                       value: sizes,
  //                     );
  //                   }).toList(),
  //       ),
  //     ),
  //   );
  // }

  Widget item(img, width) {
    return Stack(
      children: [
        Padding(
          padding: width < 400
              ? EdgeInsets.only(top: 15.0, right: 15)
              : EdgeInsets.only(top: 15.0, right: 20),
          child: Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.close,
              size: 20,
              color: Colors.grey[800],
            ),
          ),
        ),
        SizedBox(
          width: 160,
          child: Container(
              padding: EdgeInsets.only(top: 8, left: 15),
              child: Image.asset(img)),
        ),
        Container(
          alignment: Alignment.topCenter,
          padding: width < 400
              ? EdgeInsets.only(top: 10, left: 135)
              : EdgeInsets.only(top: 10, left: 95),
          child: Text(
            'AIR JORDAN 1 MID \n"SISTERHOOD"',
            style: TextStyle(
                fontSize: width < 400 ? 14 : 18, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: width < 400
              ? EdgeInsets.only(top: 2.5, left: 125.0)
              : EdgeInsets.only(top: 5, left: 55.0),
          child: Center(
            heightFactor: width < 400 ? 6 : 7.2,
            child: Text(
              'Item Id: 16455890',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 175, top: 80),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Size: M',
                      style: TextStyle(
                          fontSize: width < 400 ? 14 : 14.5,
                          color: Colors.black),
                    )),
                SizedBox(
                  height: 6,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Color: Red',
                        style: TextStyle(
                            fontSize: width < 400 ? 14 : 14.5,
                            color: Colors.black))),
                SizedBox(
                  height: 6,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Qty: 1',
                      style: TextStyle(
                          fontSize: width < 400 ? 14 : 14.5,
                          color: Colors.black),
                    ))
              ],
            )),
        Padding(
          padding: EdgeInsets.only(left: 175, top: 155),
          child: Text(
            'Price:  £400',
            style:
                TextStyle(color: Colors.black, fontSize: width < 400 ? 15 : 17),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: innerAppbar(context, 'SHOPPING BAG'),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            item('assets/images/sneakers/list1.jpg', width),
            SizedBox(height: 10),
            item('assets/images/styles/list1.png', width),
            SizedBox(height: 10),
            item('assets/images/tv/list2.jpg', width),
            SizedBox(
              height: 10,
            ),
            item('assets/images/styles/list2.png', width),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        height: 140,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, -15),
                  blurRadius: 20,
                  color: Color(0xFFDADADA).withOpacity(0.15))
            ]),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 5, right: 8),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'TOTAL GBP',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          letterSpacing: 1.05,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      '£ 1600',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          letterSpacing: 1.05,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                height: 58,
                width: 347,
                child: FlatButton(
                  color: Colors.black,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  // height: 40,
                  onPressed: () {},
                  child: Text(
                    'Proceed to checkout',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        letterSpacing: 0.6,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
