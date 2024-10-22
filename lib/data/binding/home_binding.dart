import 'package:ebook_reader/view/bottom_navigation_menu/books_screen/controller/book_controller.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/home_screen/controller/controller.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/profile_screen/controller/favroit_controller.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/profile_screen/controller/profile_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

//home binding
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<BookController>(() => BookController());
  }
}