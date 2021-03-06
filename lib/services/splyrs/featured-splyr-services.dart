import 'dart:convert';
import 'package:http/http.dart' as http;

class FeaturedSplyrs {
  Future<List<Map<String, dynamic>>> getFeaturedSplyrs() async {
    final String url =
        "https://splystyle.net/wp-json/getfeaturedsplyrs/v1/get-featured-splyrs";

    print('SUCCESS');

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
