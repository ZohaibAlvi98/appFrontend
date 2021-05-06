import 'dart:convert';
import 'package:http/http.dart' as http;

class AllSplyrs {
  Future<List<Map<String, dynamic>>> getAllSplyrs() async {
    String ck = 'ck_b851e9504f4012f059015f17142994a30800445a';
    String cs = 'cs_fd7852bae5792816821610a98dd59ae60d5ab983';

    String numprod = "20";
    final String url = "https://splystyle.net/wp-json/wcmp/v1/vendors?" +
        "&consumer_key=" +
        ck +
        "&consumer_secret=" +
        cs +
        "&per_page=" +
        numprod +
        "&status=publish";
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
