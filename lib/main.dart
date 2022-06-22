import 'package:flutter/material.dart';
import 'package:myapplicationtest/pages/calculator.dart';
import 'pages/page_home.dart';
import 'pages/page_state.dart';
import 'pages/calculator.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:myapplicationtest/widgets/bottomNavbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: Tabs(),
      debugShowCheckedModeBanner: false,
    );
  }
}


