import 'package:belajar_flutter/constant/app_color.dart';
import 'package:belajar_flutter/tugas_10/extension/navigator.dart';
import 'package:belajar_flutter/tugas_10/tugas10.dart';
import 'package:belajar_flutter/tugas_11/database/preference.dart';
import 'package:belajar_flutter/tugas_11/database/preference.dart';
import 'package:flutter/material.dart';

class HomeDaftarPage extends StatelessWidget {
  const HomeDaftarPage({
    super.key,
    // required this.name, required this.phone
  });
  // final String name;
  // final String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: TextStyle(fontWeight: FontWeight.w700)),
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.textOnPrimary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "THANK YOU",
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 56,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Halo,",
                // "Halo $name,",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16),
              Text(
                "pendaftaran akun dengan nomor",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                // phone,
                "phone",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                "telah berhasil dilakukan.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  PreferenceHandler().deleteIsLogin();
                  context.pushAndRemoveAll(Tugas10Flutter());
                },
                child: Container(
                  color: AppColor.primary,
                  child: Text("Logout", style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColor.backgroundLight,
    );
  }
}
