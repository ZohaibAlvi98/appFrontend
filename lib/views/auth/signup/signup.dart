import 'package:flutter/material.dart';
import '../../../widgets/innerAppBar.dart';
import '../login/login.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text("Sign Up",
                style: TextStyle(
                    height: size * 0.004,
                    color: Colors.black,
                    fontSize: width * 0.1,
                    fontWeight: FontWeight.w700)),
            SizedBox(
              height: size * 0.05,
            ),
            oppositeTextfields('First Name', width, 'signup', 'Last Name'),
            SizedBox(
              height: 20,
            ),
            usernameTextField('Email', size, width, 'signup'),
            oppositeTextfields(
                'Password', width, 'signup', '  Confirm Password'),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: size * 0.05,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to first route when tapped.
                  // Navigator.pop(context);
                },
                child: Text('Sign Up'),
              ),
            ),
          ]),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Or Already have an account ? '),
              Padding(
                  padding: EdgeInsets.fromLTRB(5, 20, 0, 0),
                  child: GestureDetector(
                      child: Text("Login",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue)),
                      onTap: () => Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => Login(),
                              transitionsBuilder: (c, anim, a2, child) =>
                                  FadeTransition(opacity: anim, child: child),
                              transitionDuration: Duration(milliseconds: 2),
                            ),
                          ))),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }
}

Widget oppositeTextfields(label, width, page, label2) {
  return Padding(
    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w700,
                  color: Colors.blueGrey),
            ),
            SizedBox(
              width: 115,
            ),
            Text(
              label2,
              style: TextStyle(
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w700,
                  color: Colors.blueGrey),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.0, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Flexible(
                  child: new TextField(
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 20, right: 5)))),
              SizedBox(
                width: 30,
              ),
              new Flexible(
                child: new TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20, right: 5))),
              ),
              // if (label == 'Password' && page == 'signup')
              //   TextFormField(
              //     decoration: InputDecoration(
              //         helperText: '* Password should greater than 6 characters',
              //         helperStyle: TextStyle(color: Colors.red),
              //         focusedBorder: UnderlineInputBorder(
              //             borderSide: BorderSide(color: Colors.black87, width: 2))),
              //   ),
              // if (label != 'Password' || page == 'login')
              //   TextFormField(
              //     decoration: InputDecoration(
              //         focusedBorder: UnderlineInputBorder(
              //             borderSide: BorderSide(color: Colors.black87, width: 2))),
              //   ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget usernameTextField(String label, size, width, String page) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: width * 0.04,
              fontWeight: FontWeight.w700,
              color: Colors.blueGrey),
        ),
        if (label == 'Password' && page == 'signup')
          TextFormField(
            decoration: InputDecoration(
                helperText: '* Password should greater than 6 characters',
                helperStyle: TextStyle(color: Colors.red),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87, width: 2))),
          ),
        if (label != 'Password' || page == 'login')
          TextFormField(
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87, width: 2))),
          ),
      ],
    ),
  );
}
