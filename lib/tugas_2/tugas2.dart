import 'package:flutter/material.dart';

class Tugas2Flutter extends StatelessWidget {
  const Tugas2Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ======================== SOAL NO 1
      appBar: AppBar(
        backgroundColor: Color(0xff3776A1),
        title: Text(
          "Profil Aplikasi",
          style: TextStyle(
            color: Color(0xffFFFFFF),
            fontWeight: FontWeight.w800
          ),
        ),
        centerTitle: true,
      ),

      // ======================== SOAL NO 2
      body: Column(
        children: [
          Center(
            child: Text(
              "Rentora",
              style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w800,
                color: Color(0xff2563EB),
              ),
            ),
          ),

      // ======================== SOAL NO 3
          Container(
            padding: EdgeInsets.all(16),
            child: 
            Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.mail,
                      color: Color(0xffCFAB8D),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "rentoraapp@rentora.com",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Color(0xff9FB3DF),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "rentora_app",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),

      // ======================== SOAL NO 4
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("No. Telepon: ", style: TextStyle(fontSize: 20)),
                    Spacer(),
                    Text("0888-1111-2222", style: TextStyle(fontSize: 20))
                  ],
                ),
                Row(
                  children: [
                    Text("Lokasi: ", style: TextStyle(fontSize: 20)),
                    Spacer(),
                    Text("Jakarta, Indonesia", style: TextStyle(fontSize: 20)),
                  ],
                ),

      // ======================== SOAL NO 5
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xff155790),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Text("Customer Service", textAlign: TextAlign.center, style: TextStyle(color: Color(0xffFFFFFF))),
                      )
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xff88CBFA),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Text("Instagram", textAlign: TextAlign.center, style: TextStyle(color: Color(0xffFFFFFF))),
                      )
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xff78B6FA),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Text("Facebook", textAlign: TextAlign.center, style: TextStyle(color: Color(0xffFFFFFF))),
                      )
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xff5AA2F6),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Text("Twitter", textAlign: TextAlign.center, style: TextStyle(color: Color(0xffFFFFFF))),
                      )
                    ),
                  ],
                ),

      // ======================== SOAL NO 6
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: 
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: Color(0xff0B8DA1),
                            borderRadius: BorderRadius.circular(8)
                            ),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              "Rentora hadir sebagai platform mobile yang menghubungkan penyewa dan pemilik barang dalam satu aplikasi. Rentora mempermudah proses pencarian, penyewaan, hingga pengembalian barang secara cepat dan transparan sesuai kebutuhan pengguna.",
                              style: TextStyle(color: Color(0xffFFFFFF))
                            ),
                          ),
                        ),
                    ),
                  ],
                ),

      // ======================== SOAL NO 7
                SizedBox(height: 20),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Color(0xffA4C3D2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Image.asset("assets/images/rentora_logo.png")
                    ),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xffFBF9F1),
    );
  }
}