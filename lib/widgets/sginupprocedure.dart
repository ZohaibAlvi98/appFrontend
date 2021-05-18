import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:splyxp/services/sprofile_edit.dart';
import 'package:splyxp/views/auth/login/login.dart';
import 'package:splyxp/services/signup_posting.dart';

class SignUpProc extends StatefulWidget {
  final String username;
  final String email;
  final String password;
  final String lastname;
  final String firstname;
  SignUpProc(
      {Key key,
      this.firstname,
      this.lastname,
      this.email,
      this.password,
      this.username})
      : super(key: key);
  @override
  _SignUpProcState createState() => _SignUpProcState();
}

class _SignUpProcState extends State<SignUpProc> {
  ProfileEdit _user;

  Future<SignUpPosting> createUser(
      {String username, String password, String email}) async {
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

    if (postResponse.statusCode == 200) {
      final String responseString = postResponse.body;

      return signUpPostingFromJson(responseString);
    } else {
      return null;
    }
  }

  Future<ProfileEdit> editProfileAtSignup(
      {String lastname, String firstname, int id}) async {
    String ck = 'ck_b851e9504f4012f059015f17142994a30800445a';
    String cs = 'cs_fd7852bae5792816821610a98dd59ae60d5ab983';
    final String url = 'https://splystyle.net/wp-json/wc/v2/customers/' +
        id.toString() +
        '?consumer_key=' +
        ck +
        '&consumer_secret=' +
        cs;

    final postResponse = await http.post(
      url,
      headers: <String, String>{'content-type': 'application/json'},
      body: jsonEncode(
          <String, String>{'first_name': firstname, 'last_name': lastname}),
    );

    if (postResponse.statusCode == 200) {
      final String responseString = postResponse.body;

      return profileEditFromJson(responseString);
    } else {
      return null;
    }
  }

  checkId() async {
    final SignUpPosting createdUser = await createUser(
      username: widget.username,
      email: widget.email,
      password: widget.password,
    );
    if (createdUser != null && createdUser.code == 200) {
      final ProfileEdit user = await editProfileAtSignup(
        firstname: widget.firstname,
        lastname: widget.lastname,
        id: createdUser.id,
      );
      if (user != null && user.id == createdUser.id) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return Login();
          },
        ));
      } else {
        AlertDialog(
          title: Text('Something went wrong!'),
          content: Text('Something went wrong, please try again.'),
        );
        Navigator.pop(context);
      }
    } else {
      AlertDialog(
        title: Text('Something went wrong!'),
        content: Text('Something went wrong, please try again.'),
      );
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    checkId();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
