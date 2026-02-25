import 'package:flutter/material.dart';

class Soal2ListMap extends StatefulWidget {
  const Soal2ListMap({super.key});

  @override
  State<Soal2ListMap> createState() => _Soal2ListMapState();
}

class _Soal2ListMapState extends State<Soal2ListMap> {
  final List<Map<String, dynamic>> kategori = [
    {"nama": "Buah-buahan", "icon": Icons.apple},
    {"nama": "Sayuran", "icon": Icons.eco},
    {"nama": "Elektronik", "icon": Icons.devices},
    {"nama": "Pakaian Pria", "icon": Icons.man},
    {"nama": "Pakaian Wanita", "icon": Icons.woman},
    {"nama": "Alat Tulis Kantor", "icon": Icons.edit},
    {"nama": "Buku & Majalah", "icon": Icons.menu_book},
    {"nama": "Peralatan Dapur", "icon": Icons.kitchen},
    {"nama": "Makanan Ringan", "icon": Icons.fastfood},
    {"nama": "Minuman", "icon": Icons.local_drink},
    {"nama": "Mainan Anak", "icon": Icons.toys},
    {"nama": "Peralatan Olahraga", "icon": Icons.sports_soccer},
    {"nama": "Produk Kesehatan", "icon": Icons.health_and_safety},
    {"nama": "Kosmetik", "icon": Icons.brush},
    {"nama": "Obat-obatan", "icon": Icons.medical_services},
    {"nama": "Aksesoris Mobil", "icon": Icons.directions_car},
    {"nama": "Perabot Rumah", "icon": Icons.chair},
    {"nama": "Sepatu & Sandal", "icon": Icons.shopping_bag},
    {"nama": "Barang Bekas", "icon": Icons.recycling},
    {"nama": "Voucher & Tiket", "icon": Icons.confirmation_number},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "Kategori",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),

          Expanded(
            child: ListView.builder(
              itemCount: kategori.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final data = kategori[index];
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xffDEECFC),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(data["nama"], style: TextStyle(fontSize: 16)),
                    leading: Icon(
                      data["icon"],
                      size: 32,
                      color: Color(0xff87A8D0),
                    ),
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
