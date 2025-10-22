import 'package:arya/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("A R Y A"),
        leading: Icon(Icons.menu_rounded),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Container(
                  height: 135,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/arya-final.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 40).copyWith(top: 20),
            decoration: BoxDecoration(
              border: Border.all(color: MyAppTheme.borderColor),
              borderRadius: BorderRadius.only(
                topLeft: Radius.zero,
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.zero,
              ),
            ),
            child: Text(
              "Hello, I am ARYA, your personal assistant. What can I do for you today?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: MyAppTheme.mainFontColor,
                fontSize: 16,
                fontFamily: 'Cera Pro',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
