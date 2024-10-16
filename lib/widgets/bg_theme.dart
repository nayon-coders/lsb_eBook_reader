import 'package:flutter/material.dart';

class BgTheme extends StatelessWidget {
  const BgTheme({super.key,  this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(20),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFEEF4F0),
                Color(0xFFD2FFBD),
                // Color(0xFFffb7b2).withOpacity(0.2),
                // Color(0xFFff9aa2).withOpacity(0.5),
              ]
          ),
      ),
      child: child,
    );
  }
}
