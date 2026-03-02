// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final int? id;
  final String? email;
  final String? password;

  UserModel({this.id, this.email, this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'email': email, 'password': password};
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as int : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserModel copyWith({int? id, String? email, String? password}) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() => 'UserModel(id: $id, email: $email, password: $password)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.email == email && other.password == password;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode ^ password.hashCode;
}
