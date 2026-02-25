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
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Saya menyetujui semua persyaratan yang berlaku",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _isChecked = newValue ?? false;
                    });
                  },
                  activeColor: AppColor.primary,
                ),
              ],
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
