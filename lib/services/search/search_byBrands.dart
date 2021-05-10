import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchByBrands {
  Future<List<Map<String, dynamic>>> getBrands() async {
    final String url =
        "https://splystyle.net/wp-json/getallbrandslist/v1/get-all-brands-list";
    print('Search By Brands list Hit');

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
