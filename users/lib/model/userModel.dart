
import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    int userId;
    String userName;
    String passWord;
    String name;

    User({
        required this.userId,
        required this.userName,
        required this.passWord,
        required this.name,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"],
        userName: json["userName"],
        passWord: json["passWord"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "userName": userName,
        "passWord": passWord,
        "name": name,
    };
}
