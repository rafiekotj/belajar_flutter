import 'package:flutter/material.dart';

class Tugas4Flutter extends StatelessWidget {
  const Tugas4Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kategori Elektronik",
          style: TextStyle(color: Color(0xffFFFFFF)),
        ),
        backgroundColor: Color(0xff1E3A8A),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        // ============================= SOAL NO 1
        child: ListView(
          children: [
            // ============================= SOAL NO 2
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xffDBEAFE),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "Nama Barang"),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(labelText: "Rentang Harga"),
                  ),
                  SizedBox(height: 16),
                  TextField(decoration: InputDecoration(labelText: "Lokasi")),
                  SizedBox(height: 16),
                  TextField(decoration: InputDecoration(labelText: "Rating")),
                  SizedBox(height: 16),
                  searchButton(),
                ],
              ),
            ),

            SizedBox(height: 24),
            // ============================= SOAL NO 3
            Text(
              "List Produk",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              tileColor: Color(0xffDBEAFE),
              leading: Icon(Icons.speaker),
              title: Text(
                "Speaker JBL Go 4",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Rp829.000"),
            ),
            SizedBox(height: 8),
            ListTile(
              tileColor: Color(0xffBFDBFE),
              leading: Icon(Icons.camera_alt),
              title: Text(
                "Kamera Canon EOS 1000D",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Rp1.300.000"),
            ),
            SizedBox(height: 8),
            ListTile(
              tileColor: Color(0xffDBEAFE),
              leading: Icon(Icons.propane),
              title: Text(
                "Xiaomi Robot Vacuum E5",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Rp1.300.000"),
            ),
            SizedBox(height: 8),
            ListTile(
              tileColor: Color(0xffBFDBFE),
              leading: Icon(Icons.gas_meter),
              title: Text(
                "Philips Air Fryer",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Rp830.000"),
            ),
            SizedBox(height: 8),
            ListTile(
              tileColor: Color(0xffDBEAFE),
              leading: Icon(Icons.headphones),
              title: Text(
                "Sony WH-1000XM5",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Rp4.999.000"),
            ),
            SizedBox(height: 8),
            ListTile(
              tileColor: Color(0xffBFDBFE),
              leading: Icon(Icons.speaker),
              title: Text(
                "JBL Charge 5",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Rp2.499.000"),
            ),
            SizedBox(height: 8),
            ListTile(
              tileColor: Color(0xffDBEAFE),
              leading: Icon(Icons.camera_alt),
              title: Text(
                "Canon EOS M50",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Rp8.750.000"),
            ),
            SizedBox(height: 8),
            ListTile(
              tileColor: Color(0xffBFDBFE),
              leading: Icon(Icons.laptop),
              title: Text(
                "MacBook Air M1",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Rp13.999.000"),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xffEFF6FF),
    );
  }

  Container searchButton() {
    return Container(
      height: 44,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff155790),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            "Cari",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
