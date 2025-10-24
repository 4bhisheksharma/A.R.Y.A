import 'package:flutter/material.dart';

class MyFeatureBox extends StatelessWidget {
  final Color? color;
  final String headerText;
  final String descriptionText;
  const MyFeatureBox({
    super.key,
    required this.color,
    required this.headerText,
    required this.descriptionText,
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              headerText,
              style: TextStyle(fontFamily: 'Cera Pro', fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
