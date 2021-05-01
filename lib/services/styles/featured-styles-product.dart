import 'dart:convert';
import 'package:http/http.dart' as http;

class FeaturedStyleProducts {
  Future<List<Map<String, dynamic>>> getFeaturedStyleProducts(id) async {
    final String styleId = id;
    final String url =
        "https://splystyle.net/wp-json/getstyleprods/v1/get-style-prods?id=" +
            styleId;
    print('Featured Styles Products Api --> Success');

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
