import 'dart:convert';
import 'package:http/http.dart' as http;

class VendorStyles {
  Future<List<Map<String, dynamic>>> getVendorStyles(id) async {
    String storyId = id;
    final String url =
        "https://splystyle.net/wp-json/getsplyrstyles/v1/get-splyr-styles?id=" +
            storyId;
    print('Yes Vendors Styles API Hit');

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
