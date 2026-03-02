import 'package:belajar_flutter/constant/app_color.dart';
// import 'package:belajar_flutter/tugas_10/home_daftar.dart';
import 'package:belajar_flutter/tugas_10/tugas10.dart';
import 'package:belajar_flutter/tugas_11/database/preference.dart';
import 'package:belajar_flutter/tugas_10/extension/navigator.dart';
import 'package:belajar_flutter/tugas_11/views/drawer.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  void autoLogin() async {
    await Future.delayed(Duration(seconds: 2));
    bool? data = await PreferenceHandler.getIsLogin();
    print(data);
    if (data == null) {
      print("Belum Login");
    } else {
      print("Sudah Login");
    }
    if (data == true) {
      context.pushAndRemoveAll(DrawerGlobal());
    } else {
      context.pushAndRemoveAll(Tugas10Flutter());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset("assets/icons/rentora_logo.png", width: 240)],
        ),
      ),
      backgroundColor: AppColor.backgroundLight,
    );
  }
}
