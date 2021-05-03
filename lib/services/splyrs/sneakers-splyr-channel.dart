import 'dart:convert';
import 'package:http/http.dart' as http;

class SneakerSplyrsChannel {
  Future<Map<String, dynamic>> getSneakerSplyrChannel(id) async {
    String ck = 'ck_1a9e8ec7286185b533ba558e23a735041e581be2';
    String cs = 'cs_c6dc42ba2dfc2bfcb2e42ab9be420083db6036bb';
    String splyrID = id;
    // String numprod = "4";
    final String url = "https://sneakerxp.com/wp-json/wcmp/v1/vendors/" +
        splyrID +
        "?consumer_key=" +
        ck +
        "&consumer_secret=" +
        cs;
    print('Oh Yes');
    // print(page);

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
