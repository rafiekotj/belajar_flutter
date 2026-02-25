import 'package:belajar_flutter/constant/app_color.dart';
import 'package:belajar_flutter/tugas_9/list.dart';
import 'package:belajar_flutter/tugas_9/list_map.dart';
import 'package:belajar_flutter/tugas_9/listmodel.dart';
import 'package:flutter/material.dart';

class Tugas9Flutter extends StatefulWidget {
  const Tugas9Flutter({super.key});

  @override
  State<Tugas9Flutter> createState() => _Tugas9FlutterState();
}

class _Tugas9FlutterState extends State<Tugas9Flutter> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Soal1List(),
    Soal2ListMap(),
    Soal3Model(),
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
              ? "Soal 1"
              : _selectedIndex == 1
              ? "Soal 2"
              : "Soal 3",
          style: TextStyle(fontWeight: FontWeight.w600),
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
            // Soal 1
            ListTile(
              leading: Icon(
                Icons.looks_one,
                color: _selectedIndex == 0
                    ? AppColor.primary
                    : AppColor.textSecondary,
              ),
              title: Text(
                "Soal 1",
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

            // Soal 2
            ListTile(
              leading: Icon(
                Icons.looks_two,
                color: _selectedIndex == 1
                    ? AppColor.primary
                    : AppColor.textSecondary,
              ),
              title: Text(
                "Soal 2",
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

            // Soal 3
            ListTile(
              leading: Icon(
                Icons.looks_3,
                color: _selectedIndex == 2
                    ? AppColor.primary
                    : AppColor.textSecondary,
              ),
              title: Text(
                "Soal 3",
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
