import 'dart:convert';
import 'package:http/http.dart' as http;

class AllSplyrs {
  Future<List<Map<String, dynamic>>> getAllSplyrs(id) async {
    String ck = 'ck_dfa336f01dea059c26a82f16e1b547edf1fc7aa7';
    String cs = 'cs_2ad62fc78e4ec304311ede859aff8fc44a480646';
    String splyrID = id;
    String numprod = "50";
    final String url = "https://splystyle.net/wp-json/wcmp/v1/vendors?" +
        splyrID +
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
