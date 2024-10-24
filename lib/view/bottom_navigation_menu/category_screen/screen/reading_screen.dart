import 'package:ebook_reader/data/model/single_book_model.dart';
import 'package:ebook_reader/utility/app_color.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/category_screen/screen/fav_this_book_view.dart';
import 'package:ebook_reader/widgets/app_shimmer_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

import '../../../../widgets/not-find.dart';
import '../controller/mark_text_controller.dart';
import '../controller/reading_controller.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({super.key});

  @override
  _ReadingScreenState createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  final ReadingController controller = Get.find<ReadingController>();
  final MarkTextController markTextController = Get.find<MarkTextController>();
  final TurnPageController turnController = TurnPageController();

  late BookInfo bookInfo;
  // topic id
   late String topicId;

  @override
  void initState() {
    super.initState();
    bookInfo = Get.arguments["bookInfo"] as BookInfo;
    topicId = Get.arguments["id"] as String;


    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (bookInfo.bookId != null) {
        controller.getParagraph(topicId.toString());
        markTextController.getAllMarkTextFromFave();
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
          centerTitle: true,
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
          actions: [
            IconButton(
              onPressed: () =>Get.to(FavThisBookView()),
              icon: const Icon(Icons.favorite),
            ),
            SizedBox(width: 10,),
          ],
        ),
        body: Obx(() {
          // Check if data is loading
          if (controller.isLoading.value) {
            return _buildBookLoading();
          }
          // Check if the data is null or empty
          else if (controller.peragraphModel.value.data == null || controller.peragraphModel.value.data!.isEmpty) {
            return NotFind(); // Show "Not Found" if no content is available
          }
          // Check if totalBookPages is populated
          else if (controller.totalBookPages.value == null || controller.totalBookPages.value!.isEmpty) {
            return Center(child: Text("No pages available."));
          }
          else {
            return SizedBox(
              height: Get.height,
              width: Get.width,
              child: Column(
                children: [
                  TurnPageView.builder(
                    useOnTap: false,
                    useOnSwipe: true,
                    onSwipe: (isForward) {
                      print('Tapped on page isForward $isForward');
                      if (isForward) {
                        controller.currentPage.value++;
                      } else {
                        controller.currentPage.value--;
                      }
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
    print("data 00000 ${data}");
    return Container(
      height: MediaQuery.of(context).size.height*0.76,
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      child: Obx(() {
          return HtmlWidget(
            data,
            textStyle: TextStyle(
              fontSize: controller.fontSize.value,
              color: Colors.black,
              letterSpacing: 0.5,
              height: 1.7,

            ),
            onTapUrl: (url)  {
              print("yes you click on url $url");
              return true; // Return null to let the widget handle the URL
            },
            // Apply padding and alignment to fit the text nicely within the screen
            customStylesBuilder: (element) {
              return {
                'text-align': 'justify',  // Justify text for a book-like effect
              };
            },

            // Custom render for specific tags (like bold, italics, etc.)
            customWidgetBuilder: (element) {
              if (element.localName == 'b') {
                return Text(
                  element.text,  // Render bold text
                  style: TextStyle(fontWeight: FontWeight.bold),
                );
              }
              return null;
            },
          );
        }
      )
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
                        //    markTextController.checkMarkTextIsAdded(data.id.toString());
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
                              child: Obx(() {
                                  return ListTile(
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
                                        if( markTextController.markTextFavModel.value.data!.any((item) => item.id == data.id)){
                                          //markTextController.removeMarkTextFromFave(data.id.toString());
                                        }else{
                                          markTextController.addMarkTextToFave(data.id.toString());
                                        }

                                      },
                                      icon: Icon(
                                          markTextController.markTextFavModel.value.data!.any((item) => item.id == data.id) ? Icons.favorite : Icons.favorite_border),
                                    ),
                                  );
                                }
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
