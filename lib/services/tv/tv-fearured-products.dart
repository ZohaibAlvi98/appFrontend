import 'dart:convert';
import 'package:http/http.dart' as http;

class FeaturedProducts {
  Future<List<Map<String, dynamic>>> getFeaturedTvProducts(id) async {
    String ck = 'ck_b851e9504f4012f059015f17142994a30800445a';
    String cs = 'cs_fd7852bae5792816821610a98dd59ae60d5ab983';
    String catID = id;
    String numprod = "12";
    final String url =
        "https://splystyle.net/wp-json/wc/v2/products?consumer_key=" +
            ck +
            "&consumer_secret=" +
            cs +
            "&category=" +
            catID +
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
