import 'dart:convert';
import 'package:http/http.dart' as http;

class DrawrProducts {
  Future<Map<String, dynamic>> getProducts() async {
    String prodID = "26428";

    String ck = 'ck_dfa336f01dea059c26a82f16e1b547edf1fc7aa7';
    String cs = 'cs_2ad62fc78e4ec304311ede859aff8fc44a480646';

    // String numprod = "26";
    final String url = "https://splystyle.net/wp-json/wc/v2/products/" +
        prodID +
        "?consumer_key=" +
        ck +
        "&consumer_secret=" +
        cs +
        // "&category=" +
        // catID +
        // "&per_page=" +
        // // numprod +
        "&status=publish";
    print('Successfully Done');
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
