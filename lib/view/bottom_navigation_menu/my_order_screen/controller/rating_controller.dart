import 'package:ebook_reader/view/bottom_navigation_menu/category_screen/controller/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../../app_config.dart';
import '../../../../data/services/api_services.dart';
class RatingController extends GetxController {
  RxDouble rating = 4.0.obs;
  TextEditingController reviewController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
    reviewController.dispose();
  }

  RxBool isSubmitting = false.obs;
  void submitRating(String bookId) async{
   isSubmitting.value =  true;
   Get.find<BookController>().bookId.value = bookId;
   var data = {
     "book_id": bookId,
     "rating": rating.value,
     "feedback": reviewController.text
   };
   var res = await ApiServices.postApi(AppConfig.RATING_POST,data);
   if(res.statusCode == 200){
     clearData();
     Get.back();
     Get.find<BookController>().getAllBooks(); // get all books
     Get.find<BookController>().getMostTrandingBook(); // get most trading book
     Get.find<BookController>().getBookById(); // get book by id

     Get.snackbar("Success!", "Rating submitted successfully", backgroundColor: Colors.green);
   }

   isSubmitting.value = false;
  }


  //clear all data
  void clearData(){
    rating.value = 4.0;
    reviewController.clear();
  }
}