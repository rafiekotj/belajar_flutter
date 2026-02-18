import 'package:flutter/material.dart';

class Tugas3Flutter extends StatelessWidget {
  const Tugas3Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tambahkan Barang",
          style: TextStyle(color: Color(0xffFFFFFF)),
        ),
        backgroundColor: Color(0xff166534),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        // ============================= SOAL NO 1
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ============================= SOAL NO 2
              TextField(decoration: InputDecoration(labelText: "Nama Barang")),
              SizedBox(height: 16),
              TextField(decoration: InputDecoration(labelText: "Harga Sewa")),
              SizedBox(height: 16),
              TextField(decoration: InputDecoration(labelText: "Deskripsi")),
              SizedBox(height: 16),
              TextField(decoration: InputDecoration(labelText: "Stok")),
              SizedBox(height: 24),
              Text(
                "Pilih Warna",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              // ============================= SOAL NO 3
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  Container(
                    color: Colors.blue,
                    // ============================= SOAL NO 4
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: Text(
                            "Biru Muda",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.indigo,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: Text(
                            "Indigo",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.yellow,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: Text(
                            "Kuning",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.orange,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: Text(
                            "Orange",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.lightGreen,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: Text(
                            "Hijau Muda",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: Text(
                            "Hijau",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: Text(
                            "Merah",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.purple,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: Text(
                            "Ungu",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.teal,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: Text(
                            "Teal",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              addButton(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xffECFDF5),
    );
  }

  Container addButton() {
    return Container(
      height: 44,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff166534),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            "Tambah Produk",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
