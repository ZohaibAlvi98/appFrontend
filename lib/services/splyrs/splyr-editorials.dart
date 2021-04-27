import 'dart:convert';
import 'package:http/http.dart' as http;

class SplyrEditorials {
  Future<List<Map<String, dynamic>>> getSplyrEditorials(id) async {
    String splyrId = id;
    final String url =
        "https://splystyle.net/wp-json/getsplyreditorials/v1/get-splyr-editorials?id=" +
            splyrId;

    print(' SPLYR Editorial Listing Page Success');

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
