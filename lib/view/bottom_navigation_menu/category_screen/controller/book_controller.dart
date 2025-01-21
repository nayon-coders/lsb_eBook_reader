import 'dart:convert';

import 'package:ebook_reader/app_config.dart';
import 'package:ebook_reader/data/model/LocalDBbookModel.dart';
import 'package:ebook_reader/data/model/topics_with_book_id.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/category_screen/controller/reading_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/model/BookInfoModelWithMainAndSubTopics.dart';
import '../../../../data/model/all_book_model.dart';
import '../../../../data/model/single_book_model.dart';
import '../../../../data/services/api_services.dart';
import '../../../offline_mode/controller/pdf_manager_controller.dart';

class BookController extends GetxController{

  final PdfManager pdfManager = Get.put(PdfManager());
  final ReadingController readingController = Get.put(ReadingController());
  //oninit
  @override
  void onInit() {
    super.onInit();
    getAllBooks();

  }
  //onReady
  @override
  void onReady() {
    super.onReady();
    getAllBooks();
  }
  //onClose
  @override
  void onClose() {
    super.onClose();
  }

  //model rx
  Rx<AllBooksModel> allBooksModel = AllBooksModel().obs;
  Rx<SingleBookModel> singleBookModel = SingleBookModel().obs;
  Rx<ChapterTopicModel> chapterTopicModel = ChapterTopicModel().obs;
  RxList<ChapterTopicsDatum> topicList = <ChapterTopicsDatum>[].obs;

  //string
  RxString bookId = "".obs;

  //model rx
  //text editing controller
  //loading rx
  var isLoading = false.obs;
  var isGettingSingleProduct = true.obs;
  //get all books
  getAllBooks() async {
    isLoading.value = true;
    //api call
    var res = await ApiServices.getApi(AppConfig.BOOK_GET);
    if(res.statusCode == 200){
      allBooksModel.value = AllBooksModel.fromJson(jsonDecode(res.body));
      getMostTrandingBook(); //get most trading book
    }
    isLoading.value = false;
  } 

  //get book by id
  getBookById() async {
    isGettingSingleProduct.value = true;
    var res = await ApiServices.getApi(AppConfig.BOOK_GET_BY_ID+bookId.value);
    if(res.statusCode == 200){
      singleBookModel.value = SingleBookModel.fromJson(jsonDecode(res.body));
    }
    isGettingSingleProduct.value = false;
    //api call
  }



  //get book by author
  getAllTopic() async {
    isLoading.value = true;
    var res = await ApiServices.getApi(AppConfig.TOPI_GET_BY_BOOK_ID+bookId.value);
    if(res.statusCode == 200){
      chapterTopicModel.value = ChapterTopicModel.fromJson(jsonDecode(res.body));
    }
    isLoading.value = false;
    //api call
  }


  //moast trading book  with avarege rating...
  RxList <SingleBookList> mostTradingBook = <SingleBookList>[].obs;
  getMostTrandingBook(){
    mostTradingBook.value = allBooksModel.value.data!.where((element) => element.averageRating! > 4).toList();
  }

  //search book
  RxList<SingleBookList> searchBookList = <SingleBookList>[].obs;
  searchBook(String searchKey){
    print("seacrh typting --- ${searchKey}");
    searchBookList.clear();
    if(searchKey.isNotEmpty){
      searchBookList = allBooksModel.value.data!.where((element) => element.bookName!.toLowerCase().contains(searchKey.toLowerCase())).toList().obs;
    }else{
      getAllBooks();
    }

    print("search list length ${searchBookList.length}");
  }




