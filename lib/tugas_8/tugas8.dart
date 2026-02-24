import 'package:belajar_flutter/constant/app_color.dart';
import 'package:belajar_flutter/tugas_7/tugas7.dart';
import 'package:belajar_flutter/tugas_8/about.dart';
import 'package:flutter/material.dart';

class Tugas8Flutter extends StatefulWidget {
  const Tugas8Flutter({super.key});

  @override
  State<Tugas8Flutter> createState() => _Tugas8FlutterState();
}

class _Tugas8FlutterState extends State<Tugas8Flutter> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Tugas7Flutter(),
    AboutPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "Tentang Aplikasi",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.textOnPrimary,
        unselectedItemColor: AppColor.textHint,
        backgroundColor: AppColor.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
