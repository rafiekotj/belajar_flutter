import 'dart:convert';
import 'dart:developer';

import 'package:belajar_flutter/tugas_14/models/anime_model.dart';
import 'package:http/http.dart' as http;

Future<List<GetAnime>> getUser() async {
  final response = await http.get(Uri.parse("https://api.jikan.moe/v4/anime"));

  log(response.body);
  if (response.statusCode == 200) {
    final List<dynamic> userJson = json.decode(response.body)["data"];
    return userJson.map((json) => GetAnime.fromJson(json)).toList();
  } else {
    throw Exception("Gagal memuat data");
  }
}
