import 'package:arya/theme/app_theme.dart';
import 'package:arya/widgets/feature_box.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
        title: const Text(
          "A R Y A",
          style: TextStyle(color: MyAppTheme.mainFontColor),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              iconSize: 45,
              icon: SizedBox(
                width: 35,
                height: 35,
                child: Lottie.asset(
                  'assets/images/Fire.json',
                  fit: BoxFit.contain,
                  repeat: true,
                  animate: true,
                ),
              ),
              onPressed: () {
                debugPrint("Menu button pressed");
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Lottie JSON animation behind the avatar
                      Positioned.fill(
                        child: Opacity(
                          opacity: 0.9,
                          child: Lottie.asset(
                            'assets/images/Fire.json',
                            fit: BoxFit.contain,
                            repeat: true,
                            animate: true,
                          ),
                        ),
                      ),

                      // Circular avatar on top (moved down slightly)
                      Positioned(
                        top: 88,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage(
                            'assets/images/arya-final.png',
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ],
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.only(left: 10, top: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Here are some features you can try:",
              style: TextStyle(
                color: MyAppTheme.mainFontColor,
                fontSize: 16,
                fontFamily: 'Cera Pro',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          //features list
          Column(
            children: [
              MyFeatureBox(
                color: MyAppTheme.firstSuggestionBoxColor,
                headerText: 'ChatGPT Integration',
                descriptionText:
                    'Integrate ChatGPT into your applications seamlessly.',
              ),
            ],
          ),

          // some suggestion boxes texts
        ],
      ),
    );
  }
}
