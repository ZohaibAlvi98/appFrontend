import 'package:flutter/material.dart';
import 'package:splyxp/widgets/innerAppBar.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<String> _size = ['S', 'M', 'L', 'XL'];
  List<String> _size2 = ['S', 'M', 'L', 'XL'];
  List<String> _size3 = ['S', 'M', 'L', 'XL'];
  List<String> _size4 = ['S', 'M', 'L', 'XL'];

  List<String> _qty = ['1', '2', '3', '4', '5', '6', '7', '8', '9']; // Option 2
  // Option 2
  String _selectedsize;
  String _selectedQty;

  Widget dropdown(dropD) {
    return Container(
      width: 100.0,
      height: 48.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(color: Colors.blueGrey)),
      child: Center(
        child: DropdownButton(
          // itemHeight: 40,
          underline: SizedBox.shrink(),
          iconSize: 28.0,
          hint: Text(
            dropD == 'size' ? 'Size' : 'Qty',
            style: TextStyle(fontSize: 16),
          ), // Not necessary for Option 1
          value: dropD == 'size' ? _selectedsize : _selectedQty,
          onChanged: (newValue) {
            dropD == 'size'
                ? setState(() {
                    _selectedsize = newValue;
                  })
                : setState(() {
                    _selectedQty = newValue;
                  });
          },
          items: dropD == 'size'
              ? _size.map((sizes) {
                  return DropdownMenuItem(
                    child: new Text(sizes),
                    value: sizes,
                  );
                }).toList()
              : _qty.map((sizes) {
                  return DropdownMenuItem(
                    child: new Text(sizes),
                    value: sizes,
                  );
                }).toList(),
        ),
      ),
    );
  }

  Widget item(img) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.0, right: 22),
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
          padding: EdgeInsets.only(top: 20, left: 60),
          child: Text(
            'AIR JORDAN',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 60.0),
          child: Center(
            heightFactor: 7.2,
            child: Text(
              'Item Id: 16455890',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 170, top: 90),
          child: Row(
            children: [
              dropdown('size'),
              SizedBox(
                width: 5,
              ),
              dropdown('qty'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 180, top: 155),
          child: Text(
            'Price:  \$400',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: innerAppbar(context, 'SHOPPING BAG'),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            item('assets/images/sneakers/list1.jpg'),
            SizedBox(height: 10),
            item('assets/images/styles/list1.png'),
            SizedBox(height: 10),
            item('assets/images/tv/list2.jpg'),
            SizedBox(
              height: 10,
            ),
            item('assets/images/styles/list2.png'),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
