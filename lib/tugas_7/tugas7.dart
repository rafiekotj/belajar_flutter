import 'package:belajar_flutter/constant/app_color.dart';
import 'package:belajar_flutter/tugas_7/checkbox.dart';
import 'package:belajar_flutter/tugas_7/date_picker.dart';
import 'package:belajar_flutter/tugas_7/dropdown.dart';
import 'package:belajar_flutter/tugas_7/switch.dart';
import 'package:belajar_flutter/tugas_7/time_picker.dart';
import 'package:flutter/material.dart';

class Tugas7Flutter extends StatefulWidget {
  const Tugas7Flutter({super.key});

  @override
  State<Tugas7Flutter> createState() => _Tugas7FlutterState();
}

class _Tugas7FlutterState extends State<Tugas7Flutter> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    CheckboxPage(),
    SwitchPage(),
    DropdownPage(),
    DatePickerPage(),
    TimePickerPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedIndex == 0
              ? "Syarat & Ketentuan"
              : _selectedIndex == 1
              ? "Mode Gelap"
              : _selectedIndex == 2
              ? "Pilih Kategori Produk"
              : _selectedIndex == 3
              ? "Pilih Tanggal Lahir"
              : "Atur Pengingat",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.textOnPrimary,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: AppColor.primary),
              child: Text(""),
            ),
            // Checkbox
            ListTile(
              leading: Icon(
                Icons.check_box,
                color: _selectedIndex == 0
                    ? AppColor.primary
                    : AppColor.textSecondary,
              ),
              title: Text(
                "Checkbox",
                style: TextStyle(
                  color: _selectedIndex == 0
                      ? AppColor.primary
                      : AppColor.textPrimary,
                ),
              ),
              selected: _selectedIndex == 0,
              selectedTileColor: AppColor.primarySoft,
              onTap: () => _onItemTapped(0),
            ),

            // Switch
            ListTile(
              leading: Icon(
                Icons.sunny,
                color: _selectedIndex == 1
                    ? AppColor.primary
                    : AppColor.textSecondary,
              ),
              title: Text(
                "Switch",
                style: TextStyle(
                  color: _selectedIndex == 1
                      ? AppColor.primary
                      : AppColor.textPrimary,
                ),
              ),
              selected: _selectedIndex == 1,
              selectedTileColor: AppColor.primarySoft,
              onTap: () => _onItemTapped(1),
            ),

            // Dropdown
            ListTile(
              leading: Icon(
                Icons.keyboard_double_arrow_down,
                color: _selectedIndex == 2
                    ? AppColor.primary
                    : AppColor.textSecondary,
              ),
              title: Text(
                "Dropdown",
                style: TextStyle(
                  color: _selectedIndex == 2
                      ? AppColor.primary
                      : AppColor.textPrimary,
                ),
              ),
              selected: _selectedIndex == 2,
              selectedTileColor: AppColor.primarySoft,
              onTap: () => _onItemTapped(2),
            ),

            // Date Picker
            ListTile(
              leading: Icon(
                Icons.calendar_today,
                color: _selectedIndex == 3
                    ? AppColor.primary
                    : AppColor.textSecondary,
              ),
              title: Text(
                "Date Picker",
                style: TextStyle(
                  color: _selectedIndex == 3
                      ? AppColor.primary
                      : AppColor.textPrimary,
                ),
              ),
              selected: _selectedIndex == 3,
              selectedTileColor: AppColor.primarySoft,
              onTap: () => _onItemTapped(3),
            ),

            // Time Picker
            ListTile(
              leading: Icon(
                Icons.access_time,
                color: _selectedIndex == 4
                    ? AppColor.primary
                    : AppColor.textSecondary,
              ),
              title: Text(
                "Time Picker",
                style: TextStyle(
                  color: _selectedIndex == 4
                      ? AppColor.primary
                      : AppColor.textPrimary,
                ),
              ),
              selected: _selectedIndex == 4,
              selectedTileColor: AppColor.primarySoft,
              onTap: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      backgroundColor: AppColor.backgroundLight,
    );
  }
}
