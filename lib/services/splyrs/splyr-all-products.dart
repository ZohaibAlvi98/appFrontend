import 'dart:convert';
import 'package:http/http.dart' as http;

class SplyrsAllProducts {
  Future<List<Map<String, dynamic>>> getSplyrsAllProducts(id) async {
    String ck = 'ck_dfa336f01dea059c26a82f16e1b547edf1fc7aa7';
    String cs = 'cs_2ad62fc78e4ec304311ede859aff8fc44a480646';
    String splyrID = id;
    String numprod = "26";
    final String url = "https://splystyle.net/wp-json/wc/v2/products?vendor=" +
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
      // headers: <String, String>{
      //   'Content-Type': 'application/json',
      // },
      // body: jsonEncode(
      //   <String, String>{'name': '', 'city': '', 'search': '', 'country': ''},
      // )
    );

    if (res.statusCode == 200) {
      print(res.body);
      // List body = jsonDecode(res.body);
      // List<ArtistModel> artists =
      //     body.map((dynamic item) => ArtistModel.fromJson(item)).toList();
      // return artists;
      return List<Map<String, dynamic>>.from(json.decode(res.body));
    } else {
      throw 'Something Went Wrong!';
    }
  }
}
