import 'dart:convert';
import 'package:http/http.dart' as http;

class FeaturedStyleDetails {
  Future<List<Map<String, dynamic>>> getFeaturedStyleDetails(id) async {
    final String styleId = id;
    final String url =
        "https://splystyle.net/wp-json/getstyledetail/v1/get-style-detail?id=" +
            styleId;
    print('Featured Styles detail Api --> hits');

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
