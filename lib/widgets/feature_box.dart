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
      margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color ?? Colors.orange,
            (color ?? Colors.orange).withOpacity(0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: (color ?? Colors.orange).withOpacity(0.4),
            spreadRadius: 0,
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (icon != null)
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(icon, size: 28, color: Colors.white),
                      ),
                    if (icon != null) SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        headerText,
                        style: TextStyle(
                          fontFamily: 'Cera Pro',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(
                    descriptionText,
                    style: TextStyle(
                      fontFamily: 'Cera Pro',
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.95),
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
