import 'dart:convert';
import 'package:http/http.dart' as http;

class SplyrVideos {
  Future<List<Map<String, dynamic>>> getvideos(id) async {
    String videoId = id;
    final String url =
        "https://splystyle.net/wp-json/getsplyrvideos/v1/get-splyr-videos?id=" +
            videoId;
    print('Yes Videos Getting Successfully');

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
