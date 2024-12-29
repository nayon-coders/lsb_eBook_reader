import 'dart:convert';
import 'package:ebook_reader/app_config.dart';
import 'package:ebook_reader/data/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart' as dom;
import 'package:get/get.dart';
import 'package:page_flip/page_flip.dart';

import '../../../../data/model/mark_fav_model.dart';
import '../../../../data/model/peragraphModel.dart';
import 'mark_text_controller.dart';
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
    fontSize.value = 16.5;
  }

  final pageFlipWidgetsController = GlobalKey<PageFlipWidgetState>();

  var containerWidth = 300.0; // Example width of the container
  var wordsPerLine = 0.obs; // Holds the number of words that can fit in a line

  RxDouble fontSize = 15.00.obs;
  
  //Rx model 
  Rx<PeragraphModel> peragraphModel = PeragraphModel().obs;
  RxList<String> totalBookPages = <String>[].obs;
  RxBool isLoading = true.obs;

  RxInt currentPage = 1.obs;
  RxString peraId = "".obs;

  RxList<String> content = <String>[].obs;

  //get nextg page
  void nextPage() {
    pageFlipWidgetsController.currentState!.nextPage();
  }
  //previous page
  void previousPage() {
    pageFlipWidgetsController.currentState!.previousPage();
  }

  //get peragraph 
  getParagraph(ID)async{
    content.clear();
    isLoading.value = true;
    var response = await ApiServices.getApi(AppConfig.PERAGRAPH_GET_BY_ID+"$ID");
    if(response.statusCode == 200){
      peragraphModel.value = PeragraphModel.fromJson(jsonDecode(response.body));

      var text =  peragraphModel.value.data!.first.content!.toString(); // Get the JSON string
      // Step 1: Remove the enclosing square brackets
      var dataString = text!.substring(1, text!.length - 1);

      // Step 2: Split the string using the delimiter "},"
      List<String> splitList = dataString.split('},');

      // Step 3: Clean up each item in the list to remove curly braces
      splitList = splitList.map((item) {
        // Add the closing brace "}" back if it was removed during splitting
        if (!item.trim().endsWith('}')) {
          item = '$item}';
        }
        // Remove the opening and closing curly braces
        return item.replaceAll('{', '').replaceAll('}', '').trim();
      }).toList();
      content.value = splitList;

      // splitHtmlByWords(peragraphModel.value.data!.first!.content!, 130);
      peraId.value = peragraphModel.value.data!.first!.paraId!.toString();
    }
    isLoading.value = false;
  }


//Function to initialize controllers and set their content
  void initializeContent(List<String> splitList) {
    // Clear existing controllers and content if re-initializing
    content.clear();

    // Initialize both lists with the correct number of items
    content.value = List.generate(splitList.length, (index) => "");

    // Ensure controllers are fully initialized before setting text
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (int i = 0; i < splitList.length; i++) {
        print('Setting text for controller ${splitList[i]}'); // Debugging
        content[i] = splitList[i];
      }
      // Ensure the UI updates after setting the text
      update();
    });

    print("content----${content}");
  }





  List<String> splitHtmlByWords(String htmlContent, int wordsPerPage) {
    // Parse the HTML content
    dom.Document document = html_parser.parse(htmlContent);

    List<String> result = [];
    StringBuffer pageContent = StringBuffer();
    int wordCount = 0;

    // Recursively process each node
    void processNode(dom.Node node) {
      if (node is dom.Text) {
        // Split text content by words
        List<String> words = node.text.split(RegExp(r'\s+'));

        for (var word in words) {
          if (word.trim().isNotEmpty) {
            pageContent.write(word + ' ');
            wordCount++;
          }
          if (wordCount >= wordsPerPage) {
            // Add the current content as a page and reset
            result.add(pageContent.toString());
            pageContent.clear();
            wordCount = 0;
          }
        }
      } else if (node is dom.Element) {
        // Write the opening tag
        pageContent.write('<${node.localName}');

        // Add attributes if any
        node.attributes.forEach((key, value) {
          pageContent.write(' $key="$value"');
        });
        pageContent.write('>');

        // Process child nodes
        node.nodes.forEach(processNode);

        // Write the closing tag
        pageContent.write('</${node.localName}>');
      }
    }

    document.body?.nodes.forEach(processNode);

    // Add any remaining content as the last page
    if (pageContent.isNotEmpty) {
      result.add(pageContent.toString());
    }

    totalBookPages.value = result;
    return result;
  }

  //show a popup with the mark text with the match text
  MarkTextDatum showMarkTextPopup(String text, markTextList){
    MarkTextDatum? marktText;
    print("text-----${text}");
    var selectedText = text;
    for(var i in markTextList){
      if(i.text == selectedText){
        marktText = i;
      }else{
        marktText = null;
        Get.snackbar("Error", "Definition not found");
      }
    }
    return marktText!;

  }



//clear all static data
  clearAllData(){
    currentPage.value = 1;
    fontSize.value = 16; // Reset the font size to 14
  }






}