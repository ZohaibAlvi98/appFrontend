import 'dart:convert';
import 'package:http/http.dart' as http;

class DrawrServices {
  Future<List<Map<String, dynamic>>> getFeaturedSplyrs() async {
    // String ck = 'ck_13f0f0565a1fe054e5275e937988bb73f17590a4';
    // String cs = 'cs_7548929da505bb246d7a11d76007cc465e3ce572';
    // String catID = id;
    // String numprod = "4";
    final String url =
        "https://splystyle.net/wp-json/getfeaturedsplyrs/v1/get-featured-splyrs";
    // consumer_key=" +
    //     ck +
    //     "&consumer_secret=" +
    //     cs +
    //     "&category=" +
    //     catID +
    //     "&per_page=" +
    //     numprod +
    //     "&status=publish";
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
