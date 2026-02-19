import 'package:flutter/material.dart';

class Tugas5Flutter extends StatefulWidget {
  const Tugas5Flutter({super.key});

  @override
  State<Tugas5Flutter> createState() => _Tugas5FlutterState();
}

class _Tugas5FlutterState extends State<Tugas5Flutter> {
  bool _nama = false;
  bool _clickIcon = false;
  bool _detailInfo = false;
  bool _touchBox = false;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil Pengguna",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff2F6BFF),
        centerTitle: true,
      ),
      // ======================== SOAL NO 6
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter--;
          });
        },
        backgroundColor: Color(0xffEF4444),
        child: Icon(
          Icons.remove,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ======================== SOAL NO 1
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 64,
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _nama = !_nama;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff2F6BFF),
                            foregroundColor: Colors.white,
                          ),
                          child: Text(
                            "Buka Profil",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: 16),
                        if (_nama)
                          Text(
                            "Nama: Rafie\nKelas: App Developer\nAlamat: Jakarta",
                          ),
                      ],
                    ),
                  ),

                  // ======================== SOAL NO 2
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (_clickIcon) Text("Tersimpan!"),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _clickIcon = !_clickIcon;
                          });
                        },
                        icon: Icon(
                          Icons.bookmark,
                          color: _clickIcon ? Color(0xffEF4444) : Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  // ======================== SOAL NO 3
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _detailInfo = !_detailInfo;
                      });
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Color(0xff2F6BFF),
                    ),
                    child: Text("Lihat Selengkapnya"),
                  ),
                  if (_detailInfo)
                    Text(
                      "Nama saya Rafie. Saya adalah seorang App Developer. Saat ini saya tinggal di Jakarta. Saya memiliki minat dalam pengembangan aplikasi mobile.",
                      textAlign: TextAlign.justify,
                    ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // ======================== SOAL NO 4
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _touchBox = !_touchBox;
                        print("Kotak berhasil disentuh!");
                      });
                    },
                    borderRadius: BorderRadius.circular(8),
                    splashColor: Color(0xff2F6BFF),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff2F6BFF), width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Follow",
                        style: TextStyle(color: Color(0xff2F6BFF)),
                      ),
                    ),
                  ),
                  if (_touchBox) Text("Anda sedang mengikuti"),
                ],
              ),
            ),
            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ======================== SOAL NO 5
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _counter++;
                      print("Ditekan Sekali");
                    });
                  },
                  onDoubleTap: () {
                    setState(() {
                      _counter += 2;
                      print("Ditekan Dua Kali");
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      _counter += 3;
                      print("Tahan Lama");
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    color: Color(0xff22C55E),
                    child: Text(
                      "Tekan untuk memberikan uang",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                "Jumlah Uang: \$${_counter.toString()}",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xffF4F7FF),
    );
  }
}
