import 'dart:convert';
import 'package:http/http.dart' as http;

class StylistLogo {
  Future<List<Map<String, dynamic>>> getStylistLogo() async {
    final String url =
        "https://splystyle.net/wp-json/getallstylists/v1/get-all-stylists";
    print('Success stylist');

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
