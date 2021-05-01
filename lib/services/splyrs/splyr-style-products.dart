import 'dart:convert';
import 'package:http/http.dart' as http;

class SplyrStyleProducts {
  Future<List<Map<String, dynamic>>> getSplyrStyleProducts(id) async {
    String productId = id;
    final String url =
        "https://splystyle.net/wp-json/getsplyrstylesproductsinfo/v1/get-splyr-styles-products-info?products=" +
            productId;
    print('Yes Vendors Styles Product API Hit');

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
