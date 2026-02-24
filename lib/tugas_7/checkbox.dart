import 'package:belajar_flutter/constant/app_color.dart';
import 'package:flutter/material.dart';

class CheckboxPage extends StatefulWidget {
  const CheckboxPage({super.key});

  @override
  State<CheckboxPage> createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CheckboxListTile(
              value: _isChecked,
              onChanged: (bool? newValue) {
                setState(() {
                  _isChecked = newValue ?? false;
                });
              },
              title: Text("Saya menyetujui semua persyaratan yang berlaku"),
              activeColor: AppColor.primary,
            ),

            SizedBox(height: 16),

            Text(
              _isChecked
                  ? "Lanjutkan pendaftaran diperbolehkan"
                  : "Anda belum bisa melanjutkan",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: _isChecked ? AppColor.success : AppColor.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
