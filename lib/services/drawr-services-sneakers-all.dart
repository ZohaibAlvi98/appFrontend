import 'dart:convert';
import 'package:http/http.dart' as http;

class DrawrServices {
  Future<List<Map<String, dynamic>>> getDrawrProducts(id) async {
    String ck = 'ck_1a9e8ec7286185b533ba558e23a735041e581be2';
    String cs = 'cs_c6dc42ba2dfc2bfcb2e42ab9be420083db6036bb';
    String catID = id;
    String numprod = "26";
    final String url =
        "https://sneakerxp.com/wp-json/wc/v3/products?consumer_key=" +
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
