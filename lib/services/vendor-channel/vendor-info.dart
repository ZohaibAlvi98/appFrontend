import 'dart:convert';
import 'package:http/http.dart' as http;

class VendorInfo {
  Future<Map<String, dynamic>> getVendorInfo(id) async {
    String venorId = id;
    final String url =
        "https://splystyle.net/wp-json/getstylistlangbrand/v1/get-stylist-lang-brand?id=" +
            venorId;
    print('Success info data');

    final http.Response res = await http.get(
      url,
    );

    if (res.statusCode == 200) {
      print(res.body);

      return Map<String, dynamic>.from(json.decode(res.body));
    } else {
      throw 'Something Went Wrong!';
    }
  }
}
