import 'dart:convert';
import 'package:http/http.dart' as http;

class FeaturedStyleListing {
  Future<List<Map<String, dynamic>>> getFeaturedStyleList() async {
    final String url =
        "https://splystyle.net/wp-json/getfeaturedsplystyles/v1/get-featured-splystyles";
    print('Featured Styles Api --> Success');

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
