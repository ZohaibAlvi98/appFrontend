import 'package:flutter/material.dart';
import 'package:splyxp/views/requests/request-shopper.dart';
import 'package:flutter/widgets.dart';
import 'package:country_code_picker/country_code_picker.dart';
import '../purchase/review.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final ScrollController _scrollController = ScrollController();
  int _groupValue = -1;
  void _navigatorPage(index) {
    // Navigator.of(context).pop(new PageRouteBuilder());
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: true,
        transitionDuration: const Duration(),
        pageBuilder: (BuildContext context, _, __) {
          return Review(confirm: index);
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new SlideTransition(
            child: child,
            position: new Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
          );
        }));
  }

  bool payment = false;

  Widget _myRadioButton({String title, int value, Function onChanged}) {
    return RadioListTile(
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 1.5,
      backgroundColor: Colors.white,
      centerTitle: false,
      leading: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.0, top: 4),
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
      title: Text(
        'Purchase',
        style: TextStyle(color: Colors.black, fontSize: 22),
      ),
    );
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.18,
                child: secondAppbar(_navigatorPage, width)),
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.82,
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          elevation: 5,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                heading(width, 'Shipping Detail', '1'),
                                SizedBox(
                                  height: 15,
                                ),
                                textfields('First Name *'),
                                SizedBox(
                                  height: 15,
                                ),
                                textfields('Last Name *'),
                                SizedBox(
                                  height: 15,
                                ),
                                textfields('Email *'),
                                SizedBox(
                                  height: 15,
                                ),
                                textfields('Phone *'),
                                SizedBox(
                                  height: 15,
                                ),
                                textfields('City *'),
                                SizedBox(
                                  height: 15,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(
                                      'Country *',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                MyCountryPicker(),
                                SizedBox(
                                  height: 15,
                                ),
                                textfields('Postal Code'),
                                SizedBox(
                                  height: 15,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      'Address *',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 22),
                                  child: TextFormField(
                                    maxLines: 3,
                                    cursorColor: Colors.black54,
                                    decoration: InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black87,
                                                width: 1.3))),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          elevation: 5,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            color: Colors.grey[200],
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                heading(width, 'Payment Details', '2'),
                                SizedBox(
                                  height: 20,
                                ),
                                _myRadioButton(
                                  title: "Pay with stripe using credit card",
                                  value: 0,
                                  onChanged: (newValue) =>
                                      setState(() => _groupValue = newValue),
                                ),
                                _myRadioButton(
                                  title: "Use a new payment method",
                                  value: 1,
                                  onChanged: (newValue) =>
                                      setState(() => _groupValue = newValue),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      'Card Number *',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 22),
                                  child: TextFormField(
                                    cursorColor: Colors.black54,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(left: 5, top: 20),
                                        hintText: '1234 1234 1234 1234',
                                        suffixIcon: Padding(
                                          padding: EdgeInsets.only(
                                              top:
                                                  10), // add padding to adjust icon
                                          child: Icon(Icons.credit_card,
                                              color: Colors.black54),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black87,
                                                width: 2))),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                textfields('Expiry Date *'),
                                SizedBox(
                                  height: 15,
                                ),
                                textfields('Card Code'),
                                SizedBox(
                                  height: 15,
                                ),
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Container(
                                      height: 50,
                                      width: 220,
                                      child: FlatButton(
                                        color: Colors.black,
                                        // height: 40,
                                        onPressed: () {
                                          _navigatorPage(true);
                                        },
                                        child: Text(
                                          'PLACE ORDER',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  },
                  scrollDirection: Axis.vertical,
                  // shrinkWrap: true,
                ))
          ]),
        ));
  }
}

Widget heading(width, heading, numb) {
  return Container(
    height: 50,
    child: Row(
      children: <Widget>[
        Padding(
            padding: width < 400
                ? EdgeInsets.only(left: 14)
                : EdgeInsets.only(left: 16),
            child: Container(
              width: 40,
              height: 50,
              decoration: new BoxDecoration(
                border: new Border.all(
                  color: Colors.black,
                  width: 1.6,
                ),
                color: numb == '1' ? Colors.white : Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  numb,
                  style: TextStyle(
                      fontSize: width < 400 ? 18 : 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            heading,
            style: TextStyle(
                fontSize: width < 400 ? 20 : 22, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    ),
  );
}

class MyCountryPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        height: 100,
        alignment: Alignment.center,
        child: Card(
          elevation: 1,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: SizedBox(
              width: double.infinity,
              child: CountryCodePicker(
                showDropDownButton: true,
                onChanged: print,
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: '+92',
                favorite: ['+44', 'UK'],
                // optional. Shows only country name and flag
                showCountryOnly: false,
                // optional. Shows only country name and flag when popup is closed.
                showOnlyCountryWhenClosed: false,
                // optional. aligns the flag and the Text left
                alignLeft: false,
              ),
            ),
          ),
        ));
  }
}

Widget secondAppbar(_navigatorPage, width) {
  return AppBar(
    elevation: 5,
    automaticallyImplyLeading: false,
    toolbarHeight: 100,
    backgroundColor: Colors.white,
    title: Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
              child: Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text(
              "You are going to purchase 4 items. To review your \norder please tap the button below. ",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          )),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Total:  £1,600',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: width < 400 ? 20 : 22,
                        fontWeight: FontWeight.w400),
                  )),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.redAccent, width: 1.4)),
                  onPressed: () {
                    _navigatorPage(false);
                  },
                  child: Text(
                    'REVIEW',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  color: Colors.redAccent,
                  minWidth: 100,
                  height: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
