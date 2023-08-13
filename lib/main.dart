import 'package:flutter/material.dart';

import 'provinsi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Icity',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const Scaffold(
       body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wilayah();
  }
}