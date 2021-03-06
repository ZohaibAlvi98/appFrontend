import 'package:flutter/material.dart';
import '../../../widgets/innerAppBar.dart';
import '../signup/signup.dart';
import '../../../widgets/innerAppBar.dart';
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

  bool isHiddenPassword = true;

  Future<bool> saveAuth() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool("auth", true);
    return _prefs.commit();
  }

  void setAuth(context) {
    saveAuth();
  }

  Future<bool> saveLoginPass(login, pass, id) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString("login", login);
    _prefs.setString("pass", pass);
    _prefs.setInt("id", id);
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
          print('here');
          print(cubeSession.userId);
          saveLoginPass(username.text, pass.text, cubeSession.userId)
              .then((value) => {
                    Navigator.of(context).pushReplacement(
                        new MaterialPageRoute(builder: (BuildContext context) {
                      return new BottomNav();
                    }))
                  });
        }).catchError((error) {});
      }
    }).catchError((error) {
      print(error);
    });
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double size =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appbarWithMenu(context),
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor:
                Colors.black, //This will change the drawer background to blue.
            //other styles
          ),
          child: drawerAppBar(context, '', false)),
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Form(
            key: formKey,
            child:
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
                      validator: (val) {
                        return val.length >= 8
                            ? null
                            : "Please provide a password greater than 8 characters";
                      },
                      controller: pass,
                      obscureText: isHiddenPassword,
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
                child: FlatButton(
                  color: Colors.black,
                  onPressed: () {
                    // Navigate back to first route when tapped.
                    // Navigator.pop(context);
                    if (formKey.currentState.validate()) {
                      setAuth(context);
                      login();
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.05, size * 0.8, 0, 0),
            child: GestureDetector(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 12,
                        ),
                        Text(
                          "Go Back!",
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                }),
          ),
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
