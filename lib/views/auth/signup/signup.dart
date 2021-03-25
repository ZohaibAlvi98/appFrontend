import 'package:flutter/material.dart';
import '../login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../bottomNav.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // Future<bool> saveAuth() async {
  //   SharedPreferences _prefs = await SharedPreferences.getInstance();
  //   _prefs.setBool("auth", true);
  //   return _prefs.commit();
  // }

  // void setAuth(context) {
  //   saveAuth();
  // }

  final TextEditingController username = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController conPass = TextEditingController();

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

  final formKey = GlobalKey<FormState>();
  String appId = "4451";

  String authKey = "nL5Ba8ywSMu-rGq";

  String authSecret = "vXM9T-QUXdx44pz";
  static int check = 0;
  Future signup() {
    createSession().then((cubeSession) {
      print(cubeSession);
      // return cubeSession;
      CubeUser user = CubeUser(
          login: username.text,
          password: pass.text,
          email: email.text,
          fullName: 'hehehe',
          phone: '4782323143',
          website: 'https://dozensofdreams.com',
          customData: "{middle_name: 'Bartoleo'}");

      signUp(user).then((cubeUser) {
        print('HEYY');
        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (BuildContext context) {
          return new Login();
        }));
      }).catchError((error) {
        print(error);
      });
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
        body: SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: formKey,
            child:
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
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'First Name',
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w700,
                              color: Colors.blueGrey),
                        ),
                        SizedBox(
                          width: 115,
                        ),
                        Text(
                          'Last Name',
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
                                      contentPadding: EdgeInsets.only(
                                          left: 20, right: 5)))),
                          SizedBox(
                            width: 30,
                          ),
                          new Flexible(
                            child: new TextField(
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(left: 20, right: 5))),
                          ),
                        ],
                      ),
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
                      'Email',
                      style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w700,
                          color: Colors.blueGrey),
                    ),
                    TextFormField(
                      validator: (val) {
                        return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val)
                            ? null
                            : "Please provide a valid email.";
                      },
                      controller: email,
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
                      'Username',
                      style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w700,
                          color: Colors.blueGrey),
                    ),
                    TextFormField(
                      validator: (val) {
                        return val.isEmpty || val.length < 2
                            ? "Please Provide Username"
                            : null;
                      },
                      controller: username,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black87, width: 2))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20.0),
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
                      validator: (val) {
                        return val.length >= 8
                            ? null
                            : "Please provide a password greater than 8 characters";
                      },
                      controller: pass,
                      decoration: InputDecoration(
                          // helperText:
                          //     '* Password should be greater than 8 characters',
                          // helperStyle: TextStyle(color: Colors.red),
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
              SizedBox(
                height: size * 0.05,
              ),
              Center(
                child: Container(
                  child: FlatButton(
                    color: Colors.black,
                    onPressed: () {
                      // Navigate back to first route when tapped.
                      // Navigator.pop(context);
                      if (formKey.currentState.validate()) {
                        // setAuth(context);
                        signup();
                      }
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ]),
          ),
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
                              color: Colors.black)),
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
