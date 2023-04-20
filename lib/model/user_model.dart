import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String displayName;
  final String email;
  final String password;
  final String uid;
  UserModel({
    required this.displayName,
    required this.email,
    required this.password,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'email': email,
      'password': password,
      'uid': uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      displayName: (map['displayName'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      password: (map['password'] ?? '') as String,
      uid: (map['uid'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserModel copyWith({
    String? displayName,
    String? email,
    String? password,
    String? uid,
  }) {
    return UserModel(
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      password: password ?? this.password,
      uid: uid ?? this.uid,
    );
  }

  @override
  String toString() {
    return 'UserModel(displayName: $displayName, email: $email, password: $password, uid: $uid)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.displayName == displayName &&
      other.email == email &&
      other.password == password &&
      other.uid == uid;
  }

  @override
  int get hashCode {
    return displayName.hashCode ^
      email.hashCode ^
      password.hashCode ^
      uid.hashCode;
  }
}
