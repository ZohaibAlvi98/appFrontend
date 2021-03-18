import 'package:flutter/material.dart';
import '../../../widgets/innerAppBar.dart';
import '../signup/signup.dart';
import '../../../widgets/innerAppBar.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: Appbar(context),
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text("Sign In",
                style: TextStyle(
                    height: size * 0.004,
                    color: Colors.black,
                    fontSize: width * 0.1,
                    fontWeight: FontWeight.w700)),
            SizedBox(
              height: size * 0.05,
            ),
            usernameTextField('Email', size, width, 'login'),
            SizedBox(
              height: 20,
            ),
            usernameTextField('Password', size, width, 'login'),
            SizedBox(
              height: size * 0.05,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to first route when tapped.
                  // Navigator.pop(context);
                },
                child: Text('Login'),
              ),
            ),
          ]),
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.1, size * 0.8, 0, 0),
            child: GestureDetector(
                child: Text("Go Back!", style: TextStyle(color: Colors.blue)),
                onTap: () {
                  Navigator.pop(context);
                }),
          ),
          Center(
            heightFactor: size * 0.085,
            child: Text('Or Don\'t have an account ? '),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(width * 0.72, size * 0.667, 0, 0),
              child: GestureDetector(
                  child: Text("SignUp",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue)),
                  onTap: () => Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => Signup(),
                          transitionsBuilder: (c, anim, a2, child) =>
                              FadeTransition(opacity: anim, child: child),
                          transitionDuration: Duration(milliseconds: 2),
                        ),
                      ))),
        ],
      )),
    );
  }
}
