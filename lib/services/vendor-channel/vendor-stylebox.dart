import 'dart:convert';
import 'package:http/http.dart' as http;

class VendorStyleBox {
  Future<List<Map<String, dynamic>>> getVendorStyleBox(id) async {
    String venorId = id;
    final String url =
        "https://splystyle.net/wp-json/getuserstyleboxes/v1/get-user-style-boxes?id=" +
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
