import 'dart:convert';
import 'package:ebook_reader/app_config.dart';
import 'package:ebook_reader/data/services/api_services.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart' as dom;
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
  RxString peraId = "".obs;
  
  //get peragraph 
  getParagraph(ID)async{
    isLoading.value = true;
    var response = await ApiServices.getApi(AppConfig.PERAGRAPH_GET_BY_ID+"$ID");
    if(response.statusCode == 200){
      peragraphModel.value = PeragraphModel.fromJson(jsonDecode(response.body));
      splitHtmlByWords(peragraphModel.value.data!.first!.content!, 150);
      peraId.value = peragraphModel.value.data!.first!.paraId!.toString();
    }
    isLoading.value = false;
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



//clear all static data
  clearAllData(){
    currentPage.value = 1;
    fontSize.value = 16; // Reset the font size to 14
  }






}