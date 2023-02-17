// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
class User {
  final String username;
  final String phonenumber;
  final String email;
  final String password;
  User({
    required this.username,
    required this.phonenumber,
    required this.email,
    required this.password,
  });

  

  User copyWith({
    String? username,
    String? phonenumber,
    String? email,
    String? password,
  }) {
    return User(
      username: username ?? this.username,
      phonenumber: phonenumber ?? this.phonenumber,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'phonenumber': phonenumber,
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] as String,
      phonenumber: map['phonenumber'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(username: $username, phonenumber: $phonenumber, email: $email, password: $password)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.phonenumber == phonenumber &&
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode {
    return username.hashCode ^
      phonenumber.hashCode ^
      email.hashCode ^
      password.hashCode;
  }
}
