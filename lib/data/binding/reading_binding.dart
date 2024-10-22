import 'package:get/get.dart';

import '../../view/bottom_navigation_menu/books_screen/controller/book_controller.dart';
import '../../view/bottom_navigation_menu/books_screen/controller/reading_controller.dart';

class ReadingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReadingController>(() => ReadingController());
  }
}