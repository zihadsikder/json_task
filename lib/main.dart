import 'package:flutter/material.dart';
import 'package:json_task/app/presentation/screens/version_screen.dart';

void main () => runApp(const JsonTaskApp());

class JsonTaskApp extends StatelessWidget {
  const JsonTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Json Task',
      debugShowCheckedModeBanner: false,
      home: VersionScreen(),
    );
  }
}