import 'dart:convert';

import 'package:ebook_reader/app_config.dart';
import 'package:ebook_reader/data/model/topics_with_book_id.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../../data/model/all_book_model.dart';
import '../../../../data/model/single_book_model.dart';
import '../../../../data/services/api_services.dart';

class BookController extends GetxController{

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




}