// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gender': gender,
      'email': email,
      'phone': phone,
      'cell': cell,
      'nat': nat,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      gender: map['gender'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      cell: map['cell'] as String,
      nat: map['nat'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
