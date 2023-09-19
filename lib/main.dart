// ignore_for_file: prefer_const_constructors

import 'package:first_project/pages/home_page.dart';
import 'package:first_project/pages/login_page.dart';
import 'package:first_project/pages/transport_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      routes: {
        'login': (context) => LoginPage(),
        'home': (context) => HomePage(),
        'transport': (context) => TransportPage()
      },
    );
  }
}
