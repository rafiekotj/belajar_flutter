import 'package:flutter/material.dart';

class Tugas1Flutter extends StatelessWidget {
  const Tugas1Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff90AB8B),
        title: Text("Profil Saya"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nama Lengkap
          Text(
            "Nama: Rafie Aliefa Khana Kotjek",
            style: TextStyle(
              fontSize: 26,
              color: Color(0xff3291B6),
            ),
          ),
          // Lokasi
          Row(
            children: [
            Icon(
              Icons.location_on,
              color: Color(0xffBF4646),
            ),
            Text(
              "Jakarta Barat",
              style: TextStyle(
                color: Color(0xffEFB036)
              ),
            ),
            ],
          ),
          // Deskripsi Singkat
          Text(
            "Seorang pelajar yang sedang belajar Flutter.",
            style: TextStyle(
              fontSize: 10,
              color: Color(0xff295F98)
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xffEBF4DD),
    );
  }
}