import 'package:flutter/material.dart';
import '../../../widgets/innerAppBar.dart';
import '../signup/signup.dart';
import '../../../widgets/innerAppBar.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    if (check == 0) {
      init(appId, authKey, authSecret);
      setState(() {
        check = 1;
      });
    }

    super.initState();
    // DO YOUR STUFF
  }

  String appId = "4451";

  String authKey = "nL5Ba8ywSMu-rGq";

  String authSecret = "vXM9T-QUXdx44pz";

  static int check = 0;
  Future login() {
    createSession().then((cubeSession) {
      print(cubeSession);
      // return cubeSession;
      CubeUser user = CubeUser(
        login: 'marvi',
        password: 'supersecurepwd',
      );
// CubeUser user = CubeUser(email: "cubeuser@gmail.com", password: "super_sequre_password");

      signIn(user).then((cubeUser) {
        print(cubeUser);
      }).catchError((error) {});
    }).catchError((error) {
      print(error);
    });
  }

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
                  login();
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
