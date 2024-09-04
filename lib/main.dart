import 'package:flutter/material.dart';

void main () => runApp(const JsonTaskApp());

class JsonTaskApp extends StatelessWidget {
  const JsonTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bmi Calculator',
      debugShowCheckedModeBanner: false,
      //home: HomeScreen(),
    );
  }
}