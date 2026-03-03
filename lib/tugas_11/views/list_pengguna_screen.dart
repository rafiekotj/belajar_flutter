import 'package:belajar_flutter/constant/app_color.dart';
import 'package:belajar_flutter/tugas_10/components/custom_text_field.dart';
import 'package:belajar_flutter/tugas_10/extension/navigator.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter/tugas_11/database/pengguna_controller.dart';
import 'package:belajar_flutter/tugas_11/models/pengguna_model.dart';

class ListPenggunaScreen extends StatefulWidget {
  const ListPenggunaScreen({super.key});

  @override
  State<ListPenggunaScreen> createState() => _ListPenggunaScreenState();
}

class _ListPenggunaScreenState extends State<ListPenggunaScreen> {
  late List<PenggunaModel> dataPengguna = [];
  @override
  void initState() {
    super.initState();
    getDataPengguna();
  }

  Future<void> getDataPengguna() async {
    await Future.delayed(Duration(seconds: 3));
    dataPengguna = await PenggunaController.getAllPengguna();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 58,
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.textOnPrimary,
        centerTitle: true,
        title: Text(
          "Data Pengguna",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: dataPengguna.isEmpty || dataPengguna == []
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                itemCount: dataPengguna.length,
                itemBuilder: (BuildContext context, int index) {
                  final items = dataPengguna[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.account_circle_outlined,
                              size: 22,
                              color: AppColor.secondary,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                items.nama,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                await showEditDialog(context, items);
                                dataPengguna =
                                    await PenggunaController.getAllPengguna();
                                setState(() {});
                              },
                              icon: Icon(Icons.edit, color: AppColor.warning),
                            ),
                            IconButton(
                              onPressed: () async {
                                await showDeleteDialog(context, items.id!);
                                dataPengguna =
                                    await PenggunaController.getAllPengguna();
                                setState(() {});
                              },
                              icon: Icon(Icons.delete, color: AppColor.error),
                            ),
                          ],
                        ),

                        SizedBox(height: 12),
                        Divider(height: 1),
                        SizedBox(height: 12),

                        Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              size: 18,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                items.email,
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 8),

                        Row(
                          children: [
                            Icon(
                              Icons.phone_outlined,
                              size: 18,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 8),
                            Text(items.phone, style: TextStyle(fontSize: 14)),
                          ],
                        ),

                        SizedBox(height: 8),

                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 18,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 8),
                            Text(items.city, style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
      backgroundColor: AppColor.backgroundLight,
    );
  }

  Future<void> showEditDialog(BuildContext context, PenggunaModel items) async {
    final nameController = TextEditingController(text: items.nama);
    final emailController = TextEditingController(text: items.email);
    final phoneController = TextEditingController(text: items.phone);
    final cityController = TextEditingController(text: items.city);

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColor.backgroundLight,
          title: Text("Edit Pengguna"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                controller: nameController,
                hintText: "Masukkan Nama",
              ),
              SizedBox(height: 8),
              CustomTextField(
                controller: emailController,
                hintText: "Masukkan Email",
              ),
              SizedBox(height: 8),
              CustomTextField(
                controller: phoneController,
                hintText: "Masukkan Nomor Telepon",
              ),
              SizedBox(height: 8),
              CustomTextField(
                controller: cityController,
                hintText: "Masukkan Asal Kota",
              ),
              SizedBox(height: 20),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text("Batal", style: TextStyle(color: AppColor.primary)),
            ),
            ElevatedButton(
              onPressed: () async {
                if (items.id == null) {
                  return;
                }
                await PenggunaController.updatePengguna(
                  PenggunaModel(
                    id: items.id,
                    nama: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                    city: cityController.text,
                  ),
                );
                context.pop();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Pengguna di update")));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Simpan",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> showDeleteDialog(BuildContext context, int id) async {
    final confirm = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColor.backgroundLight,
          title: Text("Konfirmasi"),
          content: Text("Apakah anda ingin menghapus data ini?"),
          actions: [
            TextButton(
              onPressed: () {
                context.pop(false);
              },
              child: Text("Batal", style: TextStyle(color: AppColor.primary)),
            ),
            ElevatedButton(
              onPressed: () async {
                context.pop(true);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.error,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Hapus",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      await PenggunaController.deletePengguna(id);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Data berhasil dihapus")));
      setState(() {});
    }
  }
}
