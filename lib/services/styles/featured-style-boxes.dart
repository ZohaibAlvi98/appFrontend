import 'dart:convert';
import 'package:http/http.dart' as http;

class FeaturedStyleBoxes {
  Future<List<Map<String, dynamic>>> getFeaturedStyleBoxes() async {
    final String url =
        "https://splystyle.net/wp-json/getfeastyleboxes/v1/get-fea-style-boxes";
    print('Style Boxes Api -> Success');

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
