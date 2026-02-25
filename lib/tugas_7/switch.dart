import 'package:belajar_flutter/constant/app_color.dart';
import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _isDarkMode ? AppColor.backgroundDark : AppColor.backgroundLight,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Aktifkan Mode Gelap",
                    style: TextStyle(
                      color: _isDarkMode
                          ? AppColor.textOnPrimary
                          : AppColor.textPrimary,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 16),
                  Switch(
                    value: _isDarkMode,
                    onChanged: (bool value) {
                      setState(() {
                        _isDarkMode = value;
                      });
                    },
                    activeThumbColor: AppColor.primary,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                _isDarkMode ? "Mode Gelap Aktif" : "Mode Terang Aktif",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: _isDarkMode
                      ? AppColor.textOnPrimary
                      : AppColor.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
