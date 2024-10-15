import 'package:flutter/material.dart';
import 'package:homework3/screens/homescreen.dart';
import 'package:flutter/services.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: const HomeScreen(),
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 12, 12, 12),
            fontSize: 18,
          ),
          iconTheme: IconThemeData(color: Color.fromARGB(255, 15, 15, 15)),
        ),
      ),
    );
  }
}