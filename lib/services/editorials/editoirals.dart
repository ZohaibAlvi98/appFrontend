import 'dart:convert';
import 'package:http/http.dart' as http;

class Editorials {
  Future<List<Map<String, dynamic>>> getEditorials() async {
    final String url =
        "https://splystyle.net/wp-json/geteditorialslisting/v1/get-editorials-listing";

    print('Editorial Listing Page Success');

    final http.Response res = await http.get(
      url,
    );

    if (res.statusCode == 200) {
      print(res.body);

      return List<Map<String, dynamic>>.from(json.decode(res.body));
    } else {
      throw 'Something Went Wrong!';
    }
  }
}
