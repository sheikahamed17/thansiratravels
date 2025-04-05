import 'package:flutter/material.dart';
import 'package:thansira_travels/screens/homepage.dart';

void main() {
  runApp(const ThansiraTravels());
}

class ThansiraTravels extends StatelessWidget {
  const ThansiraTravels({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Thansira Travels",
      theme: ThemeData(fontFamily: 'urbanist', useMaterial3: true),
      home: HomePage(),
    );
  }
}
