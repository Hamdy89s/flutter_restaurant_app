import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/home_page_screen.dart';
import 'package:restaurant_app/utils/constants.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData(
        primaryColor: MAIN_GREEN_COLOR,
      ),
      home: HomePage(),
    );
  }
}

