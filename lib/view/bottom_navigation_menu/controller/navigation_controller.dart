import 'package:ebook_reader/view/bottom_navigation_menu/favorite_screen/favorite_screen.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/home_screen/home_screen.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/my_order_screen/screen/my_order_screen.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/profile_screen/profile_screen.dart';
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

  // page list
  RxList pages = [HomeScreen(), MyOrderScreen(), FavoriteScreen(), ProfileScreen()].obs;


   var currentIndex = 0.obs;

   void changeIndex(int index){
     currentIndex.value = index;
   }
}