
import 'package:flutter/material.dart';

import '../utility/app_color.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key,
    required this.name,
    required this.onClick,
    this.bgColor=AppColors.buttonGreen,
    this.height=45,
    this.width=300,
    this.isLoading = false,
    this.fontSize = 16
  });
  final String name;
  final VoidCallback onClick;
  final Color? bgColor;
  final double? height;
  final double? width;
  final bool isLoading;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color:bgColor,
        ),
        child: Center(
          child: isLoading ? const CircularProgressIndicator.adaptive() : Text(name,style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.w600,color:Colors.white),),
        ),
      ),
    );
  }
}
