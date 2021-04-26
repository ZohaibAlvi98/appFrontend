import 'dart:convert';
import 'package:http/http.dart' as http;

class EditorialsDetail {
  Future<List<Map<String, dynamic>>> getEditorialsDetail(postid) async {
    String id = postid;
    final String url =
        "https://splystyle.net/wp-json/geteditorialdetail/v1/get-editorial-detail?id=" +
            id;

    print('Editorial Detail Page Success');

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
