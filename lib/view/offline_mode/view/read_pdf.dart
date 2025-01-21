import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:page_flip/page_flip.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../data/model/LocalDBbookModel.dart';
import '../../../utility/app_color.dart';
import '../../../widgets/app_shimmer_pro.dart';
import '../../../widgets/not-find.dart';
import '../controller/pdf_manager_controller.dart';

class OffLineReadPdf extends StatefulWidget {
  const OffLineReadPdf({super.key});

  @override
  State<OffLineReadPdf> createState() => _OffLineReadPdfState();
}

class _OffLineReadPdfState extends State<OffLineReadPdf> {


  SubTopics data = Get.arguments;

  final PdfManager controller = Get.put(PdfManager());
  File pdfPath = File('');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.decryptPdf(data.content!.content!);
   // controller.downloadAndEncryptPdf("https://cloudinary.allbusinesssolution.com/public/uploads/1735746823123-939142684_F5F5F5_DU_English_Topic_Suggestion.pdf", "my_book.pdf");
  }



  int _currentPageNumber = 0;

  final pageFlipWidgetsController = GlobalKey<PageFlipWidgetState>();

  final PdfViewerController _pdfViewerController = PdfViewerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.bgColor,

        leading: IconButton(
          onPressed: () {
           // controller.clearAllData();
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text(
          "${"Book Name"}",
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      body: PageFlipWidget(
        key: pageFlipWidgetsController,
        backgroundColor: Colors.white,
        // isRightSwipe: true,
        //lastPage: Container(color: Colors.white, child: const Center(child: Text('Last Page!'))),
        children: <Widget>[
          for (var i = 0; i < int.parse("${10}"); i++) _buildPDFBookShow(i) ,
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Container _buildPDFBookShow(int i){
    _currentPageNumber = i;
    return Container(

      //    margin: EdgeInsets.only(left: 10, right: 10),
      child:Obx(() {
          if (controller.pdfPath.value.existsSync()) {
            return AbsorbPointer(
              absorbing: true,
              child: SfPdfViewerTheme(
                data: SfPdfViewerThemeData(
                    backgroundColor: Color(0xffF5F5F5) //<----
                ),
                child: SfPdfViewer.file(
                  controller.pdfPath.value,
                  maxZoomLevel: 1.3,
                  initialZoomLevel: 1.0,
                  scrollDirection: PdfScrollDirection.horizontal,
                  controller: _pdfViewerController,
                  canShowScrollHead: false,
                  canShowScrollStatus: false,
                  canShowPaginationDialog: false,
                  initialPageNumber: 1,
                  enableDoubleTapZooming: false,
                  enableTextSelection: false,
                  enableDocumentLinkAnnotation: true,
                  // onHyperlinkClicked: (details) {
                  //   _showMyDialog(details.uri);
                  // },
                ),
              ),


            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      )
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

            return controller.isPDFLoading.value || controller.isLoading.value ? Center() : Text("Total Page 1",
            );
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


        InkWell(
          onTap: ()=> _showVocabularyList(),
          child: Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100)
            ),
            child: InkWell(

                child: Image.asset("assets/images/definition.png",height: 40,width: 40,)),
          ),
        ),
      ],
    );
  }

  //show the vocabulary list
  void _showVocabularyList() {

    showMaterialModalBottomSheet(

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
                  SizedBox(height: 20,),
                  Text("Definition", style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBlack,
                  ),),
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.content!.markTextData!.length,
                      itemBuilder: (context, index) {
                        var markText = data.content!.markTextData![index];
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
                          child:ListTile(
                            title: Text("${markText.text}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textBlack,
                              ),
                            ),
                            subtitle: Text("${markText.definition}",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textBlack,
                              ),
                            ),
                            // trailing: IconButton(
                            //   onPressed: (){
                            //     if( markTextController.markTextFavModel.value.data!.any((item) => item.id == data.id)){
                            //       //markTextController.removeMarkTextFromFave(data.id.toString());
                            //     }else{
                            //       markTextController.addMarkTextToFave(data.id.toString());
                            //     }
                            //
                            //   },
                            //   icon: Icon(
                            //       markTextController.markTextFavModel.value.data!.any((item) => item.id == data.id) ? Icons.favorite : Icons.favorite_border),
                            // ),
                          )
                        );
                      },
                    ),
                  ),
                ],
              )
          );
        });
  }

}
