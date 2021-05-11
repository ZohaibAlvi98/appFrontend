import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchByKeywords {
  Future<List<Map<String, dynamic>>> getKeywordResults(searchKeword) async {
    String ck = 'ck_b851e9504f4012f059015f17142994a30800445a';
    String cs = 'cs_fd7852bae5792816821610a98dd59ae60d5ab983';
    String numprod = "40";
    String keyword = searchKeword;
    final String url =
        "https://splystyle.net/wp-json/wc/v2/products?consumer_key=" +
            ck +
            "&consumer_secret=" +
            cs +
            "&per_page=" +
            numprod +
            "&status=publish" +
            "&search=" +
            keyword;
    print('Search By Keywords Hit');

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
