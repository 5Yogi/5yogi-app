import 'package:flutter/material.dart';

void main() => runApp(FiveYogiApp());

class FiveYogiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '5Yogi',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFFFFBF7),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Text("Good Morning,\nBeautiful ✨", style: TextStyle(fontSize:32, fontWeight:FontWeight.bold)),
              SizedBox(height:20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("STAR VIDEO - Day 5", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFC17C60))),
                    SizedBox(height:8),
                    Text("Lymphatic & Sculpt - \$18.22 Top Earner", style: TextStyle(fontSize:20, fontWeight: FontWeight.bold)),
                    SizedBox(height:12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFC17C60)),
                      onPressed: (){},
                      child: Text("Start 5-Min Flow", style: TextStyle(color: Colors.white))
                    )
                  ],
                ),
              ),
              SizedBox(height:20),
              Text("Library - 8 Exercises", style: TextStyle(fontSize:18, fontWeight: FontWeight.bold)),
              Text("Challenge - 7-Day Reset"),
              Text("Progress - Photo Tracker"),
            ],
          ),
        ),
      ),
    );
  }
}
