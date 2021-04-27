import 'dart:convert';
import 'package:http/http.dart' as http;

class DrawrProducts {
  Future<Map<String, dynamic>> getProducts(id) async {
    String prodID = id;

    String ck = 'ck_b851e9504f4012f059015f17142994a30800445a';
    String cs = 'cs_fd7852bae5792816821610a98dd59ae60d5ab983';

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
