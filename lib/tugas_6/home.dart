import 'package:belajar_flutter/tugas_6/account.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 58,
        backgroundColor: Color(0xff2F6BFF),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: Icon(Icons.person, color: Colors.white),
              onPressed: () {
                // ========================= Navigator.push
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AccountPage()),
                );
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kategori",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 8),

            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 4,
                mainAxisSpacing: 8,
                mainAxisExtent: 106,
                children: [
                  // ELEKTRONIK
                  Column(
                    children: [
                      SizedBox(
                        width: 84,
                        height: 84,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff98A1BC).withAlpha(20),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Color(0xff98A1BC),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.speaker,
                              color: Color(0xff98A1BC),
                              size: 36,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("Elektronik", style: TextStyle(fontSize: 12)),
                    ],
                  ),

                  // PAKAIAN
                  Column(
                    children: [
                      Container(
                        width: 84,
                        height: 84,
                        decoration: BoxDecoration(
                          color: Color(0xffFF9B51).withAlpha(20),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xffFF9B51),
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.checkroom,
                            color: Color(0xffFF9B51),
                            size: 36,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("Pakaian", style: TextStyle(fontSize: 12)),
                    ],
                  ),

                  // SEPATU
                  Column(
                    children: [
                      Container(
                        width: 84,
                        height: 84,
                        decoration: BoxDecoration(
                          color: Color(0xff578FCA).withAlpha(20),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xff578FCA),
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.hiking,
                            color: Color(0xff578FCA),
                            size: 36,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("Sepatu", style: TextStyle(fontSize: 12)),
                    ],
                  ),

                  // TAS
                  Column(
                    children: [
                      Container(
                        width: 84,
                        height: 84,
                        decoration: BoxDecoration(
                          color: Color(0xffF16767).withAlpha(20),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xffF16767),
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.work_outline,
                            color: Color(0xffF16767),
                            size: 36,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("Tas", style: TextStyle(fontSize: 12)),
                    ],
                  ),

                  // FURNITURE
                  Column(
                    children: [
                      Container(
                        width: 84,
                        height: 84,
                        decoration: BoxDecoration(
                          color: Color(0xffFACC15).withAlpha(20),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xffFACC15),
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.chair_outlined,
                            color: Color(0xffFACC15),
                            size: 36,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("Furniture", style: TextStyle(fontSize: 12)),
                    ],
                  ),

                  // BUKU
                  Column(
                    children: [
                      Container(
                        width: 84,
                        height: 84,
                        decoration: BoxDecoration(
                          color: Color(0xffE2B59A).withAlpha(20),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xffE2B59A),
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.menu_book_outlined,
                            color: Color(0xffE2B59A),
                            size: 36,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("Buku", style: TextStyle(fontSize: 12)),
                    ],
                  ),

                  // HOBI
                  Column(
                    children: [
                      Container(
                        width: 84,
                        height: 84,
                        decoration: BoxDecoration(
                          color: Color(0xff758A93).withAlpha(20),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xff758A93),
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.sports_esports,
                            color: Color(0xff758A93),
                            size: 36,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("Hobi", style: TextStyle(fontSize: 12)),
                    ],
                  ),

                  // OTOMOTIF
                  Column(
                    children: [
                      Container(
                        width: 84,
                        height: 84,
                        decoration: BoxDecoration(
                          color: Color(0xffBBDCE5).withAlpha(20),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xffBBDCE5),
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.directions_car_outlined,
                            color: Color(0xffBBDCE5),
                            size: 36,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("Otomotif", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xffF8FAFC),
    );
  }
}
