import 'package:flutter/material.dart';

import '../utility/app_assets.dart';
class Logo extends StatelessWidget {
  const Logo({
    super.key,
    this.bgHeight=150,
    this.bgWidth=150,
    this.imHeight=140,
    this.imWidth=140,
  });
  final double? bgHeight;
  final double? bgWidth;
  final double? imHeight;
  final double? imWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bgHeight,
      width: bgWidth,
      decoration: BoxDecoration(
        shape: BoxShape.circle,

        color: Colors.white,
      ),
      child: Center(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(Assets.logo,height: imHeight,width: imWidth,fit: BoxFit.cover,)),
      ),
    );
  }
}