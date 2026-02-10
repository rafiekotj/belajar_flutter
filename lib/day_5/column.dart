import 'package:flutter/material.dart';

class ColumnDay5 extends StatelessWidget {
  const ColumnDay5({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Posisi Tengah Halaman Kiri
      crossAxisAlignment: CrossAxisAlignment.end, // Posisi Tulisan Kiri
      children: [
          Text(
            "Nama : Rafie", 
            style: TextStyle(
              fontSize: 50
            ),
          ),
          Text(
            "Umur : 22 Tahun", 
            style: TextStyle(
              color: Colors.blue, 
              fontSize: 40, 
              fontWeight: FontWeight.bold
            ),
          ),
          Text("Pekerjaan : Mahasiswa"),
          Text("Halo, Saya Rafie"),
      ],
    );
  }
}