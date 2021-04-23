import 'dart:convert';
import 'package:http/http.dart' as http;

class SplyrContent {
  Future<List<Map<String, dynamic>>> getSplyrContent() async {
    final String url =
        "https://splystyle.net/wp-json/getappgeneralcontent/v1/get-app-general-content?page=shop";
    print('Splyr Page API SUCCESS');

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
