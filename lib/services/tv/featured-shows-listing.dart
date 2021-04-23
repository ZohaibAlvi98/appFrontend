import 'dart:convert';
import 'package:http/http.dart' as http;

class ShowsListing {
  Future<List<Map<String, dynamic>>> getShowsListing() async {
    final String url =
        "https://splystyle.net/wp-json/getshowslisting/v1/get-shows-listing";
    print('TV SHOWS LISTING Api -> Success');

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
