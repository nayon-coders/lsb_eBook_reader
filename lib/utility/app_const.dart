import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppConst {

  static String lock = "Lock";
  static double deliveryFeeInsideDhaka = 60.0;
  static double deliveryFeeOutsideDhaka = 120.0;


  static copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      // Show a snackbar or dialog to confirm copying
      Get.snackbar("Copy!", "Copied to clipboard", backgroundColor: Colors.green);
    });
  }




}