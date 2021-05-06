import 'dart:convert';
import 'package:http/http.dart' as http;

class ShopperLogo {
  Future<List<Map<String, dynamic>>> getShopperLogo() async {
    final String url =
        "https://splystyle.net/wp-json/getallshoppers/v1/get-all-shoppers";
    print('Success');

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
