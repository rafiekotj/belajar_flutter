import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PenggunaModel {
  final int? id;
  final String nama;
  final String email;
  final String phone;
  final String city;
  PenggunaModel({
    this.id,
    required this.nama,
    required this.email,
    required this.phone,
    required this.city,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
      'email': email,
      'phone': phone,
      'city': city,
    };
  }

  factory PenggunaModel.fromMap(Map<String, dynamic> map) {
    return PenggunaModel(
      id: map['id'] != null ? map['id'] as int : null,
      nama: map['nama'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      city: map['city'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PenggunaModel.fromJson(String source) =>
      PenggunaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
