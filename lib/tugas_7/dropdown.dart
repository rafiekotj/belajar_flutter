import 'package:flutter/material.dart';

class DropdownPage extends StatefulWidget {
  const DropdownPage({super.key});

  @override
  State<DropdownPage> createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
  final List<String> _kategori = [
    "Elektronik",
    "Pakaian",
    "Makanan",
    "Lainnya",
  ];

  String? _selectedKategori;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton<String>(
              hint: Text("Pilih Kategori"),
              value: _selectedKategori,
              items: _kategori.map((String item) {
                return DropdownMenuItem<String>(value: item, child: Text(item));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedKategori = newValue;
                });
              },
            ),

            SizedBox(height: 20),

            if (_selectedKategori != null)
              Text(
                "Anda memilih kategori: $_selectedKategori",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
