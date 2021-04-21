import 'dart:convert';
import 'package:http/http.dart' as http;

class LogoAndBanner {
  Future<List<Map<String, dynamic>>> getSplyrLogoAndBanner(id) async {
    String reqId = id;
    final String url =
        "https://splystyle.net/wp-json/getsplyrimages/v1/get-splyr-images?id=" +
            reqId;

    print('Success');
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
