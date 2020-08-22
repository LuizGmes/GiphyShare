import 'package:flutter/material.dart';
import 'package:giphy_share/ui/home_page.dart';
import 'package:giphy_share/ui/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giphy Share',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}


