import 'package:ebook_reader/view/bottom_navigation_menu/category_screen/controller/mark_text_controller.dart';
import 'package:get/get.dart';
import '../../view/bottom_navigation_menu/category_screen/controller/reading_controller.dart';

class ReadingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReadingController>(() => ReadingController());
    Get.lazyPut<MarkTextController>(() => MarkTextController());
  }
}