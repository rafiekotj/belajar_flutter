import 'package:belajar_flutter/constant/app_color.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tentang Aplikasi",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.textOnPrimary,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Rentora",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 20),

              Text(
                "Nama Aplikasi",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text("Rentora", style: TextStyle(fontSize: 16)),

              SizedBox(height: 16),

              Text(
                "Deskripsi",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text("Lorem ipsum", style: TextStyle(fontSize: 16)),

              SizedBox(height: 16),

              Text(
                "Nama Pembuat",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text("Rafie", style: TextStyle(fontSize: 16)),

              SizedBox(height: 16),

              Text(
                "Versi",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text("1.0.0", style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
      backgroundColor: AppColor.backgroundLight,
    );
  }
}
