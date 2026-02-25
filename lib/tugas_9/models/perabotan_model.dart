// To parse this JSON data, do
//
//     final dataPerabotan = dataPerabotanFromJson(jsonString);

import 'dart:convert';

List<DataPerabotan> dataPerabotanFromJson(String str) =>
    List<DataPerabotan>.from(
      json.decode(str).map((x) => DataPerabotan.fromJson(x)),
    );

String dataPerabotanToJson(List<DataPerabotan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataPerabotan {
  String? nama;
  String? deskripsi;
  String? imageUrl;

  DataPerabotan({this.nama, this.deskripsi, this.imageUrl});

  factory DataPerabotan.fromJson(Map<String, dynamic> json) => DataPerabotan(
    nama: json["nama"],
    deskripsi: json["deskripsi"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "nama": nama,
    "deskripsi": deskripsi,
    "imageUrl": imageUrl,
  };
}
