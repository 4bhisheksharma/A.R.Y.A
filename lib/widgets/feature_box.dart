import 'package:flutter/material.dart';

class MyFeatureBox extends StatelessWidget {
  final Color? color;
  final String headerText;
  final String descriptionText;
  final IconData? icon;
  const MyFeatureBox({
    super.key,
    required this.color,
    required this.headerText,
    required this.descriptionText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(86, 158, 158, 158),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Icon(icon, size: 28, color: Colors.white),
              ),
            Text(
              headerText,
              style: TextStyle(fontFamily: 'Cera Pro', fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                descriptionText,
                style: TextStyle(fontFamily: 'Cera Pro', fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
