// import 'package:belajar_flutter/tugas_1/tugas1.dart';
// import 'package:belajar_flutter/tugas_2/tugas2.dart';
// import 'package:belajar_flutter/tugas_3/tugas3.dart';
// import 'package:belajar_flutter/tugas_4/tugas4.dart';
// import 'package:belajar_flutter/tugas_5/tugas5.dart';
// import 'package:belajar_flutter/tugas_6/login.dart';
// import 'package:belajar_flutter/tugas_6/register.dart';
// import 'package:belajar_flutter/tugas_7/tugas7.dart';
// import 'package:belajar_flutter/tugas_8/tugas8.dart';
// import 'package:belajar_flutter/tugas_9/tugas9.dart';
// import 'package:belajar_flutter/tugas_10/tugas10.dart';
import 'package:belajar_flutter/constant/app_color.dart';
// import 'package:belajar_flutter/constant/api_app_color.dart';
import 'package:belajar_flutter/tugas_11/database/preference.dart';
// import 'package:belajar_flutter/tugas_11/views/splash_screen.dart';
// import 'package:belajar_flutter/tugas_14/views/splash/splash_screen.dart';
import 'package:belajar_flutter/tugas_15/views/auth/login_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceHandler().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Belajar Flutter',
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: AppColor.primary,
        ),
      ),
      home: const LoginScreen(),
      // routes: {
      //   '/login': (context) => LoginPage(),
      //   '/register': (context) => RegisterPage(),
      // },
    );
  }
}