  Rx<BookInfoModelWithMainAndSubTopics> bookInfoModelWithMainAndSubTopics = BookInfoModelWithMainAndSubTopics().obs;
  RxBool isGettingBookInfo = false.obs;
  //get book info with topics
  getBookInfoWithTopics(id)async{
    print("Book id ${id}");
    isGettingBookInfo.value = true;
    List<MainTopic> mainToc = [];
    //store main toc in the model
    List<SubTopics> subTocs = [];
    List<LocalDBbookModel> myBookList = [];
    //
    // var existingData = await getStoredBooks();
    //
    // myBookList = existingData; //assign the existing data to the list
  try{
    var response = await ApiServices.getApi(AppConfig.bookWithTopics+id);
    if(response.statusCode == 200){
      bookInfoModelWithMainAndSubTopics.value = BookInfoModelWithMainAndSubTopics.fromJson(jsonDecode(response.body));

      //store book info in the model
      var bookInfo = LocalDBbookModel(
          book: MyBook(
            bookName: bookInfoModelWithMainAndSubTopics.value!.bookInfo!.bookName,
            image: bookInfoModelWithMainAndSubTopics.value!.bookInfo!.image,
            bookId: bookInfoModelWithMainAndSubTopics.value!.bookInfo!.bookId!.toString(),
          ));

      for(var i in bookInfoModelWithMainAndSubTopics.value!.mainToc!){


        mainToc.add(MainTopic(
          name: i.name,
          bookId: i.bookId,
          pageNumber: i.pageNumber,
          subTocs: subTocs,
        ));



        for(var j in i.subTocs!) {
          //get paragraph
          await readingController.getParagraph(j.id);
          List<MarkTextDatum>? markTextData = [];
          for(var k in readingController.peragraphModel.value.markTextData!){
            markTextData.add(MarkTextDatum(
              text: k.text,
              definition: k.definition,
            ));
          }


          var content = await pdfManager.downloadAndEncryptPdf(readingController.peragraphModel.value.data!.first!.content!, j.name!);

          print("download URL ${content}");
          subTocs.add(SubTopics(
            mainTocId: j.mainTocId,
            name: j.name,
            pageNumber: j.pageNumber,
            content: Content(
              content: content,
              totalPage: readingController.peragraphModel.value.data!.first!.pageNumber!.toString(),
              markTextData: markTextData ,
            ),
          ));
        }


      }
      //store the data;;;
      var aftersave = LocalDBbookModel(book: bookInfo.book, mainTopic: mainToc);

      myBookList.add(aftersave);
      print("After save ${aftersave.toJson()}");
      saveMultipleProducts(myBookList);
    }
  }catch(e){
    print("Error ${e}");
    Get.snackbar("Faild to save!", "Something went wrong with server or internet connection! please try later!", backgroundColor: Colors.red);
    isGettingBookInfo.value = false;
  }



  }


  Future<void> saveMultipleProducts(List<LocalDBbookModel> newBooks) async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve the existing list from SharedPreferences
    String? existingData = prefs.getString("my_book");
    List<LocalDBbookModel> myLocalBookList = [];

    if (existingData != null) {
      // Decode the JSON string to a list of LocalDBbookModel
      List<dynamic> decodedData = jsonDecode(existingData);
      myLocalBookList = decodedData
          .map((product) => LocalDBbookModel.fromJson(product))
          .toList();
    }

    // Add new products to the existing list
    myLocalBookList.addAll(newBooks);

    // Convert the updated list to JSON and save it back
    final updatedJson = myLocalBookList.map((product) => product.toJson()).toList();
    prefs.setString("my_book", jsonEncode(updatedJson));
    isGettingBookInfo.value = false;
    Get.snackbar("Book Saved!", "Book save to read offline.", backgroundColor: Colors.green);

  }

  Future<List<LocalDBbookModel>> getStoredBooks() async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve the stored JSON string
    String? existingData = prefs.getString("my_book");

    if (existingData != null) {
      // Decode the JSON string into a list of LocalDBbookModel
      List<dynamic> decodedData = jsonDecode(existingData);
      return decodedData.map((item) => LocalDBbookModel.fromJson(item)).toList();
    }

    // Return an empty list if no data exists
    return [];
  }






}