import 'dart:convert';
import 'package:http/http.dart' as http;

class TVshowContent {
  Future<List<Map<String, dynamic>>> getTVContent(id) async {
    final String url =
        "https://splystyle.net/wp-json/getshowdetail/v1/get-show-detail?id=$id";
    print('TV Page API SUCCESS');

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
