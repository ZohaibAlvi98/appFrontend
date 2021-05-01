import 'dart:convert';
import 'package:http/http.dart' as http;

class SplyrStyleDetail {
  Future<List<Map<String, dynamic>>> getSplyrStyleDetail(id) async {
    String prodID = id;

    // String numprod = "26";
    final String url =
        "https://splystyle.net/wp-json/getsplyrstyledetail/v1/get-splyr-style-detail?style_id=" +
            prodID;

    print('Successfully Done');
    // print(page);

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
