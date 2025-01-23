import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:page_flip/page_flip.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../controller/reading_controller.dart';

class PageFlipWithSound extends StatefulWidget {
  @override
  _PageFlipWithSoundState createState() => _PageFlipWithSoundState();
}

class _PageFlipWithSoundState extends State<PageFlipWithSound> {
  final ReadingController controller = Get.find<ReadingController>();
  final AudioPlayer audioPlayer = AudioPlayer();
  int currentPage = 0; // Track the current page

  final PdfViewerController _pdfViewerController = PdfViewerController();
  final pageFlipWidgetsController = GlobalKey<PageFlipWidgetState>();


  Future<void> playPageFlipSound() async {
    await audioPlayer.play(AssetSource('page-flip.mp3'));
  }
  var _currentPageNumber = 1;

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  PageFlipWidget(
      key: pageFlipWidgetsController,
      backgroundColor: Colors.white,
      lastPage: Center(child: Text("dsfads"),),
      children: <Widget>[
        for (var i = 0; i < int.parse("${controller.peragraphModel.value.data!.first!.pageNumber}"); i++)
          _buildPDFBookShow(i),
      ],
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
             // CircularProgressIndicator(),
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
              pageSpacing: 0.00,
              onAnnotationAdded: (v){
                playPageFlipSound();
              },
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
              onPageChanged: (v){
                print("yes.... onPageChanged");
                 playPageFlipSound();
              },
              onDocumentLoaded: (v){
                print("yes.... onDocumentLoaded");
              },

              onHyperlinkClicked: (details) {
               // _showMyDialog(details.uri);
              },
            ),
          ),


        );
      }
      ),
    );

  }

}
