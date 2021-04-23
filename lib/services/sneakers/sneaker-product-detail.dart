import 'dart:convert';
import 'package:http/http.dart' as http;

class SneakerProductDetail {
  Future<Map<String, dynamic>> getSneakerProductDetail(id) async {
    String prodID = id;

    String ck = 'ck_13f0f0565a1fe054e5275e937988bb73f17590a4';
    String cs = 'cs_7548929da505bb246d7a11d76007cc465e3ce572';

    final String url = "https://sneakerxp.com/wp-json/wc/v3/products/" +
        prodID +
        "?consumer_key=" +
        ck +
        "&consumer_secret=" +
        cs;
    print('Sneakers Detail API Hit');

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
