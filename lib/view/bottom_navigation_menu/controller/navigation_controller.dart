import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../profile_screen/controller/profile_controller.dart';

class NavController extends GetxController{

  //profile controller inject

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  //onColose
  @override
  void onClose() {
    super.onClose();
  }
  //onready
  @override
  void onReady() {
    super.onReady();
  }


   var currentIndex = 0.obs;

   void changeIndex(int index){
     currentIndex.value = index;
     update();

   }
}