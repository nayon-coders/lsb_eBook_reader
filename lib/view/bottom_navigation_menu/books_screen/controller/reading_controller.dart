import 'dart:convert';

import 'package:ebook_reader/app_config.dart';
import 'package:ebook_reader/data/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/peragraphModel.dart';
class ReadingController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  
  }
  //on ready 
  @override
  void onReady() {
    super.onReady();
   
  }
  //on close
  @override
  void onClose() {
    super.onReady();
    //reset fontSize.value
    fontSize.value = 16.00;
  }

  var containerWidth = 300.0; // Example width of the container
  var wordsPerLine = 0.obs; // Holds the number of words that can fit in a line

  RxDouble fontSize = 16.00.obs;
  
  //Rx model 
  Rx<PeragraphModel> peragraphModel = PeragraphModel().obs;
  RxList<String> totalBookPages = <String>[].obs;
  RxBool isLoading = true.obs;

  RxInt currentPage = 1.obs;
  
  //get peragraph 
  getParagraph(ID)async{
    isLoading.value = true;
    var response = await ApiServices.getApi(AppConfig.PERAGRAPH_GET_BY_ID+"$ID");
    if(response.statusCode == 200){
      peragraphModel.value = PeragraphModel.fromJson(jsonDecode(response.body));
      totalPageWithText(peragraphModel.value.data!.first!.content!, 5);
    }
    isLoading.value = false;
  }



  List<String> totalPageWithText(String text, int linesPerPage) {
    print("totalPageWithText called with linesPerPage: $linesPerPage");
    List<String> lines = text.split('\n');
    List<String> result = [];

    for (int i = 0; i < lines.length; i += linesPerPage) {
      int end = (i + linesPerPage < lines.length) ? i + linesPerPage : lines.length;
      result.add(lines.sublist(i, end).join('\n'));
    }

    print("pages --- ${result.length}"); // Print the number of pages created
    totalBookPages.value = result;
    return result;
  }



  //clear all static data
  clearAllData(){
    currentPage.value = 1;
    fontSize.value = 16; // Reset the font size to 14
  }






}