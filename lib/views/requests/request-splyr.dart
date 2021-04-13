import 'package:flutter/material.dart';
import 'package:splyxp/views/requests/request-shopper.dart';
import 'package:splyxp/widgets/innerAppBar.dart';

class RequestSupplier extends StatefulWidget {
  @override
  _RequestSupplierState createState() => _RequestSupplierState();
}

class _RequestSupplierState extends State<RequestSupplier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: innerAppbar(context, 'Requests'),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 8.0,
                right: 20,
                left: 20,
              ),
              child: Text(
                'Become a S-PLYR and maximize your product sale through our sate of the art Live Video Shopping platform. Your own channel will enable you to interact with potential customers to get maximum conversion.',
                style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.black87,
                    fontFamily: 'RMNUEUREGULAR'),
              ),
            ),
            SizedBox(
              height: 45,
            ),
            textfields('First Name *'),
            SizedBox(
              height: 20,
            ),
            textfields('Last Name *'),
            SizedBox(
              height: 20,
            ),
            textfields('Email *'),
            SizedBox(
              height: 20,
            ),
            textfields('Phone *'),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Comments',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: TextFormField(
                maxLines: 4,
                cursorColor: Colors.black54,
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black87, width: 1.3))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 50,
                  width: 200,
                  child: FlatButton(
                    color: Colors.black,
                    // height: 40,
                    onPressed: () {},
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            )
          ],
        )),
      ),
    );
  }
}
