import 'package:belajar_flutter/day_5/column.dart';
import 'package:flutter/material.dart';

class ScaffoldDay5 extends StatelessWidget {
  const ScaffoldDay5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1C4D8D),
        title: Text("PPKD Batch 5"),
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
        actions: [Text("PPKD Batch 5")],
      ),
      body: Column(
        
        children: [
          ColumnDay5(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Menu 1"),
              Text("Menu 2"),
              Text("Menu 3"),
              Text("Menu 4"),
              Text("Menu 5"),
            ],
          ),

        ],
      ),
      backgroundColor: Color(0xffBDE8F5),
    );
  }
}