import 'package:flutter/material.dart';
import '../login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../bottomNav.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:splyxp/services/signup_posting.dart';
import 'package:splyxp/widgets/sginupprocedure.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

Future<SignUpPosting> createUser(
    String username, String password, String email) async {
  final String apiUrl = 'https://splystyle.net/wp-json/wp/v2/users/register';

  final postResponse = await http.post(
    apiUrl,
    headers: <String, String>{'content-type': 'application/json'},
    body: jsonEncode(<String, String>{
      'username': username,
      'email': email,
      'password': password,
    }),
  );

  if (postResponse.statusCode == 201) {
    final String responseString = postResponse.body;

    return signUpPostingFromJson(responseString);
  } else {
    return null;
  }
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

  SignUpPosting _user;

  final TextEditingController username = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();

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

  Future<Album> _futureAlbum;

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
                              controller: firstname,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(left: 20, right: 5),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          new Flexible(
                            child: new TextField(
                              controller: lastname,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(left: 20, right: 5),
                              ),
                            ),
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
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black87, width: 2),
                        ),
                      ),
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
                    onPressed: () async {
                      if (formKey.currentState.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignUpProc(
                            firstname: firstname.text,
                            lastname: lastname.text,
                            username: username.text,
                            email: email.text,
                            password: pass.text,
                          );
                        }));
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
                  ),
                ),
              ),
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

Future<Album> createAlbum(
    {String email,
    String firstname,
    String lastname,
    String username,
    String password}) async {
  final response = await http.post(
    'https://splystyle.net/wp-json/wp/v2/users/register',
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'email': email,
      'password': password,
      'firtname': firstname,
      'lastname': lastname,
    }),
  );

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class Album {
  final int id;
  final String username;

  Album({this.id, this.username});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      username: json['username'],
    );
  }
}
