
import 'package:ebook_reader/widgets/app_shimmer_pro.dart';
import 'package:flutter/material.dart';

import '../utility/app_color.dart';

class AppInput extends StatelessWidget {
  AppInput({super.key,
    required this.hint,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly = false,
    this.obscureText = false,
    this.validator,
    this.textType,
    this.onClick,
    this.onChanged,
    this.maxLine = 1,
    this.isValidatorNeed = true,
    this.isDataLoading = false

  });
  final String hint;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  String? Function(String?)? validator;
  final bool readOnly;
  final bool obscureText;
  final TextInputType?textType;
  final VoidCallback? onClick;
  final Function(String)? onChanged;
  final int maxLine;
  final bool isValidatorNeed;
  final bool isDataLoading;


  @override
  Widget build(BuildContext context) {
    return isDataLoading
        ? AppShimmerPro.circularShimmer(width: double.infinity, height: 50, borderRadius: 10)
        : TextFormField(
      onTap: onClick,
      onChanged: onChanged,
      maxLines: maxLine,
      keyboardType:textType,
      style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color:AppColors.textBlack),
      readOnly:readOnly ,
      obscureText:obscureText ,
      controller:controller ,
      validator: (v){
        if(isValidatorNeed){
          if(v!.isEmpty){
            return "Must be required";
          }
          return null;
        }

      },
      decoration: InputDecoration(
        contentPadding:const EdgeInsets.only(left: 15,),
        filled: true,
        fillColor: AppColors.filleColor,
        hintText: hint,
        hintStyle:const TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.black),

        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
