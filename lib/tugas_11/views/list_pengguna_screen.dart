import 'package:belajar_flutter/constant/app_color.dart';
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
}
