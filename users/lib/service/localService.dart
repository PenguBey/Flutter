import 'package:http/http.dart'  as http;
import 'package:users/model/userModel.dart';

class LocalService {
    var client = http.Client();
    var uri = Uri.parse("http://192.168.56.1:8080/users.json");
  Future<List<User>?> getUsers() async{
    var response = await client.get(uri);
    if(response.statusCode == 200){
        var json = response.body;
        return userFromJson(json);
    }else{
      return null;
    }
  }

}