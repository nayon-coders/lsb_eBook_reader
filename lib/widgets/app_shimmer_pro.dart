import 'package:flutter/material.dart';
import 'package:shimmer_pro/shimmer_pro.dart';

class AppShimmerPro {


  //text shommer pro
  static ShimmerPro TextShimmer({required double width, required int maxLine}){
    return   ShimmerPro.text(
      light: ShimmerProLight.darker,
      width: width,
      maxLine: maxLine,
      depth: 30,
      textSize: 16,
      alignment: Alignment.centerLeft,
      scaffoldBackgroundColor: Colors.white,
    );
  }


  //image shommer pro
  static ShimmerPro circularShimmer({required double width,required double height, required double borderRadius}){
    return   ShimmerPro.sized(
      light: ShimmerProLight.darker,
      width: width,
      height: height,
      depth: 30,
      borderRadius: borderRadius,
      scaffoldBackgroundColor: Colors.white,
    );
  }


}