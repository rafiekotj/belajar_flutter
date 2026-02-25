import 'package:belajar_flutter/constant/app_color.dart';
import 'package:flutter/material.dart';

class Soal1List extends StatefulWidget {
  const Soal1List({super.key});

  @override
  State<Soal1List> createState() => _Soal1ListState();
}

class _Soal1ListState extends State<Soal1List> {
  final List<String> kategori = [
    "Buah-buahan",
    "Sayuran",
    "Elektronik",
    "Pakaian Pria",
    "Pakaian Wanita",
    "Alat Tulis Kantor",
    "Buku & Majalah",
    "Peralatan Dapur",
    "Makanan Ringan",
    "Minuman",
    "Mainan Anak",
    "Peralatan Olahraga",
    "Produk Kesehatan",
    "Kosmetik",
    "Obat-obatan",
    "Aksesoris Mobil",
    "Perabot Rumah",
    "Sepatu & Sandal",
    "Barang Bekas",
    "Voucher & Tiket",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "List Kategori",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: kategori.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 12),
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColor.successSoft,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Kategori ${index + 1} : ${kategori[index]}",
                    style: TextStyle(fontSize: 16),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
