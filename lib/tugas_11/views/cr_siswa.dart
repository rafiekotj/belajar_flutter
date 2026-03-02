import 'package:belajar_flutter/tugas_10/components/custom_text_field.dart';
import 'package:belajar_flutter/tugas_10/extension/navigator.dart';
import 'package:belajar_flutter/tugas_11/database/siswa_controller.dart';
import 'package:belajar_flutter/tugas_11/models/siswa_model.dart';
import 'package:belajar_flutter/tugas_11/views/siswa_screen.dart';
import 'package:flutter/material.dart';

class CrSiswaScreen extends StatefulWidget {
  const CrSiswaScreen({super.key});

  @override
  State<CrSiswaScreen> createState() => _CrSiswaScreenState();
}

class _CrSiswaScreenState extends State<CrSiswaScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController kelasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                controller: nameController,
                hintText: "Masukkan Nama Siswa",
                prefixIcon: Icons.email_outlined,
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: kelasController,
                hintText: "Masukkan Kelas Siswa",
                prefixIcon: Icons.email_outlined,
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Nama belum di isi")),
                      );
                      return;
                    }
                    if (kelasController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Kelas belum di isi")),
                      );
                      return;
                    }
                    SiswaController.registerSiswa(
                      SiswaModel(
                        nama: nameController.text,
                        kelas: kelasController.text,
                      ),
                    );
                    nameController.clear();
                    kelasController.clear();
                    setState(() {});
                  },
                  child: Text("Tambah Siswa"),
                ),
              ),
              SizedBox(height: 24),
              SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.push(SiswaScreen());
                  },
                  child: Text("Lihat Data Siswa"),
                ),
              ),
              SizedBox(height: 24),
              Row(children: [Text("Data Siswa")]),
              SizedBox(height: 12),

              siswaWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

FutureBuilder<List<SiswaModel>> siswaWidget() {
  return FutureBuilder<List<SiswaModel>>(
    future: SiswaController.getAllSiswa(),

    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (!snapshot.hasData) {
        return CircularProgressIndicator();
      }
      final dataSiswa = snapshot.data as List<SiswaModel>;
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: dataSiswa.length,
        itemBuilder: (BuildContext context, int index) {
          final items = dataSiswa[index];
          return ListTile(title: Text(items.nama), subtitle: Text(items.kelas));
        },
      );
    },
  );
}
