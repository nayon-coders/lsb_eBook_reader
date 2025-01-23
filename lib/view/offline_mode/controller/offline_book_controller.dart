import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/model/LocalDBbookModel.dart';
class OfflineBookController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    readData(); //read data from hive box
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
  }

  //add data into hive box
  void addData() {
    //add data into hive box


  }

  RxList<LocalDBbookModel> myBooksList = <LocalDBbookModel>[].obs;
  // Retrieve list of products
  Future<List<LocalDBbookModel>> getMyLocalBook() async {
    final prefs = await SharedPreferences.getInstance();
    final productListString = prefs.getString("my_book");

    if (productListString == null) {
      return [];
    }

    final List<dynamic> productListJson = jsonDecode(productListString);

    print("productListJson ${productListJson}");

    var myBooks =  productListJson
        .map((productJson) => LocalDBbookModel.fromJson(productJson))
        .toList();

    myBooksList.value = myBooks;
    return myBooks;
  }

  Future<void> removeBookById(String bookId) async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve the existing list from SharedPreferences
    String? existingData = prefs.getString("my_book");
    if (existingData != null) {
      // Decode the JSON string to a list of LocalDBbookModel
      List<dynamic> decodedData = jsonDecode(existingData);
      List<LocalDBbookModel> myLocalBookList = decodedData
          .map((item) => LocalDBbookModel.fromJson(item))
          .toList();

      // Remove the item with the matching ID
      myLocalBookList.removeWhere((book) => book.book!.bookId == bookId);

      // Save the updated list back to SharedPreferences
      final updatedJson = myLocalBookList.map((book) => book.toJson()).toList();
      prefs.setString("my_book", jsonEncode(updatedJson));
      getMyLocalBook();
      update();
      Get.back();
    }
  }


  var bookModel = [
    {
      "book_info" : {
        "name" : "Book 1",
        "image" : "Author 1",
      },
      "book_detail" : {
       "book_topics" : [
         {
           "id": 37,
           "name": "Unit 01: Education and Life",
           "book_id": "25",
           "page_number": 5,
           "look_status": "Unlock",
           "created_at": "2024-12-30T16:29:37.000Z",
           "updated_at": "2024-12-30T16:29:37.000Z",
           "sub_tocs": [
             {
               "id": 52,
               "main_toc_id": 37,
               "name": "Lesson 01: The Parrot's Tale",
               "page_number": 1,
               "look_status": "Unlock",
               "is_paragraph": 1,
               "created_at": "2024-12-30T16:30:51.000Z",
               "updated_at": "2024-12-30T16:34:41.000Z",
               "content" : {
                 "content": "https://cloudinary.allbusinesssolution.com/public/uploads/1735713007323-849302653_ebook.pdf",
                 "page_number": 46,
               },
               "markTextData": [
                 {
                   "id": 94,
                   "para_id": 39,
                   "text": "কথামালা",
                   "definition": "কথামালা আমার বাবার আমােক থম উপহার যা আমার মেন পেড়। বইিট হািরেয় গেছ। গিল রেয় গেছ মেনর িভতর। যত বড় হেয়িছ, ",
                   "created_at": "2025-01-01T06:30:12.000Z",
                   "updated_at": "2025-01-01T06:30:12.000Z"
                 },
                 {
                   "id": 95,
                   "para_id": 39,
                   "text": "Shepherd",
                   "definition": "Shepherd রাখাল সাজা নকেড় ধরা খাওয়ার ভেয় এক নকেড় িকছুেতই ভড়ার পােলর কাছ ঘষেতঁ পাের না। তখন জামা-কাপড় চািপেয় স এক রাখাল সেজ িনল। এইবার স সাজা চেল এল ভড়ােলার পােশ। আসল ",
                   "created_at": "2025-01-01T06:30:12.000Z",
                   "updated_at": "2025-01-01T06:30:12.000Z"
                 }
               ]
             },
             {
               "id": 53,
               "main_toc_id": 37,
               "name": "test",
               "page_number": 1,
               "look_status": "Unlock",
               "is_paragraph": 1,
               "created_at": "2025-01-01T05:31:57.000Z",
               "updated_at": "2025-01-01T10:26:35.000Z"
             }
           ]
         },
         {
           "id": 38,
           "name": "Unit 02: Art and Craft",
           "book_id": "25",
           "page_number": 5,
           "look_status": "Unlock",
           "created_at": "2025-01-01T10:28:13.000Z",
           "updated_at": "2025-01-01T10:28:13.000Z",
           "sub_tocs": [
             {
               "id": 56,
               "main_toc_id": 38,
               "name": "Lesson 01",
               "page_number": 1,
               "look_status": "Unlock",
               "is_paragraph": 1,
               "created_at": "2025-01-01T10:28:30.000Z",
               "updated_at": "2025-01-01T15:26:29.000Z"
             },
             {
               "id": 59,
               "main_toc_id": 38,
               "name": "Lesson 02",
               "page_number": 1,
               "look_status": "Unlock",
               "is_paragraph": 1,
               "created_at": "2025-01-01T15:53:24.000Z",
               "updated_at": "2025-01-01T15:57:33.000Z"
             }
           ]
         },
         {
           "id": 39,
           "name": "Written Word List",
           "book_id": "25",
           "page_number": 5,
           "look_status": "Unlock",
           "created_at": "2025-01-01T16:50:16.000Z",
           "updated_at": "2025-01-01T16:50:16.000Z",
           "sub_tocs": [
             {
               "id": 60,
               "main_toc_id": 39,
               "name": "Lesson 01",
               "page_number": 1,
               "look_status": "Unlock",
               "is_paragraph": 1,
               "created_at": "2025-01-01T16:50:30.000Z",
               "updated_at": "2025-01-01T16:53:06.000Z"
             },
             {
               "id": 61,
               "main_toc_id": 39,
               "name": "Print View Word List",
               "page_number": 1,
               "look_status": "Unlock",
               "is_paragraph": 1,
               "created_at": "2025-01-01T16:53:37.000Z",
               "updated_at": "2025-01-01T16:53:56.000Z"
             }
           ]
         }
       ]

      }
    },
    {
      "book_info" : {
        "name" : "Book 1",
        "image" : "Author 1",
      },
      "book_detail" : {
        "book_topics" : [
          {
            "id": 37,
            "name": "Unit 01: Education and Life",
            "book_id": "25",
            "page_number": 5,
            "look_status": "Unlock",
            "created_at": "2024-12-30T16:29:37.000Z",
            "updated_at": "2024-12-30T16:29:37.000Z",
            "sub_tocs": [
              {
                "id": 52,
                "main_toc_id": 37,
                "name": "Lesson 01: The Parrot's Tale",
                "page_number": 1,
                "look_status": "Unlock",
                "is_paragraph": 1,
                "created_at": "2024-12-30T16:30:51.000Z",
                "updated_at": "2024-12-30T16:34:41.000Z",
                "content" : {
                  "content": "https://cloudinary.allbusinesssolution.com/public/uploads/1735713007323-849302653_ebook.pdf",
                  "page_number": 46,
                },
                "markTextData": [
                  {
                    "id": 94,
                    "para_id": 39,
                    "text": "কথামালা",
                    "definition": "কথামালা আমার বাবার আমােক থম উপহার যা আমার মেন পেড়। বইিট হািরেয় গেছ। গিল রেয় গেছ মেনর িভতর। যত বড় হেয়িছ, ",
                    "created_at": "2025-01-01T06:30:12.000Z",
                    "updated_at": "2025-01-01T06:30:12.000Z"
                  },
                  {
                    "id": 95,
                    "para_id": 39,
                    "text": "Shepherd",
                    "definition": "Shepherd রাখাল সাজা নকেড় ধরা খাওয়ার ভেয় এক নকেড় িকছুেতই ভড়ার পােলর কাছ ঘষেতঁ পাের না। তখন জামা-কাপড় চািপেয় স এক রাখাল সেজ িনল। এইবার স সাজা চেল এল ভড়ােলার পােশ। আসল ",
                    "created_at": "2025-01-01T06:30:12.000Z",
                    "updated_at": "2025-01-01T06:30:12.000Z"
                  }
                ]
              },
              {
                "id": 53,
                "main_toc_id": 37,
                "name": "test",
                "page_number": 1,
                "look_status": "Unlock",
                "is_paragraph": 1,
                "created_at": "2025-01-01T05:31:57.000Z",
                "updated_at": "2025-01-01T10:26:35.000Z"
              }
            ]
          },
          {
            "id": 38,
            "name": "Unit 02: Art and Craft",
            "book_id": "25",
            "page_number": 5,
            "look_status": "Unlock",
            "created_at": "2025-01-01T10:28:13.000Z",
            "updated_at": "2025-01-01T10:28:13.000Z",
            "sub_tocs": [
              {
                "id": 56,
                "main_toc_id": 38,
                "name": "Lesson 01",
                "page_number": 1,
                "look_status": "Unlock",
                "is_paragraph": 1,
                "created_at": "2025-01-01T10:28:30.000Z",
                "updated_at": "2025-01-01T15:26:29.000Z"
              },
              {
                "id": 59,
                "main_toc_id": 38,
                "name": "Lesson 02",
                "page_number": 1,
                "look_status": "Unlock",
                "is_paragraph": 1,
                "created_at": "2025-01-01T15:53:24.000Z",
                "updated_at": "2025-01-01T15:57:33.000Z"
              }
            ]
          },
          {
            "id": 39,
            "name": "Written Word List",
            "book_id": "25",
            "page_number": 5,
            "look_status": "Unlock",
            "created_at": "2025-01-01T16:50:16.000Z",
            "updated_at": "2025-01-01T16:50:16.000Z",
            "sub_tocs": [
              {
                "id": 60,
                "main_toc_id": 39,
                "name": "Lesson 01",
                "page_number": 1,
                "look_status": "Unlock",
                "is_paragraph": 1,
                "created_at": "2025-01-01T16:50:30.000Z",
                "updated_at": "2025-01-01T16:53:06.000Z"
              },
              {
                "id": 61,
                "main_toc_id": 39,
                "name": "Print View Word List",
                "page_number": 1,
                "look_status": "Unlock",
                "is_paragraph": 1,
                "created_at": "2025-01-01T16:53:37.000Z",
                "updated_at": "2025-01-01T16:53:56.000Z"
              }
            ]
          }
        ]

      }
    },
    {
      "book_info" : {
        "name" : "Book 1",
        "image" : "Author 1",
      },
      "book_detail" : {
        "book_topics" : [
          {
            "id": 37,
            "name": "Unit 01: Education and Life",
            "book_id": "25",
            "page_number": 5,
            "look_status": "Unlock",
            "created_at": "2024-12-30T16:29:37.000Z",
            "updated_at": "2024-12-30T16:29:37.000Z",
            "sub_tocs": [
              {
                "id": 52,
                "main_toc_id": 37,
                "name": "Lesson 01: The Parrot's Tale",
                "page_number": 1,
                "look_status": "Unlock",
                "is_paragraph": 1,
                "created_at": "2024-12-30T16:30:51.000Z",
                "updated_at": "2024-12-30T16:34:41.000Z",
                "content" : {
                  "content": "https://cloudinary.allbusinesssolution.com/public/uploads/1735713007323-849302653_ebook.pdf",
                  "page_number": 46,
                },
                "markTextData": [
                  {
                    "id": 94,
                    "para_id": 39,
                    "text": "কথামালা",
                    "definition": "কথামালা আমার বাবার আমােক থম উপহার যা আমার মেন পেড়। বইিট হািরেয় গেছ। গিল রেয় গেছ মেনর িভতর। যত বড় হেয়িছ, ",
                    "created_at": "2025-01-01T06:30:12.000Z",
                    "updated_at": "2025-01-01T06:30:12.000Z"
                  },
                  {
                    "id": 95,
                    "para_id": 39,
                    "text": "Shepherd",
                    "definition": "Shepherd রাখাল সাজা নকেড় ধরা খাওয়ার ভেয় এক নকেড় িকছুেতই ভড়ার পােলর কাছ ঘষেতঁ পাের না। তখন জামা-কাপড় চািপেয় স এক রাখাল সেজ িনল। এইবার স সাজা চেল এল ভড়ােলার পােশ। আসল ",
                    "created_at": "2025-01-01T06:30:12.000Z",
                    "updated_at": "2025-01-01T06:30:12.000Z"
                  }
                ]
              },
              {
                "id": 53,
                "main_toc_id": 37,
                "name": "test",
                "page_number": 1,
                "look_status": "Unlock",
                "is_paragraph": 1,
                "created_at": "2025-01-01T05:31:57.000Z",
                "updated_at": "2025-01-01T10:26:35.000Z"
              }
            ]
          },
          {
            "id": 38,
            "name": "Unit 02: Art and Craft",
            "book_id": "25",
            "page_number": 5,
            "look_status": "Unlock",
            "created_at": "2025-01-01T10:28:13.000Z",
            "updated_at": "2025-01-01T10:28:13.000Z",
            "sub_tocs": [
              {
                "id": 56,
                "main_toc_id": 38,
                "name": "Lesson 01",
                "page_number": 1,
                "look_status": "Unlock",
                "is_paragraph": 1,
                "created_at": "2025-01-01T10:28:30.000Z",
                "updated_at": "2025-01-01T15:26:29.000Z"
              },
              {
                "id": 59,
                "main_toc_id": 38,
                "name": "Lesson 02",
                "page_number": 1,
                "look_status": "Unlock",
                "is_paragraph": 1,
                "created_at": "2025-01-01T15:53:24.000Z",
                "updated_at": "2025-01-01T15:57:33.000Z"
              }
            ]
          },
          {
            "id": 39,
            "name": "Written Word List",
            "book_id": "25",
            "page_number": 5,
            "look_status": "Unlock",
            "created_at": "2025-01-01T16:50:16.000Z",
            "updated_at": "2025-01-01T16:50:16.000Z",
            "sub_tocs": [
              {
                "id": 60,
                "main_toc_id": 39,
                "name": "Lesson 01",
                "page_number": 1,
                "look_status": "Unlock",
                "is_paragraph": 1,
                "created_at": "2025-01-01T16:50:30.000Z",
                "updated_at": "2025-01-01T16:53:06.000Z"
              },
              {
                "id": 61,
                "main_toc_id": 39,
                "name": "Print View Word List",
                "page_number": 1,
                "look_status": "Unlock",
                "is_paragraph": 1,
                "created_at": "2025-01-01T16:53:37.000Z",
                "updated_at": "2025-01-01T16:53:56.000Z"
              }
            ]
          }
        ]

      }
    }
  ].obs;

  //read data from hive box
  void readData() {
    //read data from hive box
  }

  //update data into hive box
  void updateData() {
    //update data into hive box
  }

  //delete data from hive box
  void deleteData() {
    //delete data from hive box
  }

  void clearAllData() {
    //clear all data
  }
}
