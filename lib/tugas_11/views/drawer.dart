import 'package:belajar_flutter/constant/app_color.dart';
import 'package:belajar_flutter/tugas_10/home_daftar.dart';
import 'package:belajar_flutter/tugas_11/views/cr_siswa.dart';
// import 'package:belajar_flutter/tugas_11/views/cr_siswa.dart';
import 'package:belajar_flutter/tugas_11/views/pengguna_screen.dart';
import 'package:flutter/material.dart';

class DrawerGlobal extends StatefulWidget {
  const DrawerGlobal({super.key});

  @override
  State<DrawerGlobal> createState() => _DrawerGlobalState();
}

class _DrawerGlobalState extends State<DrawerGlobal> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeDaftarPage(),
    CrSiswaScreen(),
    PenggunaScreen(),
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
              ? "Home"
              : _selectedIndex == 1
              ? "Daftar Kelas"
              : "Daftar Pengguna",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.textOnPrimary,
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: AppColor.backgroundLight,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: AppColor.primary),
              child: Text(""),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: _selectedIndex == 0
                    ? AppColor.primary
                    : AppColor.textSecondary,
              ),
              title: Text(
                "Home",
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

            ListTile(
              leading: Icon(
                Icons.class_outlined,
                color: _selectedIndex == 1
                    ? AppColor.primary
                    : AppColor.textSecondary,
              ),
              title: Text(
                "Daftar Kelas",
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

            ListTile(
              leading: Icon(
                Icons.account_circle_outlined,
                color: _selectedIndex == 2
                    ? AppColor.primary
                    : AppColor.textSecondary,
              ),
              title: Text(
                "Daftar Pengguna",
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
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      backgroundColor: AppColor.backgroundLight,
    );
  }
}
