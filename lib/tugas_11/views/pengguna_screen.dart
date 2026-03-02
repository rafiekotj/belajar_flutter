import 'package:belajar_flutter/constant/app_color.dart';
import 'package:belajar_flutter/tugas_10/components/custom_text_field.dart';
import 'package:belajar_flutter/tugas_11/database/pengguna_controller.dart';
import 'package:belajar_flutter/tugas_11/models/pengguna_model.dart';
import 'package:belajar_flutter/tugas_11/views/list_pengguna_screen.dart';
import 'package:belajar_flutter/tugas_10/extension/navigator.dart';
import 'package:flutter/material.dart';

class PenggunaScreen extends StatefulWidget {
  const PenggunaScreen({super.key});

  @override
  State<PenggunaScreen> createState() => _PenggunaScreenState();
}

class _PenggunaScreenState extends State<PenggunaScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Form Tambah Pengguna",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                CustomTextField(
                  controller: nameController,
                  hintText: "Masukkan Nama",
                  prefixIcon: Icons.account_circle_outlined,
                  validator: (value) {
                    final name = value?.trim() ?? "";

                    if (name.isEmpty) {
                      return "Nama tidak boleh kosong";
                    }

                    if (name.length < 2) {
                      return "Nama minimal 2 karakter";
                    }

                    final regex = RegExp(r'^[a-zA-Z\s]+$');
                    if (!regex.hasMatch(name)) {
                      return "Nama hanya boleh huruf dan spasi";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 8),
                CustomTextField(
                  controller: emailController,
                  hintText: "Masukkan Email",
                  prefixIcon: Icons.email_outlined,
                  validator: (value) {
                    final email = value?.trim() ?? "";

                    if (email.isEmpty) {
                      return "Email tidak boleh kosong";
                    }

                    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                    if (!regex.hasMatch(email)) {
                      return "Format email tidak valid";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 8),
                CustomTextField(
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  hintText: "Masukkan Nomor Telepon",
                  prefixIcon: Icons.phone_outlined,
                  validator: (value) {
                    final phone = value?.trim() ?? "";

                    if (phone.isEmpty) {
                      return "Nomor telepon tidak boleh kosong";
                    }

                    if (!RegExp(r'^\d+$').hasMatch(phone)) {
                      return "Nomor telepon hanya boleh angka";
                    }

                    if (phone.length < 9) {
                      return "Nomor telepon minimal 9 digit";
                    }

                    if (phone.length > 15) {
                      return "Nomor telepon maksimal 15 digit";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 8),
                CustomTextField(
                  controller: cityController,
                  hintText: "Masukkan Asal Kota",
                  prefixIcon: Icons.location_on_outlined,
                  validator: (value) {
                    final city = value?.trim() ?? "";

                    if (city.isEmpty) {
                      return "Asal kota tidak boleh kosong";
                    }

                    if (city.length < 2) {
                      return "Nama kota terlalu pendek";
                    }

                    final regex = RegExp(r'^[a-zA-Z\s]+$');
                    if (!regex.hasMatch(city)) {
                      return "Kota hanya boleh huruf dan spasi";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await PenggunaController.registerPengguna(
                          PenggunaModel(
                            nama: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            city: cityController.text,
                          ),
                        );

                        nameController.clear();
                        emailController.clear();
                        phoneController.clear();
                        cityController.clear();

                        setState(() {});
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      "Daftarkan Pengguna",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "List Data Pengguna",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      context.push(ListPenggunaScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.success,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      "Lihat Data Pengguna",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                penggunaWidget(),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: AppColor.backgroundLight,
    );
  }
}

FutureBuilder<List<PenggunaModel>> penggunaWidget() {
  return FutureBuilder<List<PenggunaModel>>(
    future: PenggunaController.getAllPengguna(),

    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (!snapshot.hasData) {
        return CircularProgressIndicator();
      }
      final dataPengguna = snapshot.data as List<PenggunaModel>;
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
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
                    Icon(Icons.email_outlined, size: 18, color: Colors.grey),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(items.email, style: TextStyle(fontSize: 14)),
                    ),
                  ],
                ),

                SizedBox(height: 8),

                Row(
                  children: [
                    Icon(Icons.phone_outlined, size: 18, color: Colors.grey),
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
      );
    },
  );
}
