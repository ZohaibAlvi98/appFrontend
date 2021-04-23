import 'dart:convert';
import 'package:http/http.dart' as http;

class StylesContent {
  Future<List<Map<String, dynamic>>> getStylesContent() async {
    final String url =
        "https://splystyle.net/wp-json/getappgeneralcontent/v1/get-app-general-content?page=styles";
    print('Styles Page API SUCCESS');

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
