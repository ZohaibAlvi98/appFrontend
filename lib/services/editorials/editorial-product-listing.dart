import 'dart:convert';
import 'package:http/http.dart' as http;

class EditorialProducts {
  Future<List<Map<String, dynamic>>> getEditorialProducts(id) async {
    String postID = id;

    final String url =
        "https://splystyle.net/wp-json/geteditorialproducts/v1/get-editorial-products?id=" +
            postID;
    print('Editorial Product Listing API HITssssssssssss');

    final http.Response res = await http.get(
      url,
    );

    if (res.statusCode == 200) {
      print(res.body);
      // if(res.body=='No Related Products Found')
      // return
      return List<Map<String, dynamic>>.from(json.decode(res.body));
    } else {
      throw 'Something Went Wrong!';
    }
  }
}
