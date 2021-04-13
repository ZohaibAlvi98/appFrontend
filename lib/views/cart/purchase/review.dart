import 'package:flutter/material.dart';
import 'package:splyxp/widgets/innerAppBar.dart';

class Review extends StatefulWidget {
  final bool confirm;

  Review({Key key, @required this.confirm}) : super(key: key);
  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    print(widget.confirm);
    return Scaffold(
      appBar: innerAppbar(
        context,
        'REVIEW',
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.confirm)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 26),
                    child: Text(
                      'Your order has been Confirmed',
                      style: TextStyle(
                          fontFamily: 'RMNUEUSEMIBOLD',
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 26),
                    child: Text(
                      'Order Id: 123456',
                      style: TextStyle(
                          fontFamily: 'RMNUEUSEMIBOLD',
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            if (!widget.confirm)
              Padding(
                padding: EdgeInsets.only(top: 10.0, left: 26),
                child: Text(
                  'Order Summary',
                  style: TextStyle(
                      fontFamily: 'RMNUEUSEMIBOLD',
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.0),
              child: new Divider(
                thickness: 5,
                color: Colors.grey[700],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 26, right: 26),
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(6),
                  1: FlexColumnWidth(2),
                },
                border: TableBorder.all(color: Colors.grey[100]),
                children: [
                  TableRow(children: [
                    Container(
                      color: Colors.black,
                      padding: const EdgeInsets.all(8.0),
                      child: Text('PRODUCTS',
                          style: TextStyle(
                              fontFamily: 'RMNUEUREGULAR',
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                    Container(
                      color: Colors.black,
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'TOTAL',
                        style: TextStyle(
                            fontFamily: 'RMNUEUREGULAR',
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    tableRowProducts(
                        'AIR JORDAN 1 MID "SISTERHOOD"', Colors.white12, width),
                    tableRowPrice('£ 200', Colors.white12),
                  ]),
                  TableRow(children: [
                    tableRowProducts(
                        'Travis Scott X Air Jordan 4 Retro "Cactus Jack"',
                        Colors.grey[200],
                        width),
                    tableRowPrice('£ 200', Colors.grey[200]),
                  ]),
                  TableRow(children: [
                    tableRowProducts(
                        'THOME BROWN 4 Bar Jackets × 2', Colors.white12, width),
                    tableRowPrice('£ 400', Colors.white12),
                  ]),
                  TableRow(children: [
                    tableRowProducts('VETEMENTS Hip Hop T-Shirt Embroidery',
                        Colors.grey[200], width),
                    tableRowPrice('£ 400', Colors.grey[200]),
                  ]),
                  TableRow(children: [
                    Container(
                      color: Colors.white12,
                      padding: EdgeInsets.only(
                        top: 15.0,
                        bottom: 18,
                        left: 8,
                      ),
                      child: Text('SUBTOTAL',
                          style: TextStyle(
                            fontFamily: 'RMNUEUSEMIBOLD',
                            fontSize: 17,
                          )),
                    ),
                    tableRowPrice('£ 1200', Colors.white12),
                  ]),
                  TableRow(children: [
                    Container(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 15.0,
                          bottom: width < 400 ? 24 : 18,
                          left: 8,
                        ),
                        child: Text('TOTAL',
                            style: TextStyle(
                              fontFamily: 'RMNUEUSEMIBOLD',
                              fontSize: 17,
                            )),
                      ),
                    ),
                    tableRowPrice('£ 1600', Colors.grey[200]),
                  ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget tableRowProducts(text, color, width) {
  return Container(
    color: color,
    child: Padding(
      padding: width < 400 ? EdgeInsets.all(10.0) : EdgeInsets.all(8.0),
      child: Text(text,
          style: TextStyle(
              fontFamily: 'RMNUEUREGULAR',
              fontSize: 16,
              fontWeight: FontWeight.w400)),
    ),
  );
}

Widget tableRowPrice(text, color) {
  return Container(
    // padding: EdgeInsets.only(top: 30),
    color: color,
    child: Center(
        heightFactor: 2.87,
        child: Text(text,
            style: TextStyle(
                fontFamily: 'RMNUEUREGULAR',
                fontSize: 16,
                fontWeight: FontWeight.w400))),
  );
}
