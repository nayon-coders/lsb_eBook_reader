import 'package:ebook_reader/data/model/single_book_model.dart';
import 'package:ebook_reader/utility/app_color.dart';
import 'package:ebook_reader/view/bottom_navigation_menu/category_screen/screen/fav_this_book_view.dart';
import 'package:ebook_reader/widgets/app_shimmer_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:page_flip/page_flip.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
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
  final pageFlipWidgetsController = GlobalKey<PageFlipWidgetState>();
  final PdfViewerController _pdfViewerController = PdfViewerController();


  int _currentPageNumber = 0;

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
  Widget build(BuildContext context) {

    return  WillPopScope(
      onWillPop: () async {
        // Return false to prevent the back button from closing the screen
        // or implement your custom logic here
        return false; // Disable back button
      },
      child: Scaffold(
        backgroundColor: Colors.white,
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
          print(" controller.isPDFLoading.value --- ${ controller.isPDFLoading.value}");
          print(" controller.isLoading.value --- ${ controller.isLoading.value}");
          // Check if data is loading
          if(controller.isPDFLoading.value){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset("assets/images/book-loading.json", height: 100, width: 100),
                  Text("Loading..."),
                ],
              ),
            );
          }else if (controller.isLoading.value) {
            return _buildBookLoading();
          }
          // Check if the data is null or empty
          else if (controller.peragraphModel.value.data == null || controller.peragraphModel.value.data!.isEmpty) {
            return NotFind(); // Show "Not Found" if no content is available
          }
          else {

            return PageFlipWidget(
              key: pageFlipWidgetsController,
              backgroundColor: Colors.white,
              // isRightSwipe: true,
              //lastPage: Container(color: Colors.white, child: const Center(child: Text('Last Page!'))),
              children: <Widget>[
                for (var i = 0; i < int.parse("${controller.peragraphModel.value.data!.first!.pageNumber}"); i++) _buildPDFBookShow(i) ,
              ],
            );
          }
        }),


        bottomNavigationBar:  Obx(() {
            return controller.isPDFLoading.value ? SizedBox(height: 0,) : _buildBottomBar();
          }
        ),
      ),
    );
  }

  Container _buildPDFBookShow(int i){
    _currentPageNumber = i;
    return Container(

  //    margin: EdgeInsets.only(left: 10, right: 10),
      child: Obx(() {
          return controller.isPDFLoading.value
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text("Loading..."),
                  ],
                ),
              ): AbsorbPointer(
                absorbing: true,
                child: SfPdfViewerTheme(
                  data: SfPdfViewerThemeData(
                    backgroundColor: Color(0xffF5F5F5) //<----
                  ),
                  child: SfPdfViewer.memory(
                    controller.pdfBook.value,
                    maxZoomLevel: 1.3,
                    initialZoomLevel: controller.pageWidth.value,
                    scrollDirection: PdfScrollDirection.horizontal,
                    controller: _pdfViewerController,
                    canShowScrollHead: false,
                    canShowScrollStatus: false,
                    canShowPaginationDialog: false,
                    initialPageNumber: i,
                    enableDoubleTapZooming: false,
                    enableTextSelection: false,
                    enableDocumentLinkAnnotation: true,
                    onHyperlinkClicked: (details) {
                      _showMyDialog(details.uri);
                    },
                  ),
                ),


          );
        }
      ),
    );

  }


  Container _buildBottomBar() {
    return Container(

      padding: const EdgeInsets.only(left: 40, right: 40, top: 5, bottom: 5),
      color: Colors.grey.shade200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //_buildNextPrevious(),
          Obx(() {

            return controller.isPDFLoading.value || controller.isLoading.value ? const Center() :const Text("ব্যাখ্যা ও তথ্য খুঁজুন",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.black),);
           // Text("Total Page ${controller.peragraphModel.value.data!.first.pageNumber}",);
          }
          ),


          // Add the icons for the first and last page
          _buildFontDafination()
        ],
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
        // IconButton(
        //     onPressed: () {
        //       controller.decreaseFontSizePdf();
        //     },
        //     icon: Icon(Icons.text_decrease_outlined)),
        // IconButton(
        //     onPressed: () {
        //       controller.increaseFontSizePdf();
        //     },
        //     icon: Icon(Icons.text_increase_outlined)),
        // SizedBox(width: 20,),


        Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100)
          ),
          child: InkWell(
              onTap: ()=> _showVocabularyList(),
              child: Image.asset("assets/images/definition.png",height: 30,width: 30,)),
        ),
      ],
    );
  }

  Row _buildNextPrevious() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
           setState(() {
             pageFlipWidgetsController.currentState!.previousPage();
           });
           setState(() {

           });
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        Obx(() {
            return Text("Page ${controller.content.length} of ${pageFlipWidgetsController.currentState!.pageNumber+1}",
            );
          }
        ),
        IconButton(
          onPressed: () {
            setState(() {
              pageFlipWidgetsController.currentState!.nextPage();
            });
            setState(() {

            });
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
          RxInt selectedTileId = (-1).obs;
          return Container(
              padding: const EdgeInsets.all(20),
              height: Get.height,
              width: Get.width,
              decoration: const BoxDecoration(
                color: AppColors.bgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Definition", style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBlack,
                  ),),
                  const SizedBox(height: 10,),
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
                                  onTap: (){
                                    if (selectedTileId.value == data.id) {
                                      selectedTileId.value = -1; // Deselect if already selected
                                    } else {
                                      selectedTileId.value = data.id!; // Expand current tile
                                    }
                                  },
                                  title: Text("${data.text}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textBlack,
                                    ),
                                  ),
                                  subtitle: selectedTileId.value==data.id?Text(
                                    "${data.definition}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textBlack,
                                    ),
                                  )
                                      :Text("${data.definition}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
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

  // Helper to build highlighted text with clickable spans
  TextSpan _buildHighlightedTextSpans(BuildContext context, String text, List<String> terms) {
    List<TextSpan> spans = [];
    int start = 0;

    // Sort terms by length (longer first) to avoid nested term overlaps
    terms.sort((a, b) => b.length.compareTo(a.length));

    while (start < text.length) {
      // Find the nearest matching term
      int nearestIndex = text.length;
      String? matchedTerm;
      for (final term in terms) {
        final index = text.indexOf(term, start);
        if (index != -1 && index < nearestIndex) {
          nearestIndex = index;
          matchedTerm = term;
        }
      }

      // If no match is found, add remaining text as a normal span
      if (matchedTerm == null) {
        spans.add(TextSpan(

          text: text.substring(start),
          style: TextStyle(
              color: Colors.black,
              fontSize: controller.fontSize.value,
              wordSpacing: 1.5,
              height: 1.6
          ),
        ));
        break;
      }

      // Add normal text before the matched term
      if (nearestIndex > start) {
        spans.add(TextSpan(
          text: text.substring(start, nearestIndex),
          style: TextStyle(
              color: Colors.black,
              fontSize: controller.fontSize.value,
              wordSpacing: 1.5,
              height: 1.7
          ),
        ));
      }

      // Add highlighted, clickable text for the matched term
      spans.add(TextSpan(
          text: matchedTerm,
          style: TextStyle(
              fontSize: controller.fontSize.value,
              color: Colors.red, fontWeight: FontWeight.bold
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              print("বাসটা --- ${matchedTerm}");
              for (var i in controller.peragraphModel.value.markTextData!) {
                if (i.text == matchedTerm) {
                  Get.defaultDialog(
                    barrierDismissible: false,
                    backgroundColor: Colors.white,
                    title: "${i!.text}",
                    titleStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlack,
                    ),
                    content: Text(i!.definition!),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("Close"),
                      ),
                    ],
                  );
                }
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(content: Text('Clicked on: $matchedTerm')),
                // );
              }
            }
      ));

      // Move the start index past the matched term
      start = nearestIndex + matchedTerm.length;
    }

    return TextSpan(

        children: spans);
  }


  Future<void> _showMyDialog(text) async {
    //logic start
    String defination = "";

    String extractedText = text.split("https://").last;

    for(var i in controller.peragraphModel.value.markTextData!){

      if(i.text!.toLowerCase().contains(extractedText!.toString().toLowerCase())){
        defination = i.definition!;
      }
    }
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: EdgeInsets.only(bottom: 5, left: 5, right: 5),
          contentPadding: EdgeInsets.all(20),
          insetPadding: EdgeInsets.all(20),
          iconPadding: EdgeInsets.all(20),
          content: Container(
            height: 250,
            width: Get.width,

            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColors.linkColor.withOpacity(0.2),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )
                    ),
                    child: Text("$extractedText",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textBlack,
                      ),
                    ),
                  ),

                  Container(
                    height: 250,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: AppColors.menuColor.withOpacity(0.3),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )
                    ),
                    child: Text(defination),
                  ),

                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

// Container _buildBookContent(data) {
//   return Container(
//       padding: const EdgeInsets.all(20),
//       child: Obx(() {
//         return HtmlWidget(data,
//           textStyle: TextStyle(
//             fontSize: controller.fontSize.value,
//           ),
//           customWidgetBuilder: (element) {
//             print("element.localName -- ${element.localName}");
//             // Check if the current element is an <u> tag
//             if (element.localName == 'u') {
//
//               bool isMarked = false;
//               for(var i in controller.peragraphModel.value.markTextData!){
//                 if(i.text!.toLowerCase().contains(element.text.toLowerCase())){
//                   isMarked = true;
//                 }
//               }
//
//               return Obx(() {
//                 return GestureDetector(
//                   onTap: () {
//                     // _showPopup(context, text);
//                     isMarked ? _showMyDialog(element.text) : null;
//                   },
//                   child: HtmlWidget(
//                     element.innerHtml,
//                     textStyle: TextStyle(
//                       fontSize: controller.fontSize.value,
//                     ),
//                   ),
//                 );
//               }
//               );
//             }
//             return null; // Use default rendering for other elements
//           },
//
//
//         );
//       }
//       )
//   );
// }
