import 'package:belajar_flutter/tugas_9/data/data_perabotan.dart';
import 'package:flutter/material.dart';

class Soal3Model extends StatefulWidget {
  const Soal3Model({super.key});

  @override
  State<Soal3Model> createState() => _Soal3ModelState();
}

class _Soal3ModelState extends State<Soal3Model> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Kategori Perabotan",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),

          Expanded(
            child: ListView.builder(
              itemCount: dataPerabotan.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final data = dataPerabotan[index];

                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  alignment: Alignment.centerLeft,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xffD4F6FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    leading: Image.network(
                      data.imageUrl ?? "",
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      data.nama ?? "",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(data.deskripsi ?? ""),
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
