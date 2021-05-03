import 'dart:convert';
import 'package:http/http.dart' as http;

class SneakerSplyrsAllProducts {
  Future<List<Map<String, dynamic>>> getSplyrsSneakersProducts(id) async {
    String ck = 'ck_1a9e8ec7286185b533ba558e23a735041e581be2';
    String cs = 'cs_c6dc42ba2dfc2bfcb2e42ab9be420083db6036bb';
    String splyrID = id;
    String numprod = "26";
    final String url = "https://sneakerxp.com/wp-json/wc/v2/products?vendor=" +
        splyrID +
        "&consumer_key=" +
        ck +
        "&consumer_secret=" +
        cs +
        "&per_page=" +
        numprod +
        "&status=publish";
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
