import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_config.dart';
import '../../../../data/services/api_services.dart';
import '../../favorite_screen/controller/favorite_book_controller.dart';

class FavroitController extends GetxController{
  FavoriteBookController favoriteBookController = Get.find<FavoriteBookController>();

    //oninit
  @override
  void onInit() {
    super.onInit();
  }
  //onReady
  @override
  void onReady() {
    super.onReady();
  }
  //onClose
  @override
  void onClose() {
    super.onClose();
  }


  //bool rx
  RxBool isFav = false.obs;


  //model rx
  //text editing controller
  //loading rx
  //get all books
  getFavroitBooks() async {
    //api call
  }

  //get book by id
  checkFavList(id) async {
    var res = await ApiServices.getApi(AppConfig.FAVORITE_CHECK+id);
    isFav.value = jsonDecode(res.body)["favorite"];
    //api call
  }

  //add into favroit
  addFavroit(id) async {
    var res = await ApiServices.postApi(AppConfig.FAVORITE_CREATE, {"book_id":id.toString()});
    if(res.statusCode == 200){
      favoriteBookController.getAllFavoriteBook();
      isFav.value = true;
    }
    //api call
  }

  //remove from favroit
  removeFavroit(id) async {
    var res = await ApiServices.deleteApi(AppConfig.FAVORITE_DELETE+id);
    if(res.statusCode == 200){
      favoriteBookController.getAllFavoriteBook();
      isFav.value = false;
    }
    //api call
  }

}