import 'package:flutter/material.dart';
import '../../../widgets/innerAppBar.dart';
import '../signup/signup.dart';
import '../../../widgets/innerAppBar.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../bottomNav.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController username = TextEditingController();
  final TextEditingController pass = TextEditingController();

  Future<bool> saveAuth() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool("auth", true);
    return _prefs.commit();
  }

  void setAuth(context) {
    saveAuth().then((value) => {
          Navigator.of(context).pushReplacement(
              new MaterialPageRoute(builder: (BuildContext context) {
            return new BottomNav();
          }))
        });
  }

  Future<bool> saveLoginPass(login, pass) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString("login", login);
    _prefs.setString("pass", pass);

    return _prefs.commit();
  }

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
        login: username.text,
        password: pass.text,
      );
// CubeUser user = CubeUser(email: "cubeuser@gmail.com", password: "super_sequre_password");
// 'marvi' supersecurepwd
      if (pass.text != '') {
        createSession(user).then((cubeSession) {
          print(cubeSession);
          saveLoginPass(username.text, pass.text);
        }).catchError((error) {});
      }
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w700,
                        color: Colors.blueGrey),
                  ),
                  TextFormField(
                    controller: username,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black87, width: 2))),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w700,
                        color: Colors.blueGrey),
                  ),
                  TextFormField(
                    controller: pass,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black87, width: 2))),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size * 0.05,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to first route when tapped.
                  // Navigator.pop(context);
                  setAuth(context);
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

Widget usernameTextFields(String label, size, width, String page, controller) {
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
            controller: controller,
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
