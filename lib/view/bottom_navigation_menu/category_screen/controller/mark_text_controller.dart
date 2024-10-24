import 'dart:convert';

import 'package:ebook_reader/app_config.dart';
import 'package:ebook_reader/data/services/api_services.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/category_screen/controller/reading_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/mark_fav_model.dart';

class MarkTextController extends GetxController {
  final ReadingController readingController = Get.put(ReadingController());


  RxBool isAdding = false.obs;
  //add mark text into fave
  addMarkTextToFave(id)async{
    //add mark text into fave
    isAdding.value = true;
    var res = await ApiServices.postApi(AppConfig.MARK_TEXT, {"mark_text_id" : id});
    if(res.statusCode == 200){
      getAllMarkTextFromFave();
      Get.snackbar("Success", "Mark text added into fave successfully", backgroundColor: Colors.green, colorText: Colors.white);
    }
  }


  //check mark text is added into fave or not
  RxBool isFave = false.obs;
  checkMarkTextIsAdded(id)async{
    var res = await ApiServices.getApi(AppConfig.CHECK_MARK_TEXT_IS_ADDED + id.toString());
    if(res.statusCode == 200){
      getAllMarkTextFromFave();
      isFave.value = true;
    }else{
      isFave.value = false;
    }
  }

  Rx<MarktextFavModel> markTextFavModel = MarktextFavModel().obs;
  //get all mark text from fave
  getAllMarkTextFromFave()async{
    var res = await ApiServices.getApi(AppConfig.GET_MARK_TEXT);
    if(res.statusCode == 200){
      markTextFavModel.value = MarktextFavModel.fromJson(jsonDecode(res.body));
      getMarkTextForThisPear();
    }
  }

  //remove mark text from fave
  removeMarkTextFromFave(id)async{
    print("yes clicked$id ");
    var res = await ApiServices.deleteApi(AppConfig.DELETE_MARK_TEXT + id.toString());
    if(res.statusCode == 200){
      getAllMarkTextFromFave();
      Get.snackbar("Success", "Mark text removed from fave successfully", backgroundColor: Colors.green, colorText: Colors.white);
    }
  }

  //check mark text is added into fave or not
  RxBool isMarkTextAdded = false.obs;

  RxList<SingleMarkTextModel> markTextList = <SingleMarkTextModel>[].obs;
  getMarkTextForThisPear(){
    markTextList.clear();
    for(int i = 0; i < markTextFavModel.value.data!.length; i++){
      if(markTextFavModel.value.data![i].paraId.toString() == readingController.peraId.toString()){
        markTextList.add(markTextFavModel.value.data![i]);
      }
    }
  }

  //remove mark text from fave



}