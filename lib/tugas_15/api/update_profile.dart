import 'dart:convert';
import 'dart:developer';

import 'package:belajar_flutter/tugas_11/database/preference.dart';
import 'package:belajar_flutter/tugas_15/api/endpoint.dart';
import 'package:belajar_flutter/tugas_15/model/get_model.dart';
import 'package:http/http.dart' as http;

Future<GetUserModel?> updateProfile({required String name}) async {
  final token = await PreferenceHandler.getToken();
  final response = await http.put(
    Uri.parse(Endpoint.profile),
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token ?? ''}",
    },
    body: jsonEncode({"name": name}),
  );

  log(response.body);
  if (response.statusCode == 200) {
    return GetUserModel.fromJson(json.decode(response.body));
  }

  final error = GetUserModel.fromJson(json.decode(response.body));
  log(error.toString());
  throw Exception(error.message ?? 'Gagal memperbarui profile');
}
