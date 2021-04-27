import 'dart:convert';
import 'package:http/http.dart' as http;

class Stories {
  Future<List<Map<String, dynamic>>> getStories(id) async {
    String storyId = id;
    final String url =
        "https://splystyle.net/wp-json/getsplyrstories/v1/get-splyr-stories?id=" +
            storyId;
    print('Yes Stories Getting Successfully');

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
