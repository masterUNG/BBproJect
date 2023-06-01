import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String displayName;
  final String email;
  final String password;
  final String uid;
  final String urlAvatar;
  UserModel({
    required this.displayName,
    required this.email,
    required this.password,
    required this.uid,
    required this.urlAvatar,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'email': email,
      'password': password,
      'uid': uid,
      'urlAvatar': urlAvatar,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      displayName: (map['displayName'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      password: (map['password'] ?? '') as String,
      uid: (map['uid'] ?? '') as String,
      urlAvatar: (map['urlAvatar'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
