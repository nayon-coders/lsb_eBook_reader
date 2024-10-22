import 'package:ebook_reader/data/model/single_book_model.dart';
import 'package:ebook_reader/utility/app_color.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/books_screen/controller/reading_controller.dart';
import 'package:ebook_reader/widgets/app_shimmer_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

import '../../../../widgets/not-find.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({super.key});

  @override
  _ReadingScreenState createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  final ReadingController controller = Get.find<ReadingController>();
  final TurnPageController turnController = TurnPageController();

  late BookInfo bookInfo;
  // topic id
   late String topicId;

  @override
  void initState() {
    super.initState();
    bookInfo = Get.arguments["bookInfo"] as BookInfo;
    topicId = Get.arguments["id"] as String;

    print("topicId --- ${topicId}");

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (bookInfo.bookId != null) {
        controller.getParagraph(topicId.toString());
      } else {
        // Handle the case where bookId is null
      }
    });
  }

  @override
  void dispose() {
    //font size reset
    controller.dispose();
    turnController.dispose(); // Dispose of the TurnPageController
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
        // Return false to prevent the back button from closing the screen
        // or implement your custom logic here
        return false; // Disable back button
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: AppColors.bgColor,

          leading: IconButton(
            onPressed: () {
             controller.clearAllData();
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
          title: Text(
            "${bookInfo.bookName}",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return _buildBookLoading();
          } else if (controller.peragraphModel.value.data == null || controller.peragraphModel.value.data!.isEmpty) {
            return  NotFind();
          } else {
            return SizedBox(
              height: Get.height,
              width: Get.width,

              child: Column(
                children: [
                  TurnPageView.builder(
                    useOnTap: true,
                    useOnSwipe: true,
                    onSwipe: (isForward) {
                      print('Tapped on page isForward $isForward');
                      if (isForward ) {
                        controller.currentPage.value++;
                      } else {
                        controller.currentPage.value--;
                      }
                    },
                    onTap: (index) {
                      print('Tapped on page $index');
                      if (index) { // Check if the index is forward
                        controller.currentPage.value ++;
                      } else {
                        controller.currentPage.value--;
                      }
                      //controller.currentPage.value = index;
                    },
                    controller: turnController,
                    itemCount: controller.totalBookPages.value!.length,
                    itemBuilder: (context, index) {
                      var data = controller.totalBookPages.value![index];
                      return _buildBookWidgets(index, data);
                    },
                    overleafColorBuilder: (index) => Colors.grey.shade200,
                    animationTransitionPoint: 0.5,
                  ),
                ],
              ),
            );
          }
        }),

         bottomNavigationBar: _buildBottomBar(),
      ),
    );
  }

  Container _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.grey.shade200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNextPrevious(),


          // Add the icons for the first and last page
          _buildFontDafination()
        ],
      ),
    );
  }

  Container _buildBookWidgets(int index, String data) {
   // controller.currentPage.value = index;
    return Container(
      height: MediaQuery.of(context).size.height*0.76,
      padding: const EdgeInsets.all(15),
      color: Colors.grey.shade200,
      child: Obx(() {
        return Text(
          '$data',
          style: TextStyle(
            fontSize: controller.fontSize.value, // ব্যবহারকারীর নির্ধারিত ফন্ট সাইজ
            fontWeight: FontWeight.w400, // মাঝারি ওজন
            height: 1.7, // লাইন হাইট
            color: Colors.black, // পাঠ্যের রঙ
            fontFamily: 'NotoSans', // বাংলার জন্য উপযুক্ত ফন্ট পরিবার
          ),
          textAlign: TextAlign.justify, // টেক্সট আলাইনমেন্ট
        );
        }
      ),
    );
  }

  Column _buildBookLoading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppShimmerPro.TextShimmer(width: double.infinity, maxLine: 24),
      ],
    );
  }



  //
  ///
  /////////
  /// bottom navigation bar
  Row _buildFontDafination() {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              if(controller.fontSize.value > 15.5) {
                controller.fontSize.value = controller.fontSize.value - 0.1;
              }

            },
            icon: Icon(Icons.text_decrease_outlined)),
        IconButton(
            onPressed: () {
              if(controller.fontSize.value < 16.5) {
                controller.fontSize.value = controller.fontSize.value + 0.1;
              }
              print(" controller.fontSize.value --- ${ controller.fontSize.value}");
            },
            icon: Icon(Icons.text_increase_outlined)),
        SizedBox(width: 20,),


        InkWell(
            onTap: ()=> _showVocabularyList(),
            child: Image.asset("assets/images/definition.png",height: 30,width: 30,)),
      ],
    );
  }

  Row _buildNextPrevious() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
           if(controller.currentPage.value > 1){
             controller.currentPage.value--;
             turnController.previousPage();
           }
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        Obx(() {
          return Text("Page ${controller.currentPage.value} of ${controller.totalBookPages.value!.length}");
        }
        ),
        IconButton(
          onPressed: () {
            controller.currentPage.value++;
            turnController.nextPage();
          },
          icon: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
  //show the vocabulary list
  void _showVocabularyList() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              padding: const EdgeInsets.all(20),
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                color: AppColors.bgColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Definition", style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBlack,
                  ),),
                  SizedBox(height: 10,),
                  Expanded(
                    child: Obx(() {
                      if(controller.peragraphModel.value.markTextData == null || controller.peragraphModel.value.markTextData!.isEmpty){
                        return NotFind();
                      }else{
                        return ListView.builder(
                          itemCount: controller.peragraphModel.value.markTextData!.length,
                          itemBuilder: (context, index) {
                            var data = controller.peragraphModel.value.markTextData![index];
                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 0,
                                    spreadRadius: 0,
                                    offset: const Offset(0, 1.5),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                title: Text("${data.text}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textBlack,
                                  ),
                                ),
                                subtitle: Text("${data.definition}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textBlack,
                                  ),
                                ),
                                trailing: IconButton(
                                  onPressed: (){

                                  },
                                  icon: Icon(Icons.favorite_border),
                                ),
                              ),
                            );
                          },
                        );
                      }

                    }
                    ),
                  ),
                ],
              )
          );
        });
  }

  //////// end bottom navigation bar
  ////
  //


}
