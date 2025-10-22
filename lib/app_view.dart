import 'package:arya/screens/home_screen.dart';
import 'package:arya/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "A R Y A",
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(scaffoldBackgroundColor: MyAppTheme.whiteColor),
      home: HomeScreen(),
    );
  }
}
