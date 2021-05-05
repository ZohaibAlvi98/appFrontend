import 'dart:convert';
import 'package:http/http.dart' as http;

class VendorSplyrs {
  Future<List<Map<String, dynamic>>> getVendorSplyrs(id) async {
    String venorId = id;
    final String url =
        "https://splystyle.net/wp-json/getusersubscribedsplyrs/v1/get-user-subscribed-splyrs?id=" +
            venorId;
    print('Vendor Subscribers data success');

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
