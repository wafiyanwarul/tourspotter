import 'package:flutter/material.dart';
// import 'package:tourspotter/pages/detail_screen_page.dart';

import 'pages/main_screen_page.dart';

void main() {
  runApp(const MyApp());
}

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreenPage(),
    );
  }
}