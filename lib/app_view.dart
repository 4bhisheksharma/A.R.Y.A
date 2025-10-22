import 'package:arya/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "A R Y A",
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.grey[200]!,
          secondary: Colors.grey[700]!,
        ),
      ),
      home: HomeScreen(),
    );
  }
}