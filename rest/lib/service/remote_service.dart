import 'dart:io';

import 'package:rest/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  var client = http.Client();
  var uri = Uri.parse('http://192.168.243.1:8080/test.json');

  Future<List<Post>?> getPosts() async {
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}
