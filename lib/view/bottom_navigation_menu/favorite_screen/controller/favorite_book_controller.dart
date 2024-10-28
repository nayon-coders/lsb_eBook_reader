import 'dart:convert';

import 'package:ebook_reader/app_config.dart';
import 'package:ebook_reader/data/services/api_services.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/favorite_screen/model/get_all_favoriite_book_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteBookController extends GetxController{

  //model
  Rx<GetAllFavoriteBookModel> getAllBookModel = GetAllFavoriteBookModel().obs;


  //bool
  RxBool isGetting = false.obs;
  RxBool isLoading = false.obs;
  @override
  onInit(){
    super.onInit();
    getAllFavoriteBook();
  }

  //onReady
  @override
  void onReady() {
    super.onReady();
    getAllFavoriteBook();
  }
  //onClose
  @override
  void onClose() {
    super.onClose();
  }



  //get All Favorite book
  getAllFavoriteBook()async{
    isLoading.value = true;
    final res = await ApiServices.getApi(AppConfig.FAVORITE_GET);
    if(res.statusCode == 200){
      print("successful : ${jsonDecode(res.body)["message"]}");
      getAllBookModel.value = GetAllFavoriteBookModel.fromJson(jsonDecode(res.body));
    }else{
      print("Failed : ${jsonDecode(res.body)["message"]}");
    }
    isLoading.value = false;
  }

  //Favorite books delete
  deleteFavorite(id)async{
    isLoading.value = true;
    final res = await ApiServices.deleteApi(AppConfig.FAVORITE_DELETE+id.toString());
    if(res.statusCode == 200){
      getAllFavoriteBook();
      Get.snackbar("Successful", "Delete Successful", backgroundColor: Colors.green);
    }else{
      Get.snackbar("Failed", "${jsonDecode(res.body)["message"]}", backgroundColor: Colors.red);
    }
    isLoading.value = false;
  }


}